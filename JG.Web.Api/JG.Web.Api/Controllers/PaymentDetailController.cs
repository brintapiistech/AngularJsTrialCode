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
    public class PaymentDetailController : ControllerBase
    {

        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        private readonly IConfiguration _configuration;

        public PaymentDetailController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpGet]
        public JsonResult Get()
        {
            string sqlDataSource = _configuration.GetConnectionString("DevConnection");
            SqlConnection conn = new SqlConnection(sqlDataSource);
            cmd = new SqlCommand("select * from dbo.PaymentDetail", conn);
            cmd.CommandType = CommandType.Text;
            conn.Open();
            int a = cmd.ExecuteNonQuery();
            DataTable table = new DataTable();
            rdr = cmd.ExecuteReader();
            table.Load(rdr);
            conn.Close();
            return new JsonResult(table);
        }
        [HttpPost]
        public JsonResult Post(PaymentDetail paymentDetail)
        {
            string sqlDataSource = _configuration.GetConnectionString("DevConnection");
            SqlConnection conn = new SqlConnection(sqlDataSource);
            cmd = new SqlCommand("usp_PaymentDetail_InsertOrUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CardOwnerName", paymentDetail.CardOwnerName);
            cmd.Parameters.AddWithValue("CardNumber ", paymentDetail.CardNumber);
            cmd.Parameters.AddWithValue("ExpirationDate", paymentDetail.ExpirationDate);
            cmd.Parameters.AddWithValue("CVV", paymentDetail.CVV);
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
        public JsonResult Put(PaymentDetail paymentDetail)
        {
            string sqlDataSource = _configuration.GetConnectionString("DevConnection");
            SqlConnection conn = new SqlConnection(sqlDataSource);
            cmd = new SqlCommand("usp_PaymentDetail_InsertOrUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("PMId", paymentDetail.PMId);
            cmd.Parameters.AddWithValue("CardOwnerName", paymentDetail.CardOwnerName);
            cmd.Parameters.AddWithValue("CardNumber ", paymentDetail.CardNumber);
            cmd.Parameters.AddWithValue("ExpirationDate", paymentDetail.ExpirationDate);
            cmd.Parameters.AddWithValue("CVV", paymentDetail.CVV);
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
            string sqlDataSource = _configuration.GetConnectionString("DevConnection");
            SqlConnection conn = new SqlConnection(sqlDataSource);
            string sql = @"delete dbo.PaymentDetail where PMId=" + id;
            cmd = new SqlCommand(sql, conn);
            cmd.CommandType = CommandType.Text;
            conn.Open();
            int a = cmd.ExecuteNonQuery();
            rdr = cmd.ExecuteReader();
            conn.Close();
            if (a > 0)
            {
                return new JsonResult("Deleted");
            }
            return new JsonResult(0);
        }
    }
}
