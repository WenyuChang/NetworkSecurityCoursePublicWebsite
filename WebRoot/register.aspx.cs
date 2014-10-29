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

public partial class register : System.Web.UI.Page
{
    protected bool hasUser;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void create_Click(object sender, WizardNavigationEventArgs e)
    {
        String username = createUser.UserName;
        String password = createUser.Password;
        String email = createUser.Email;
        String name = createUser.Answer;
        int number;
        int.TryParse(createUser.Question,out number);

        if (!hasUser && (Users.CreateUser(username, password, name, email, number)))
        {
            Session["user"] = username;
            e.Cancel = false;
        }
        else
            e.Cancel = true;

    }
    protected void check_Username(object sender, ServerValidateEventArgs e)
    {
        
            if (Users.isUserExist(e.Value))
            {
                e.IsValid = false;
                hasUser = true;
            }
            else
            {
                e.IsValid = true;
                hasUser = false;
            }

    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}
