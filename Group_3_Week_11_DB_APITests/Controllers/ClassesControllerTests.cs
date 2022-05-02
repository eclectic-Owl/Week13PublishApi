using Microsoft.VisualStudio.TestTools.UnitTesting;
using Group_3_Week_11_DB_API.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Group_3_Week_11_DB_API.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;

namespace Group_3_Week_11_DB_API.Controllers.Tests
{
    [TestClass()]
    public class ClassesControllerTests
    {
        private Wossamotta_UContext context;

        [TestMethod()]
        [ExpectedException(typeof(DbUpdateConcurrencyException))]
        public void PutClass()
        {
            //PutClass badClass = new PutClass();



        }
        
    }
}