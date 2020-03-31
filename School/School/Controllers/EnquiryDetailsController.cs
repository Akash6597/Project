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
    public class EnquiryDetailsController : ControllerBase
    {
        private readonly SchoolContext _context;

        public EnquiryDetailsController(SchoolContext context)
        {
            _context = context;
        }

        // GET: api/EnquiryDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EnquiryDetail>>> GetEnquiryDetails()
        {
            return await _context.EnquiryDetails.ToListAsync();
        }

        // GET: api/EnquiryDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<EnquiryDetail>> GetEnquiryDetail(int id)
        {
            var enquiryDetail = await _context.EnquiryDetails.FindAsync(id);

            if (enquiryDetail == null)
            {
                return NotFound();
            }

            return enquiryDetail;
        }

        // PUT: api/EnquiryDetails/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEnquiryDetail(int id, EnquiryDetail enquiryDetail)
        {
            if (id != enquiryDetail.EnquiryId)
            {
                return BadRequest();
            }

            _context.Entry(enquiryDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EnquiryDetailExists(id))
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

        // POST: api/EnquiryDetails
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<EnquiryDetail>> PostEnquiryDetail(EnquiryDetail enquiryDetail)
        {
            _context.EnquiryDetails.Add(enquiryDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEnquiryDetail", new { id = enquiryDetail.EnquiryId }, enquiryDetail);
        }

        // DELETE: api/EnquiryDetails/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<EnquiryDetail>> DeleteEnquiryDetail(int id)
        {
            var enquiryDetail = await _context.EnquiryDetails.FindAsync(id);
            if (enquiryDetail == null)
            {
                return NotFound();
            }

            _context.EnquiryDetails.Remove(enquiryDetail);
            await _context.SaveChangesAsync();

            return enquiryDetail;
        }

        private bool EnquiryDetailExists(int id)
        {
            return _context.EnquiryDetails.Any(e => e.EnquiryId == id);
        }
    }
}
