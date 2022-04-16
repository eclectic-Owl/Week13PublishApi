#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Group_3_Week_11_DB_API.Data;
using Group_3_Week_11_DB_API.Models;

namespace Group_3_Week_11_DB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacultyClassesController : ControllerBase
    {
        private readonly Wossamotta_UContext _context;

        public FacultyClassesController(Wossamotta_UContext context)
        {
            _context = context;
        }

        // GET: api/FacultyClasses
        [HttpGet]
        public async Task<ActionResult<IEnumerable<FacultyClass>>> GetFacultyClasses()
        {
            return await _context.FacultyClasses.ToListAsync();
        }

        // GET: api/FacultyClasses/5
        [HttpGet("{id}")]
        public async Task<ActionResult<FacultyClass>> GetFacultyClass(string id)
        {
            var facultyClass = await _context.FacultyClasses.FindAsync(id);

            if (facultyClass == null)
            {
                return NotFound();
            }

            return facultyClass;
        }

        // PUT: api/FacultyClasses/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFacultyClass(string id, FacultyClass facultyClass)
        {
            if (id != facultyClass.FacultyClassesId)
            {
                return BadRequest();
            }

            _context.Entry(facultyClass).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FacultyClassExists(id))
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

        // POST: api/FacultyClasses
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<FacultyClass>> PostFacultyClass(FacultyClass facultyClass)
        {
            _context.FacultyClasses.Add(facultyClass);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (FacultyClassExists(facultyClass.FacultyClassesId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetFacultyClass", new { id = facultyClass.FacultyClassesId }, facultyClass);
        }

        // DELETE: api/FacultyClasses/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFacultyClass(string id)
        {
            var facultyClass = await _context.FacultyClasses.FindAsync(id);
            if (facultyClass == null)
            {
                return NotFound();
            }

            _context.FacultyClasses.Remove(facultyClass);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool FacultyClassExists(string id)
        {
            return _context.FacultyClasses.Any(e => e.FacultyClassesId == id);
        }
    }
}
