using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarParkingSystem
{
  public partial class LoginDetailReport : System.Web.UI.Page
  {
    static string conString = ConfigurationManager.AppSettings["ConString"];
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod()]
    public static string LoginReport(string date1, string date2)
    {
      try
      {

        SqlConnection conn = new SqlConnection(conString);
        conn.Open();

        using (SqlConnection con = new SqlConnection(conString))
        {
          using (SqlCommand cmd = new SqlCommand("SpLoginDetail", con))
          {
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Date1", SqlDbType.VarChar).Value = date1;
            cmd.Parameters.Add("@Date2", SqlDbType.VarChar).Value = date2;

            con.Open();

            SqlDataReader rd = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(rd);

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(dt);
          }
        }

      }
      catch (Exception)
      {
        return "";
      }
    }
  }
}