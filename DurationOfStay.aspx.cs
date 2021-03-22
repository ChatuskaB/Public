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
  public partial class DurationOfStay : System.Web.UI.Page
  {
    static string conString = ConfigurationManager.AppSettings["ConString"];

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [WebMethod()]
    public static string DurationOfStayReport(string date1, string date2)
    {
      try
      {

        SqlConnection conn = new SqlConnection(conString);
        conn.Open();

        using (SqlConnection con = new SqlConnection(conString))
        {
          using (SqlCommand cmd = new SqlCommand("SpDurationOfStay", con))
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
        // SqlConnection conn = new SqlConnection(conString);
        // conn.Open();

        //// string sqlquery = " SELECT TbCards.TotalTime, TbCards.InTime, VehCategory FROM  TbCards INNER JOIN TbVehicleCategory ON TbVehicleCategory.id = TbCards.VehType ";

        // // 1. create a command object identifying
        // // the stored procedure
        // SqlCommand sqlquery = new SqlCommand("SpDurationOfStay", conn);

        // // 2. set the command object so it knows
        // // to execute a stored procedure
        // sqlquery.CommandType = CommandType.StoredProcedure;

        // // 3. add parameter to command, which
        // // will be passed to the stored procedure
        // sqlquery.Parameters.Add(new SqlParameter("@Date1", date1));
        // sqlquery.Parameters.Add(new SqlParameter("@Date2", date2));

        // sqlquery.ExecuteNonQuery();

        // using (SqlDataAdapter a = new SqlDataAdapter("SpDurationOfStay", conn))
        // {
        //   DataTable t = new DataTable();
        //   a.Fill(t);
        //   conn.Close();

        //   System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //   return JsonConvert.SerializeObject(t);
        // }


      }
      catch (Exception)
      {
        return "";
      }
    }
  }


}
