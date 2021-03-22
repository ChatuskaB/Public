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
  public partial class Customer : System.Web.UI.Page
  {
    static string conString = ConfigurationManager.AppSettings["ConString"];
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

  

    [WebMethod()]

   
     public static string SaveUser(string Name, string NICNo, string UserName, string Password,string UserLevel, string UserCardNo)
    {

      if (Name.Trim() == "" || Name == null)
      {
        System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
        return js1.Serialize("failed");
      }
      else if (NICNo.Trim() == "" || NICNo == null)
      {
        System.Web.Script.Serialization.JavaScriptSerializer js2 = new System.Web.Script.Serialization.JavaScriptSerializer();
        return js2.Serialize("failed");
      }
      else if (UserName.Trim() == "" || UserName == null)
      {
        System.Web.Script.Serialization.JavaScriptSerializer js3 = new System.Web.Script.Serialization.JavaScriptSerializer();
        return js3.Serialize("failed");
      }
      else if (Password.Trim() == "" || Password == null)
      {
        System.Web.Script.Serialization.JavaScriptSerializer js4 = new System.Web.Script.Serialization.JavaScriptSerializer();
        return js4.Serialize("failed");
      }
      else if (UserLevel.Trim() == "" || UserLevel == null)
      {
        System.Web.Script.Serialization.JavaScriptSerializer js5 = new System.Web.Script.Serialization.JavaScriptSerializer();
        return js5.Serialize("failed");
      }
      else if (UserCardNo.Trim() == "" || UserCardNo == null)
      {
        System.Web.Script.Serialization.JavaScriptSerializer js6 = new System.Web.Script.Serialization.JavaScriptSerializer();
        return js6.Serialize("failed");
      }
      else
      {

      SqlConnection conn = new SqlConnection(conString);
      conn.Open();
      SqlCommand cmd = new SqlCommand("Insert into TbUser(Name,NICNo,UserName,Password,UserLevel,UserCardNo) values(@pName,@pNICNo,@pUserName,@pPassword,@pUserLevel,@pUserCardNo)", conn);
      SqlParameter param = new SqlParameter();
      param.ParameterName = "@pName";
      param.Value = Name;
      cmd.Parameters.Add(param);

      SqlParameter param1 = new SqlParameter();
      param1.ParameterName = "@pNICNo";
      param1.Value = NICNo;
      cmd.Parameters.Add(param1);

      SqlParameter param2 = new SqlParameter();
      param2.ParameterName = "@pUserName";
      param2.Value = UserName;
      cmd.Parameters.Add(param2);

      SqlParameter param3 = new SqlParameter();
      param3.ParameterName = "@pPassword";
      param3.Value = Password;
      cmd.Parameters.Add(param3);

      SqlParameter param4 = new SqlParameter();
      param4.ParameterName = "@pUserLevel";
      param4.Value = UserLevel;
      cmd.Parameters.Add(param4);

      SqlParameter param5 = new SqlParameter();
      param5.ParameterName = "@pUserCardNo";
      param5.Value = UserCardNo;
      cmd.Parameters.Add(param5);

      int rf = cmd.ExecuteNonQuery();
      conn.Close();

      //return status
      var data = new { status = (rf > 0) };

      System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
      return js.Serialize(data);
    }
  }


    [WebMethod()]
    public static string gridchange()
    {
      SqlConnection conn = new SqlConnection(conString);
      conn.Open();
      using (SqlDataAdapter a = new SqlDataAdapter(
               "select * from [dbo].[TbUser]", conn))

      {
        DataTable t = new DataTable();
        a.Fill(t);
        conn.Close();

        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        return JsonConvert.SerializeObject(t);
      }
    }


    [WebMethod()]  
    public static string getuserdtl(string id)
    {
      SqlConnection conn = new SqlConnection(conString);
      conn.Open();
      using (SqlDataAdapter a = new SqlDataAdapter(

               "Select id, Name, NICNo, UserName, Password, UserLevel, UserCardNo from TbUser WHERE  id='" + id + "' ", conn))
      {
        DataTable t = new DataTable();
        a.Fill(t);
        conn.Close();


        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        return JsonConvert.SerializeObject(t);
      }
    }


 



    [WebMethod()]
    public static string Updateuser(string Name, string NICNo, string UserName, string Password, int UserLevel, string UserCardNo, string id)
    {
      //update db 

      SqlConnection conn = new SqlConnection(conString);

      conn.Open();

      SqlCommand cmd = new SqlCommand(
          "UPDATE TbUser SET Name = @pName ,NICNo = @pNICNo,UserName = @pUserName,Password = @pPassword,UserLevel = @pUserLevel,UserCardNo = @pUserCardNo   WHERE id='" + id + "' ", conn);

      SqlParameter param = new SqlParameter();
      param.ParameterName = "@pName";
      param.Value = Name;
      cmd.Parameters.Add(param);

      SqlParameter param1 = new SqlParameter();
      param1.ParameterName = "@pNICNo";
      param1.Value = NICNo;
      cmd.Parameters.Add(param1);

      SqlParameter param2 = new SqlParameter();
      param2.ParameterName = "@pUserName";
      param2.Value = UserName;
      cmd.Parameters.Add(param2);

      SqlParameter param3 = new SqlParameter();
      param3.ParameterName = "@pPassword";
      param3.Value = Password;
      cmd.Parameters.Add(param3);


      SqlParameter param4 = new SqlParameter();
      param4.ParameterName = "@pUserLevel";
      param4.Value = UserLevel;
      cmd.Parameters.Add(param4);

      SqlParameter param5 = new SqlParameter();
      param5.ParameterName = "@pUserCardNo";
      param5.Value = UserCardNo;
      cmd.Parameters.Add(param5);

      SqlParameter param6 = new SqlParameter();
      param6.ParameterName = "@pid";
      param6.Value =id;
      cmd.Parameters.Add(param6);

      int rf = cmd.ExecuteNonQuery();
      conn.Close();

      //return status
      var data = new { status = (rf > 0) };

      System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
      return js.Serialize(data);
    }

    [WebMethod()]
    public static string popupdelete(string id)
    {
      SqlConnection conn = new SqlConnection(conString);
      conn.Open();

      SqlCommand cmd = new SqlCommand("Delete from TbUser WHERE  id='" + id + "' ", conn);
      int rf = cmd.ExecuteNonQuery();
      conn.Close();

      //return status
      var data = new { status = (rf > 0) };

      System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
      return js.Serialize(data);

    }

  }
}