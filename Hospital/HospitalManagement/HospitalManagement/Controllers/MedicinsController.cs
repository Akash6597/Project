using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Models;

namespace HospitalManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicinsController : ControllerBase
    {
        private readonly HospitalContext _context;

        public MedicinsController(HospitalContext context)
        {
            _context = context;
        }

        // GET: api/Medicins
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Medicin>>> GetMedicins()
        {
            return await _context.Medicins.ToListAsync();
        }

        // GET: api/Medicins/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Medicin>> GetMedicin(int id)
        {
            var medicin = await _context.Medicins.FindAsync(id);

            if (medicin == null)
            {
                return NotFound();
            }

            return medicin;
        }

        // PUT: api/Medicins/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMedicin(int id, Medicin medicin)
        {
            if (id != medicin.MedicinId)
            {
                return BadRequest();
            }

            _context.Entry(medicin).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MedicinExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Medicins
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Medicin>> PostMedicin(Medicin medicin)
        {
            _context.Medicins.Add(medicin);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMedicin", new { id = medicin.MedicinId }, medicin);
        }

        // DELETE: api/Medicins/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Medicin>> DeleteMedicin(int id)
        {
            var medicin = await _context.Medicins.FindAsync(id);
            if (medicin == null)
            {
                return NotFound();
            }

            _context.Medicins.Remove(medicin);
            await _context.SaveChangesAsync();

            return medicin;
        }

        private bool MedicinExists(int id)
        {
            return _context.Medicins.Any(e => e.MedicinId == id);
        }
    }
}
