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
  public partial class Company : System.Web.UI.Page
  {
    static string ConString = ConfigurationManager.AppSettings["ConString"];


    protected void Page_Load(object sender, EventArgs e)
    {
      gridchange();
    }



    [WebMethod()]

    public static string SaveCompany(string CompanyName, string Adress1, string ContactPerson, string Telephone1, string Telephone2, string eMail)
    {
      SqlConnection conn = new SqlConnection(ConString);
      conn.Open();
      SqlCommand cmd = new SqlCommand("Insert into TbCompany(CompanyName,Adress1,ContactPerson,Telephone1,Telephone2,eMail) values (@pComN,@pAdr1,@pConP,@pTel1,@pTel2,@peM)", conn);

      SqlParameter param1 = new SqlParameter();
      param1.ParameterName = "@pComN";
      param1.Value = CompanyName;
      cmd.Parameters.Add(param1);

      SqlParameter param2 = new SqlParameter();
      param2.ParameterName = "@pAdr1";
      param2.Value = Adress1;
      cmd.Parameters.Add(param2);


      SqlParameter param3 = new SqlParameter();
      param3.ParameterName = "@pConP";
      param3.Value = ContactPerson;
      cmd.Parameters.Add(param3);


      SqlParameter param4 = new SqlParameter();
      param4.ParameterName = "@pTel1";
      param4.Value = Telephone1;
      cmd.Parameters.Add(param4);


      SqlParameter param5 = new SqlParameter();
      param5.ParameterName = "@pTel2";
      param5.Value = Telephone2;
      cmd.Parameters.Add(param5);


      SqlParameter param6 = new SqlParameter();
      param6.ParameterName = "@peM";
      param6.Value = eMail;
      cmd.Parameters.Add(param6);


      int rf = cmd.ExecuteNonQuery();
      conn.Close();

      //return status
      var data = new { status = (rf > 0) };

      System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
      return js.Serialize(data);
    }



    [WebMethod()]
    public static string gridchange()
    {
      SqlConnection conn = new SqlConnection(ConString);
      conn.Open();

      using (SqlDataAdapter a = new SqlDataAdapter(
             "select * from [dbo].[TbCompany]", conn))

      {
        DataTable t = new DataTable();
        a.Fill(t);
        conn.Close();

        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        return JsonConvert.SerializeObject(t);

      }

    }



    [WebMethod()]
    public static string getcompanydtl(string id)

    {
      SqlConnection conn = new SqlConnection(ConString);
      conn.Open();
      using (SqlDataAdapter a = new SqlDataAdapter(
              "Select id,CompanyName,Adress1,ContactPerson,Telephone1,Telephone2,eMail from TbCompany WHERE  id='" + id + "' ", conn))

      {
        DataTable t = new DataTable();
        a.Fill(t);
        conn.Close();


        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        return JsonConvert.SerializeObject(t);
      }

    }



 



    [WebMethod()]
    public static string popupdelete(string id)

    {
      SqlConnection conn = new SqlConnection(ConString);
      conn.Open();

      SqlCommand cmd = new SqlCommand("Delete from TbCompany WHERE  id='" + id + "' ", conn);

      int rf = cmd.ExecuteNonQuery();
      conn.Close();


      var data = new { status = (rf > 0) };

      System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
      return js.Serialize(data);

    }





    [WebMethod()]
    public static string UpdateCompany(string CompanyName, string Adress1, string ContactPerson, string Telephone1, string Telephone2, string eMail, string id)
    {


      SqlConnection conn = new SqlConnection(ConString);

      conn.Open();

      SqlCommand cmd = new SqlCommand(
          "UPDATE tbCompany SET CompanyName = @pComN, Adress1 = @pAdr1, ContactPerson = @pConP, Telephone1 = @pTel1, Telephone2 = @pTel2, eMail = @peM WHERE id='" + id + "' ", conn);

      SqlParameter param1 = new SqlParameter();
      param1.ParameterName = "@pComN";
      param1.Value = CompanyName;
      cmd.Parameters.Add(param1);

      SqlParameter param2 = new SqlParameter();
      param2.ParameterName = "@pAdr1";
      param2.Value = Adress1;
      cmd.Parameters.Add(param2);


      SqlParameter param7 = new SqlParameter();
      param7.ParameterName = "@pConP";
      param7.Value = ContactPerson;
      cmd.Parameters.Add(param7);


      SqlParameter param4 = new SqlParameter();
      param4.ParameterName = "@pTel1";
      param4.Value = Telephone1;
      cmd.Parameters.Add(param4);


      SqlParameter param5 = new SqlParameter();
      param5.ParameterName = "@pTel2";
      param5.Value = Telephone2;
      cmd.Parameters.Add(param5);


      SqlParameter param6 = new SqlParameter();
      param6.ParameterName = "@peM";
      param6.Value = eMail;
      cmd.Parameters.Add(param6);



     


      int rf = cmd.ExecuteNonQuery();
      conn.Close();


      var data = new { status = (rf > 0) };

      System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
      return js.Serialize(data);
    }


  }

















}

