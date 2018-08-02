using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class RegistrationList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataTable();
        }
    }
    public void BindDataTable()
    {
        int index = 0;
        //Replace Your Server Name And DataBase Name/////////////
        string str = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);
        cn.Open();
        string query = "Select * from e_wallet_reg_master where status='Open' order by request_no";
        SqlCommand cmd = new SqlCommand(query, cn);
        SqlDataReader user = cmd.ExecuteReader();
        String UnreadText = "";
        Int32 i = 0;
        while (user.Read())
        {
            index++;
            UnreadText += "<tr>";
            UnreadText += "<td class=\"center\">" + index + "</td>";
            UnreadText += "<td class=\"center\" style=display:none>" + user["request_no"] + "</td>";
            UnreadText += "<td class=\"center\" style=display:none>" + user["fname"] + "</td>";

            UnreadText += "<td class=\"center\">" + user["fname"] + "</td>";
            UnreadText += "<td class=\"center\">" + user["mname"] + "</td>";
            UnreadText += "<td class=\"center\">" + user["lname"] + "</td>";
            UnreadText += "<td class=\"center\">" + user["nationality"] + "</td>";
            UnreadText += "<td class=\"center\">" + user["email"] + "</td>";
            UnreadText += "<td class=\"center\">" + user["mobile_no"] + "</td>";
            UnreadText += "<td class=\"center\">" + user["card_type"] + "</td>";
            UnreadText += "<td class=\"center\">" + user["card_no"] + "</td>";

            UnreadText += "			<td class=\"center\">";
            UnreadText += "				<input  class=\"btn btn-red\" type=\"button\" id=\"test_update\" width=\"100px\" value=\"Approval\" onclick=\"GetApproval('" + user["request_no"] + "','" + user["email"] + "'); return false\" \">";
            UnreadText += "			</td>";



            UnreadText += "		</tr>";
            tlist.InnerHtml = UnreadText;
            i++;
        }
        cn.Close();
    }
}