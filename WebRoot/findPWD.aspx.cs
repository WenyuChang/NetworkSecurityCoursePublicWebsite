using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class WebRoot_findPWD : System.Web.UI.Page
{
    protected Boolean hasUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        errorUser.Visible = false;
        checkUser.Visible = true;
        success.Visible = false;

    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if (Users.isUserExist(UserName.Text)) //用户名存在
        {
            String cmdtxt = "select mailaddress,password from users where username='" + UserName.Text + "'";
            SqlDataReader sr = SqlHelper.ExecuteReader(CommandType.Text, cmdtxt);
            sr.Read();
            mail.Text = (string)sr[0];
            if (!Users.SendMail(mail.Text, "您的密码", "尊敬的" + UserName.Text + "，您的网络攻防课程实践账号的密码为：" + (String)sr[1]))
            {
                mailTitle.InnerHtml = "发送邮件失败，请联系管理员或者重试。";
            }
            else
            {
                checkUser.Visible = false;
                success.Visible = true;
            }
        }
        else
        {
            checkUser.Visible = true;
            success.Visible = false;
        }
    }

}
