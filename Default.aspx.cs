using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Text;
public partial class _Default : System.Web.UI.Page
{
    [WebMethod]
    public static string SaveReg(string fname, string mname, string lname, string nationality, string email, string mobile_no, string card_type, string card_no)
    {
       
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ToString());
        try
        {
            SqlCommand cmd = new SqlCommand("Insert into e_wallet_reg_master values('" + fname + "',N'" + mname + "','" + lname + "',N'" + nationality + "',N'" + email + "',N'" + mobile_no + "','" + card_type + "','" + card_no + "','Open')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return "success";
        }

        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    [WebMethod]
    public static string SaveReq(string ReqNo, string PassportNo, string VisaNo)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ToString());
        try
        {
            SqlCommand cmd = new SqlCommand("Insert into evallet_req_master values('" + ReqNo + "',N'" + PassportNo + "','" + VisaNo + "','Open')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return "success";
        }

        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    [WebMethod]
    public static string Approval(string ID,string EmailID)
    {
       
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ToString());
        try
        {
          

            SqlCommand cmd = new SqlCommand("update  e_wallet_reg_master set status='Closed' where request_no='" + ID + "'", con);
            con.Open();
            int i=cmd.ExecuteNonQuery();
            con.Close();

            if (i > 0)
            {
                SendEmail(EmailID, "E-Wallet Account Activation", "E-WalletRequest.html", "");
                return "success";
            }
            else
            {
                return "false";
            }
        }

        catch (Exception ex)
        {
            return ex.Message;
        }

    }

    [WebMethod]
    public static string SendEmail(string to, string subject, string UserName, string filename)
    {
        try
        {
            string body = "   This is the automation email from the HAJJ E-WALLET  PORTAL,<br />" +
"<br />Please Click the this Link "+UserName+" to Create E-Wallet Request<br /><br /> ";


            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            // client.Timeout = 10000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("hajjewallate@gmail.com", "hajj%ewallet");


            MailMessage mm = new MailMessage("hajjewallate@gmail.com", to, subject, body);
            mm.IsBodyHtml = true;
            mm.BodyEncoding = UTF8Encoding.UTF8;
            mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

            //Attachment attachment;
            //attachment = new System.Net.Mail.Attachment(filename);
            //mm.Attachments.Add(attachment);


            client.Send(mm);

            return "Email Send";
        }
        catch (Exception exp)
        {

            return exp.Message;
        }
    }

    

    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
   

    
}

