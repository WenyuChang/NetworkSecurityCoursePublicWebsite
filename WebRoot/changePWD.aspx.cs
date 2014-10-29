using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class WebRoot_changePWD : System.Web.UI.Page
{
    protected bool isValid;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string username = (string)Session["user"];
        //username = "123125";
        string cmdtxt = "select password from users where username='" + username + "'";
        try
        {
            SqlDataReader sr = SqlHelper.ExecuteReader(CommandType.Text, cmdtxt);
            sr.Read();
            string password = (string)sr[0];
            if (password == args.Value)
            {
                args.IsValid = true;
                isValid = true;
            }
            else
            {
                args.IsValid = false;
                isValid = false;
            }

        }
        catch (Exception)
        {
            args.IsValid = false;
            isValid = false;
        }
    }
    protected void ChangePassword_ChangingPassword(object sender, LoginCancelEventArgs e)
    {
        string username = (string)Session["user"];
        //username = "123125";
        if (isValid)//验证通过
        {
            try
            {
                string cmdtxt = "update users set password='" + ChangePassword.NewPassword + "' where username='" + username + "'";
                if (SqlHelper.ExecuteNonQuery(CommandType.Text,cmdtxt) != 0)
                {
                    e.Cancel = false;
                    Session.Clear();
                    Response.Redirect("index.aspx");
                }
                else
                {
                    e.Cancel = true;
                }
            }
            catch (Exception)
            {
                e.Cancel = true;
            }
        }
        else
        {
        }
    }
}
