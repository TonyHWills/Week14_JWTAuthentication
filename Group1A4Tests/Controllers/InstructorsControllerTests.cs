using Microsoft.VisualStudio.TestTools.UnitTesting;
using Group1A4.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Group1A4.Controllers.Tests
{
    [TestClass()]
    public class InstructorsControllerTests
    {
        public SqlCommand SqlCommand { get; private set; }

        [TestMethod]
        public void instructorID()
        {
            // Create a connection to the database
            string connectionString = "Data Source=DESKTOP-LDHGI42;Initial Catalog=School;User ID=sa;Password=9479;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT instructor_id FROM instructor";

            SqlCommand command = new SqlCommand(query, connection);

            var expectedValue = "1";

            connection.Open();
            string fieldValue = command.ExecuteScalar().ToString();
            connection.Close();

            Assert.AreEqual(expectedValue, fieldValue);
        }
    }
}