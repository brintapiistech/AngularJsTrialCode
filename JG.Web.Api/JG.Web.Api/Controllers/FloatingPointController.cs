using JG.Web.Api.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace JG.Web.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FloatingPointController : ControllerBase
    {
        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        private readonly IConfiguration _configuration;
        public FloatingPointController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        public JsonResult Get()
        {
            try
            {
                string sqlDataSource = _configuration.GetConnectionString("DevConnection");
                SqlConnection conn = new SqlConnection(sqlDataSource);
                cmd = new SqlCommand("GetAllFloatingPoint", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable table = new DataTable();
                conn.Open();
                int a = cmd.ExecuteNonQuery();
                rdr = cmd.ExecuteReader();
                table.Load(rdr);
                conn.Close();
                return new JsonResult(table);
            }
            catch (Exception ex)
            {
                return new JsonResult(ex.Message);
            }
        }
        [HttpPost]
        public JsonResult Post(FloatingPoint floatingPoint)
        {
            string sqlDataSource = _configuration.GetConnectionString("DevConnection");
            SqlConnection conn = new SqlConnection(sqlDataSource);
            cmd = new SqlCommand("InsertFloatingPoint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", floatingPoint.Id);
            cmd.Parameters.AddWithValue("FloatingPointId", Guid.NewGuid());
            cmd.Parameters.AddWithValue("Name ", floatingPoint.Name);
            cmd.Parameters.AddWithValue("District ", floatingPoint.District);
            cmd.Parameters.AddWithValue("City", floatingPoint.City);
            cmd.Parameters.AddWithValue("Lat", floatingPoint.Lat);
            cmd.Parameters.AddWithValue("Lng", floatingPoint.Lng);
            cmd.Parameters.AddWithValue("IsDealer", floatingPoint.IsDealer);
            cmd.Parameters.AddWithValue("CreatedBy", Guid.NewGuid());
            cmd.Parameters.AddWithValue("CreatedDate", DateTime.UtcNow);
            

            cmd.Parameters.AddWithValue("RouteDay", "");
            cmd.Parameters.AddWithValue("ShopName", "");
            cmd.Parameters.AddWithValue("OwnerName", "");
            cmd.Parameters.AddWithValue("OwnerPhone", "");
            cmd.Parameters.AddWithValue("Competitor1TvWalton", 0);
            cmd.Parameters.AddWithValue("Competitor1RfWalton", 0);
            cmd.Parameters.AddWithValue("Competitor2TvVision", 0);
            cmd.Parameters.AddWithValue("Competitor2RfVision", 0);
            cmd.Parameters.AddWithValue("Competitor3TvMarcel", 0);
            cmd.Parameters.AddWithValue("Competitor3RfMinister", 0);
            cmd.Parameters.AddWithValue("MonthlySaleTv", 0);
            cmd.Parameters.AddWithValue("MonthlySaleRf", 0);
            cmd.Parameters.AddWithValue("MonthlySaleAc", 0);
            cmd.Parameters.AddWithValue("ShowroomSize", 0);
            cmd.Parameters.AddWithValue("DisplayOut", 0);
            cmd.Parameters.AddWithValue("DisplayIn", 0);
            conn.Open();
            int a = cmd.ExecuteNonQuery();
            conn.Close();
            if (a > 0)
            {
                return new JsonResult("Saved");
            }
            return new JsonResult(0);
        }
        [HttpPut]
        public JsonResult Put(FloatingPoint floatingPoint)
        {
            string sqlDataSource = _configuration.GetConnectionString("DevConnection");
            SqlConnection conn = new SqlConnection(sqlDataSource);
            cmd = new SqlCommand("UpdateFloatingPoint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", floatingPoint.Id);
            cmd.Parameters.AddWithValue("FloatingPointId", Guid.NewGuid());
            cmd.Parameters.AddWithValue("Name ", floatingPoint.Name);
            cmd.Parameters.AddWithValue("District ", floatingPoint.District);
            cmd.Parameters.AddWithValue("City", floatingPoint.City);
            cmd.Parameters.AddWithValue("Lat", floatingPoint.Lat);
            cmd.Parameters.AddWithValue("Lng", floatingPoint.Lng);
            cmd.Parameters.AddWithValue("IsDealer", floatingPoint.IsDealer);
            cmd.Parameters.AddWithValue("CreatedBy", Guid.NewGuid());
            cmd.Parameters.AddWithValue("CreatedDate", DateTime.UtcNow);
            cmd.Parameters.AddWithValue("RouteDay", floatingPoint.RouteDay);
            cmd.Parameters.AddWithValue("ShopName", floatingPoint.ShopName);
            cmd.Parameters.AddWithValue("OwnerName", floatingPoint.OwnerName);
            cmd.Parameters.AddWithValue("OwnerPhone", floatingPoint.OwnerPhone);
            cmd.Parameters.AddWithValue("Competitor1TvWalton", floatingPoint.Competitor1TvWalton);
            cmd.Parameters.AddWithValue("Competitor1RfWalton", floatingPoint.Competitor1RfWalton);
            cmd.Parameters.AddWithValue("Competitor2TvVision", floatingPoint.Competitor2TvVision);
            cmd.Parameters.AddWithValue("Competitor2RfVision", floatingPoint.Competitor2RfVision);
            cmd.Parameters.AddWithValue("Competitor3TvMarcel", floatingPoint.Competitor3TvMarcel);
            cmd.Parameters.AddWithValue("Competitor3RfMinister", floatingPoint.Competitor3RfMinister);
            cmd.Parameters.AddWithValue("MonthlySaleTv", floatingPoint.MonthlySaleTv);
            cmd.Parameters.AddWithValue("MonthlySaleRf", floatingPoint.MonthlySaleRf);
            cmd.Parameters.AddWithValue("MonthlySaleAc", floatingPoint.MonthlySaleAc);
            cmd.Parameters.AddWithValue("ShowroomSize", floatingPoint.ShowroomSize);
            cmd.Parameters.AddWithValue("DisplayOut", floatingPoint.DisplayOut);
            cmd.Parameters.AddWithValue("DisplayIn", floatingPoint.DisplayIn);
            conn.Open();
            int a = cmd.ExecuteNonQuery();
            conn.Close();
            if (a > 0)
            {
                return new JsonResult("Updated");
            }
            return new JsonResult(0);
        }
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            if (id > 0)
            {
                string sqlDataSource = _configuration.GetConnectionString("DevConnection");
                SqlConnection conn = new SqlConnection(sqlDataSource);
                cmd = new SqlCommand("DeleteFloatingPoint", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Id", id);
                conn.Open();
                int a = cmd.ExecuteNonQuery();
                conn.Close();
                if (a > 0)
                {
                    return new JsonResult("Deleted");
                }
            }
            return new JsonResult(0);
        }
    }
}
