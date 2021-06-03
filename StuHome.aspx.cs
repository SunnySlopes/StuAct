using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class StuHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"] == null || Session["role"].ToString() != "stu")
        {
            Response.Redirect("Index.aspx");
            Session["login"] = "未登录学生用户！";
        }
        else
        {
            if (Session["name"] != null)
                TeaName.InnerText = "欢迎您，" + Session["name"].ToString() + "！";
            string sql = "SELECT * FROM [Detail] INNER JOIN Act ON Detail.act_id=Act.act_id WHERE [stu_id]='" + Session["id"].ToString() + "' ORDER BY Act.[act_id]";
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
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile.ContentLength == 0)
        {
            Label1.Text = "请选择文件";
        }
        else
        {
            //获得扩展名
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
            string fileName = Session["id"].ToString() + Session["name"] + "-" + DropDownList1.SelectedValue;
            string newFileName = fileName + extension;
            string filePath = Server.MapPath("~/upload/") + newFileName;
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
            FileUpload1.PostedFile.SaveAs(filePath);

            Label1.Text = "文件上传成功！";

        }
    }
}