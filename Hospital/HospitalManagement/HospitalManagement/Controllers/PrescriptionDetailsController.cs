using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Models;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace HospitalManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrescriptionDetailsController : ControllerBase
    {
        private readonly HospitalContext _context;

        public PrescriptionDetailsController(HospitalContext context)
        {
            _context = context;
        }

        // GET: api/PrescriptionDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<vPrescription>>> GetPrescriptionDetails()
        {
            return await _context.vPrescriptions.ToListAsync();
        }

        // GET: api/PrescriptionDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PrescriptionDetail>> GetPrescriptionDetail(int id)
        {
            var prescriptionDetail = await _context.PrescriptionDetails.FindAsync(id);

            if (prescriptionDetail == null)
            {
                return NotFound();
            }

            return prescriptionDetail;
        }

        // PUT: api/PrescriptionDetails/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPrescriptionDetail(int id, PrescriptionDetail prescriptionDetail)
        {
            if (id != prescriptionDetail.PrescriptionDetailId)
            {
                return BadRequest();
            }

            _context.Entry(prescriptionDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PrescriptionDetailExists(id))
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

        // POST: api/PrescriptionDetails
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<PrescriptionDetail>> PostPrescriptionDetail(PrescriptionDetail prescriptionDetail)
        {

            _context.PrescriptionDetails.Add(prescriptionDetail);

            /*Prescription prescription = new Prescription();
            prescription.MedicineId = prescriptionDetail.MedicineId;
            prescription.TimeToTake = prescriptionDetail.TimeToTake;
            */
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetPrescriptionDetail", new { id = prescriptionDetail.PrescriptionDetailId }, prescriptionDetail);
        }

        // DELETE: api/PrescriptionDetails/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PrescriptionDetail>> DeletePrescriptionDetail(int id)
        {
            var prescriptionDetail = await _context.PrescriptionDetails.FindAsync(id);
            if (prescriptionDetail == null)
            {
                return NotFound();
            }

            _context.PrescriptionDetails.Remove(prescriptionDetail);
            await _context.SaveChangesAsync();

            return prescriptionDetail;
        }

        private bool PrescriptionDetailExists(int id)
        {
            return _context.PrescriptionDetails.Any(e => e.PrescriptionDetailId == id);
        }
    }
}
