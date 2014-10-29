using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class master_Main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Login1.Visible = false;
            logged.Visible = true;
            logged.InnerHtml = "欢迎回来，" + (String)Session["user"];
            logout.Visible = true;
        }
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        String username = Login1.UserName;
        String password = Login1.Password;

        bool flag = Users.LogIn(username, password);

        if (!flag)
            Login1.FailureText = "用户名或密码错误！";
        else
        {
            Session["user"] = username;
            Login1.Visible = false;
            logged.Visible = true;
            logged.InnerHtml = "欢迎回来，" + username;
            logout.Visible = true;
            //Response.Redirect("http://www.baidu.com");
        }
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect(Request.Url.ToString());
    }
}
