using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
/// <summary>
///用户的一些列操作，如登陆、注册、修改密码、找回密码。
/// </summary>
public sealed class Users
{
	public Users()
	{
	}

    public static bool isUserExist(String username)
    {
        String cmdtxt = "select count(*) from users where username='" + username + "'";
        try
        {
            int val = (int)SqlHelper.ExecuteScalar(CommandType.Text, cmdtxt);

            if (val == 0)
                return false;
            else
                return true;
        }
        catch
        {
            throw;
        }
    }

    public static bool LogIn(String username, String password)
    {
        String cmdtxt = "select count(*) from users where username='" + username + "' and password='" + password + "'";
        try
        {
            int val = (int)SqlHelper.ExecuteScalar(CommandType.Text, cmdtxt);

            if (val == 0)
                return false;
            else
                return true;
        }
        catch
        {
            throw;
        }
    }

    public static bool CreateUser(String username, String password, String name, String email, int number)
    {
        String cmdtxt = "insert into Users(username,password,name,Mailaddress,number,privilege) values('" 
                        + username + "','"
                        + password + "','"
                        + name + "','"
                        + email + "',"
                        + number + ",0)";

        try
        {
            int val = SqlHelper.ExecuteNonQuery(CommandType.Text,cmdtxt);
            if(val == 0)
                return false;
            else
                return true;
        }
        catch
        {
            throw;
        }
    }

    public static Boolean SendMail(string to, string title, string content)
    {
        string strHost = ConfigurationManager.AppSettings["sendHost"];
        string strAccount = ConfigurationManager.AppSettings["sendUser"];
        string strPwd = ConfigurationManager.AppSettings["sendPassword"];
        string strFrom = ConfigurationManager.AppSettings["sendFrom"];


        SmtpClient smtpClient = new SmtpClient();
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;//指定电子邮件发送方式
        smtpClient.Host = strHost; ;//指定SMTP服务器
        smtpClient.Credentials = new System.Net.NetworkCredential(strAccount, strPwd);//用户名和密码

        MailMessage mailMessage = new MailMessage(strFrom, to);
        mailMessage.Subject = title;//主题
        mailMessage.Body = content;//内容
        mailMessage.BodyEncoding = System.Text.Encoding.UTF8;//正文编码
        mailMessage.IsBodyHtml = true;//设置为HTML格式
        mailMessage.Priority = MailPriority.High;//优先级

        try
        {
            smtpClient.Send(mailMessage);
            return true;
        }
        catch
        {
            return false;
        }

    }
}
