using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class ActManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] == null || Session["role"].ToString() != "teacher")
        {
            Response.Redirect("Index.aspx");
            Session["login"] = "未登录教师用户！";
        }
        else
        {
            if (Session["name"] != null)
                TeaName.InnerText = "欢迎您，" + Session["name"].ToString() + "！";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string s1 = Text1.Value;
        string s2 = Text2.Value;
        string conf = ConfigurationManager.ConnectionStrings["ActManageConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(conf);
        string tm = DateTime.Now.ToString();
        string sql = "INSERT INTO [Act] ([type], [act_name], [date]) VALUES ('" + s1 + "', '" + s2 + "', '" + tm + "')";
        conn.Open();
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Close();
        conn.Close();
        Response.Redirect("ActManage.aspx");
    }
    protected void Logout(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
}