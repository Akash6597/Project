using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using School.Models;

namespace School.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ParentDetailsController : ControllerBase
    {
        private readonly SchoolContext _context;

        public ParentDetailsController(SchoolContext context)
        {
            _context = context;
        }

        // GET: api/ParentDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ParentDetail>>> GetParentDetails()
        {
            return await _context.ParentDetails.ToListAsync();
        }

        // GET: api/ParentDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ParentDetail>> GetParentDetail(int id)
        {
            var parentDetail = await _context.ParentDetails.FindAsync(id);

            if (parentDetail == null)
            {
                return NotFound();
            }

            return parentDetail;
        }

        // PUT: api/ParentDetails/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutParentDetail(int id, ParentDetail parentDetail)
        {
            if (id != parentDetail.ParentId)
            {
                return BadRequest();
            }

            _context.Entry(parentDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ParentDetailExists(id))
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

        // POST: api/ParentDetails
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<ParentDetail>> PostParentDetail(ParentDetail parentDetail)
        {
            _context.ParentDetails.Add(parentDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetParentDetail", new { id = parentDetail.ParentId }, parentDetail);
        }

        // DELETE: api/ParentDetails/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ParentDetail>> DeleteParentDetail(int id)
        {
            var parentDetail = await _context.ParentDetails.FindAsync(id);
            if (parentDetail == null)
            {
                return NotFound();
            }

            _context.ParentDetails.Remove(parentDetail);
            await _context.SaveChangesAsync();

            return parentDetail;
        }

        private bool ParentDetailExists(int id)
        {
            return _context.ParentDetails.Any(e => e.ParentId == id);
        }
    }
}
