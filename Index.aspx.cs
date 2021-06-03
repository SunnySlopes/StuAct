using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["login"]!=null)
        {
            string a = Session["login"].ToString();
            jieguo.InnerText = a;
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = Text1.Value;
        string password = Password1.Value;
        string conf = ConfigurationManager.ConnectionStrings["ActManageConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(conf);
        if (Radio1.Checked) 
        {
            string sql = "SELECT * FROM [Stu] WHERE stu_id='"+username+"' AND password='"+password+"'";
            jieguo.InnerText = sql;
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                jieguo.InnerHtml = dr.GetString(1);
                Session["role"] = "stu";
                Session["name"] = dr.GetString(1);
                Session["id"] = dr.GetString(0);
                Response.Redirect("StuHome.aspx");
            }
            else
            {
                jieguo.InnerHtml = "学生登录失败！";
            }
            dr.Close();
            conn.Close();
        }
        if (Radio2.Checked) 
        {
            string sql = "SELECT * FROM [Teacher] WHERE teacher_id='" + username + "' AND password='" + password + "'";
            jieguo.InnerText = sql;
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                jieguo.InnerHtml = dr.GetString(1);
                Session["role"] = "teacher";
                Session["name"] = dr.GetString(1);
                Session["id"] = dr.GetString(0);
                Response.Redirect("TeacherHome.aspx");
            }
            else
            {
                jieguo.InnerHtml = "教师/管理员登录失败！";
            }
            dr.Close();
            conn.Close();
        }
    }
}