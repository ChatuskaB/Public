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
  public partial class DailyReports : System.Web.UI.Page

  {

    static string conString = ConfigurationManager.AppSettings["ConString"];

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod()]
    public static string Loaddailyreports(string date1, string date2)
    {
      try
      {
        SqlConnection conn = new SqlConnection(conString);
        conn.Open();

        string sqlquery = " SELECT TbCards.id,CardNo,InTime, OutTime ,TotalAmount , TotalTime, VehCategory FROM  TbCards INNER JOIN TbVehicleCategory ON TbVehicleCategory.id = TbCards.VehType ";



        

        if ((date1.Length > 0 && date1 != "") &&  (date2.Length > 0 && date2 != ""))
        {

             sqlquery += " where   cast(InTime as date) between '" + date1 + "' and  '" + date2 + "' ORDER BY InTime ";


        }

        

        using (SqlDataAdapter a = new SqlDataAdapter(sqlquery, conn))
        {
          DataTable t = new DataTable();
          a.Fill(t);
          conn.Close();

          System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
          return JsonConvert.SerializeObject(t);
        }


      }
      catch (Exception)
      {
        return "";
      }
    }

}

}