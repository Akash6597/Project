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
    public class VisitsController : ControllerBase
    {
        private readonly HospitalContext _context;

        public VisitsController(HospitalContext context)
        {
            _context = context;
        }

        // GET: api/Visits
        [HttpGet]
        public async Task<ActionResult<IEnumerable<vVisit>>> GetVisits()
        {
            return await _context.vVisits.ToListAsync();
            /*            var visit = await _context.Visits.Include(d => d.Doctors).Include(p => p.Patients).Include(a => a.Assistants).ToListAsync();

                        var v = (from vis in _context.Visits
                                 join d in _context.Doctors on vis.DoctorId equals d.DoctorId
                                 join p in _context.Patients on vis.PatientId equals p.PatientId
                                 join a in _context.Assistants on vis.AssistantId equals a.AssistantId
                                 select new
                                 {
                                     vis.VisitId,
                                     d.DoctorName,
                                     p.PatientName,
                                     a.AssistantName
                                 }).ToListAsync();


                        return visit;*/
        }

        // GET: api/Visits/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Visit>> GetVisit(int id)
        {
            var visit = await _context.Visits.FindAsync(id);

            if (visit == null)
            {
                return NotFound();
            }

            return visit;
        }

        // PUT: api/Visits/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVisit(int id, Visit visit)
        {
            if (id != visit.VisitId)
            {
                return BadRequest();
            }

            _context.Entry(visit).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VisitExists(id))
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

        // POST: api/Visits
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Visit>> PostVisit(Visit visit)
        {
            _context.Visits.Add(visit);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetVisit", new { id = visit.VisitId }, visit);
        }

        // DELETE: api/Visits/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Visit>> DeleteVisit(int id)
        {
            var visit = await _context.Visits.FindAsync(id);
            if (visit == null)
            {
                return NotFound();
            }

            _context.Visits.Remove(visit);
            await _context.SaveChangesAsync();

            return visit;
        }

        private bool VisitExists(int id)
        {
            return _context.Visits.Any(e => e.VisitId == id);
        }
    }
}
