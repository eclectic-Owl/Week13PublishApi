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
    public class ClassSubjectsController : ControllerBase
    {
        private readonly Wossamotta_UContext _context;

        public ClassSubjectsController(Wossamotta_UContext context)
        {
            _context = context;
        }

        // GET: api/ClassSubjects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ClassSubject>>> GetClassSubjects()
        {
            return await _context.ClassSubjects.ToListAsync();
        }

        // GET: api/ClassSubjects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ClassSubject>> GetClassSubject(string id)
        {
            var classSubject = await _context.ClassSubjects.FindAsync(id);

            if (classSubject == null)
            {
                return NotFound();
            }

            return classSubject;
        }

        // PUT: api/ClassSubjects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutClassSubject(string id, ClassSubject classSubject)
        {
            if (id != classSubject.ClassSubjectId)
            {
                return BadRequest();
            }

            _context.Entry(classSubject).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClassSubjectExists(id))
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

        // POST: api/ClassSubjects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ClassSubject>> PostClassSubject(ClassSubject classSubject)
        {
            _context.ClassSubjects.Add(classSubject);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ClassSubjectExists(classSubject.ClassSubjectId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetClassSubject", new { id = classSubject.ClassSubjectId }, classSubject);
        }

        // DELETE: api/ClassSubjects/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteClassSubject(string id)
        {
            var classSubject = await _context.ClassSubjects.FindAsync(id);
            if (classSubject == null)
            {
                return NotFound();
            }

            _context.ClassSubjects.Remove(classSubject);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ClassSubjectExists(string id)
        {
            return _context.ClassSubjects.Any(e => e.ClassSubjectId == id);
        }
    }
}
