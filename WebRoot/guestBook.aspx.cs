using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            this.txtNick.Text = Session["user"].ToString();
        }
        if (!IsPostBack)
        {
            BindData();
          
            this.labPage.Text = "1";
            this.contrlRepeater();
        }
    }
    private void BindData()
    {
        DataView dvGuest = new DataView();
        dvGuest = MessageBook.DataRead(); //从数据库中获得全部留言的dataset
        Repeater1.DataSource = dvGuest; //绑定数据源  
        Repeater1.DataBind();
        lblMessage.Text = "共有" + dvGuest.Count.ToString() + "人在此留言！";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int AuthorId = 1;
        string Title = txtTitle.Text;
        string Note = txtNote.Text;

        if (MessageBook.DataAdd(AuthorId, Title, Note) == false)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>window.alert('留言失败！');</script>");
            return;
        }
        else
        {
            BindData();
            Clear_TextBox();
        }

    }

    private void Clear_TextBox()
    {
        foreach(System.Web.UI.Control control in this.Controls)   
        {
            if (control.GetType().ToString() == "System.Web.UI.HtmlControls.HtmlForm")
            {
                foreach (System.Web.UI.Control controlTxt in control.Controls)
                {
                    if (controlTxt.GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                    {
                        System.Web.UI.WebControls.TextBox txb = (System.Web.UI.WebControls.TextBox)this.FindControl(controlTxt.ID);
                        txb.Text = "";
                    }
                }
            }
        }
    }
    protected void quit_Click(object sender, EventArgs e)
    {
        Session.Clear();
        //删除cookie
        HttpCookie cookie = new HttpCookie("user");
        cookie.Expires = DateTime.Now.AddDays(-1);
        Response.AppendCookie(cookie);

        Response.Redirect("index.aspx");
    }
    protected void myaccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("member.aspx");
    }


    //获取指字符个数的字符 
    public string cuts(string aa, int bb)
    {
        if (aa.Length <= bb) { return aa; }
        else { return aa.Substring(0, bb); }
    } 

    //Repeater分页控制显示方法 
    public void contrlRepeater() 
    {
        DataView dvGuest = new DataView();
        dvGuest = MessageBook.DataRead(); //从数据库中获得全部留言的dataset
        
        //Repeater1.DataSource = dvGuest; //绑定数据源  

        //pb pb1 = new pb(); 
        //DataSet ss = new DataSet(); 
        //ss = pb1.returnDs("select top 200 [标题],[时间] from news");
        //PagedDataSource pds = new PagedDataSource(); 
        //pds.DataSource = ss.Tables["temptable"].DefaultView; 

        PagedDataSource pds = new PagedDataSource(); 
        pds.DataSource = dvGuest; 


        pds.AllowPaging = true; 
        pds.PageSize = 5; 
        pds.CurrentPageIndex = Convert.ToInt32(this.labPage.Text) - 1; 
        Repeater1.DataSource = pds; 
        LabCountPage.Text = pds.PageCount.ToString(); 
        labPage.Text = (pds.CurrentPageIndex + 1).ToString(); 
        this.lbtnpritPage.Enabled = true; 
        this.lbtnFirstPage.Enabled = true; 
        this.lbtnNextPage.Enabled = true; 
        this.lbtnDownPage.Enabled = true;
        //this.DropDownList1.Enabled = false;
        //this.DropDownList1.Visible = false;
        //for (int i = 1; i <= pds.PageCount; i++)
            //this.DropDownList1.Items.Add(i.ToString());
        if(pds.CurrentPageIndex<1) 
        { 
            this.lbtnpritPage.Enabled = false; 
            this.lbtnFirstPage.Enabled = false; 
        } 
        if (pds.CurrentPageIndex == pds.PageCount-1) 
        { 
            this.lbtnNextPage.Enabled = false; 
            this.lbtnDownPage.Enabled = false; 
        } 
        Repeater1.DataBind(); 
    } 
    protected void lbtnpritPage_Click(object sender, EventArgs e) 
    { 
        this.labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1); 
        this.contrlRepeater(); 
    } 
    protected void lbtnFirstPage_Click(object sender, EventArgs e) 
    { 
        this.labPage.Text = "1"; 
        this.contrlRepeater(); 
    } 
    protected void lbtnDownPage_Click(object sender, EventArgs e) 
    { 
        this.labPage.Text =this.LabCountPage.Text; 
        this.contrlRepeater(); 
    } 

    protected void lbtnNextPage_Click(object sender, EventArgs e) 
    { 
        this.labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) + 1); 
        this.contrlRepeater(); 
    }
}
