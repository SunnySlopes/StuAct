using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TeacherHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["role"]==null||Session["role"].ToString()!="teacher")
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

    protected void Logout(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
}