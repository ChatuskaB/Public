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
  public partial class Login : System.Web.UI.Page
  {
    static string conString = ConfigurationManager.AppSettings["ConString"];
    protected void Page_Load(object sender, EventArgs e)
    {
    
    }

    [WebMethod()]
    public static string LoginMethord(string username, string password)
    {
      try
      {
        SqlConnection conn = new SqlConnection(conString);
        conn.Open();

        string sqlquery = " SELECT UserName, Password, UserLevel FROM TbUser where   UserName = '" + username + "' AND Password =  '" + password + "' COLLATE SQL_Latin1_General_CP1_CS_AS AND UserLevel =  '1' AND Active =  '1' ";
        
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