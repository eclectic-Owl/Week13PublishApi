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
    public class StudentSchedulesController : ControllerBase
    {
        private readonly Wossamotta_UContext _context;

        public StudentSchedulesController(Wossamotta_UContext context)
        {
            _context = context;
        }

        // GET: api/StudentSchedules
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StudentSchedule>>> GetStudentSchedules()
        {
            return await _context.StudentSchedules.ToListAsync();
        }

        // GET: api/StudentSchedules/5
        [HttpGet("{id}")]
        public async Task<ActionResult<StudentSchedule>> GetStudentSchedule(string id)
        {
            var studentSchedule = await _context.StudentSchedules.FindAsync(id);

            if (studentSchedule == null)
            {
                return NotFound();
            }

            return studentSchedule;
        }

        // PUT: api/StudentSchedules/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStudentSchedule(string id, StudentSchedule studentSchedule)
        {
            if (id != studentSchedule.ScheduleId)
            {
                return BadRequest();
            }

            _context.Entry(studentSchedule).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StudentScheduleExists(id))
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

        // POST: api/StudentSchedules
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<StudentSchedule>> PostStudentSchedule(StudentSchedule studentSchedule)
        {
            _context.StudentSchedules.Add(studentSchedule);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (StudentScheduleExists(studentSchedule.ScheduleId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetStudentSchedule", new { id = studentSchedule.ScheduleId }, studentSchedule);
        }

        // DELETE: api/StudentSchedules/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStudentSchedule(string id)
        {
            var studentSchedule = await _context.StudentSchedules.FindAsync(id);
            if (studentSchedule == null)
            {
                return NotFound();
            }

            _context.StudentSchedules.Remove(studentSchedule);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool StudentScheduleExists(string id)
        {
            return _context.StudentSchedules.Any(e => e.ScheduleId == id);
        }
    }
}
