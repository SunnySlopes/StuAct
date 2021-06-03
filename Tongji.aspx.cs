using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Tongji : System.Web.UI.Page
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
            string conf = ConfigurationManager.ConnectionStrings["ActManageConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            string sql = "SELECT * FROM [Stu]";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            TableAvg.InnerHtml = "<table class='table table-striped table-bordered table-hover'><tr><th>学号</th><th>姓名</th><th>平均分</th></tr>";
            while (dr.Read())
            {
                string sid = dr.GetString(0);
                string sname = dr.GetString(1);
                string sql2 = "SELECT avg(score) FROM [Detail] WHERE stu_id='" + sid + "'";
                SqlCommand cmd2 = new SqlCommand(sql2, conn);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.Read())
                {

                    string sc = "没有成绩记录";
                    if (!dr2.IsDBNull(0))
                        sc = dr2.GetInt32(0).ToString();
                    TableAvg.InnerHtml += "<tr><td>"+sid+ "</td><td>" + sname + "</td><td>" + sc+ "</td></tr>";
                }
                dr2.Close();
            }
            TableAvg.InnerHtml += "</table>";

            dr.Close();
            conn.Close();
        }
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql = "SELECT * FROM [Detail] INNER JOIN Act ON Detail.act_id=Act.act_id WHERE [stu_id]='" + DropDownList1.SelectedValue + "' ORDER BY Act.[act_id]";
        string conf = ConfigurationManager.ConnectionStrings["ActManageConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(conf);
        conn.Open();
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        TableStu.InnerHtml = "<table class='table table-striped table-bordered table-hover'><tr><th>作业序号</th><th>作业类型</th><th>作业名称</th><th>分数</th><th>备注</th></tr>";
        while (dr.Read())
        {
            TableStu.InnerHtml += "<tr><td>" + dr.GetInt32(1).ToString() + "</td><td>" + dr.GetString(6) + "</td><td>" + dr.GetString(7) + "</td><td>" + dr.GetInt32(3).ToString() + "</td><td>" + dr.GetString(4) + "</td></tr>";
        }
        TableStu.InnerHtml += "</table>";


    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string sql = "SELECT * FROM [Detail] INNER JOIN Stu ON Detail.stu_id=Stu.stu_id WHERE [act_id]='" + DropDownList2.SelectedValue + "' ORDER BY [Stu].[stu_id]";
        string conf = ConfigurationManager.ConnectionStrings["ActManageConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(conf);
        conn.Open();
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        TableAct.InnerHtml = "<table class='table table-striped table-bordered table-hover'><tr><th>学号</th><th>姓名</th><th>分数</th><th>备注</th></tr>";
        while (dr.Read())
        {
            TableAct.InnerHtml += "<tr><td>" + dr.GetString(2) + "</td><td>" + dr.GetString(6) + "</td><td>" + dr.GetInt32(3).ToString() + "</td><td>" + dr.GetString(4) + "</td></tr>";
        }
        TableAct.InnerHtml += "</table>";
    }
}