using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.SqlClient;

public partial class Score : System.Web.UI.Page
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
        int aid = int.Parse(DropDownList1.SelectedValue);
        string sid = DropDownList2.SelectedValue;
        string scorestr = Text3.Value;
        if (scorestr.Length == 0) return;
        foreach (char c in scorestr)
        { if (!Char.IsNumber(c)) { Response.Write("window.alert('请在分数栏输入数字!')");Response.Flush(); return; } }
        int score = int.Parse(Text3.Value);
        if(score<0||score>100)
        {
            Response.Write("window.alert('成绩应为0-100之间!')");
            Response.Flush();
            return;
        }
        string memo = Text4.Value;
        string conf = ConfigurationManager.ConnectionStrings["ActManageConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(conf);
        string sql = "INSERT INTO [Detail] ([act_id], [stu_id], [score], [memo]) VALUES (" + aid + ", '" + sid + "', " + score + ", '" + memo + "')";
        string delsql = "DELETE FROM [Detail] WHERE [stu_id] = '" + sid + "' AND [act_id] = " + aid;
        conn.Open();
        SqlCommand delcmd = new SqlCommand(delsql, conn);
        SqlDataReader deldr = delcmd.ExecuteReader();
        deldr.Close();
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Close();
        conn.Close();
        Response.Redirect("Score.aspx");
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
}