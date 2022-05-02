using Microsoft.VisualStudio.TestTools.UnitTesting;
using Group_3_Week_11_DB_API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Group_3_Week_11_DB_API.Controllers.AuthenticationController;
using static Group_3_Week_11_DB_API.Controllers.ClassesController;
using static Group_3_Week_11_DB_API.Controllers.StudentsController;
namespace Group_3_Week_11_DB_API.Tests
{
    [TestClass()]
    public class JwtAuthenticationManagerTests
    {
        [TestMethod()]
        public void JwtAuthenticationManagerTest()
        {
            JwtAuthenticationManager manager = new JwtAuthenticationManager("fakepassword12345!");
            User user = new User
            {
                Username = "TestUserFalse",
                Password = "TestPasswordFalse!!!"
            };

            var ret = manager.Authenticate(user.Username, user.Password);
            Assert.IsNull(ret);
            Assert.IsNotNull(manager.Authenticate("test","password"));
            
        
        }
    }
}