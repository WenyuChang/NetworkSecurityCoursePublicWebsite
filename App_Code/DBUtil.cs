using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;
using System.Net.Mail;

public static class DBUtil
{
    public static Boolean UploadSoftware(string Path, int Type)
    {
        SqlConnection SoftWare = DBService.Instance.GetSqlConnection();
        string sqltxt = "Insert into Software( SoftwarePath, SoftwareType, UploadDate, DownloadTimes)values('" + Path + "','" + Type + "','" + DateTime.Now + "','" + 0 + "')";
        try
        {
            SoftWare.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = SoftWare;
            cmd.CommandText = sqltxt;
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }


    /*
    public static DataView DataRead()
    {
        SqlConnection GuestConn = DBService.Instance.GetSqlConnection();
        string sqltxt = "Select * from GuestBook";
        //读取留言数据
        try
        {
            SqlDataAdapter adpGuest = new SqlDataAdapter(sqltxt, GuestConn);
            DataSet dsGuest = new DataSet();
            adpGuest.Fill(dsGuest, "GuestBookInfo");

            DataView dvGuestBook = dsGuest.Tables["GuestBookInfo"].DefaultView;
            return dvGuestBook;
        }
        catch (Exception)
        {
            return null;
        }
    }

    public static int Admin_Login_Check(String Admin_Username, String Admin_Password)
    {
        SqlConnection sj973Conn = DBService.Instance.GetSqlConnection();
        try
        {
            sj973Conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sj973Conn;
            cmd.CommandText = "select privilege from staff where staff_no = '" +
                Admin_Username + "' and pwdcompare('" + Admin_Password + "', password) = 1";
            cmd.CommandType = CommandType.Text;

            int temp = Int32.Parse(cmd.ExecuteScalar().ToString());
            if (temp != null)
                return temp;
            else return 0;
        }
        catch (Exception)
        {
            return 0;
        }
        finally
        {
            sj973Conn.Close();
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

　　　　MailMessage mailMessage = new MailMessage(strFrom,to);
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


    //搜索
    //手机搜索
    public static String Admin_Phone_Serch(String Condition)
    {
        try
        {
            String[] conditions = new String[10];

            conditions = Condition.Split(' ');

            String SelectString = "Select * from State where ";
            String SelectStr = "";

            foreach (string s in conditions)
            {
                SelectStr = "(Phone_Model like '%" + s + "%' or Phone_Maxprice like '%" + s + "%' or Introduction like '%" + s + "%')";

                SelectString = SelectString + SelectStr + " and ";

            }
            SelectString = SelectString + "1 = 1";
            return SelectString;

        }
        catch (Exception)
        {
            return null;
        }
    }

    //修改和添加

    //用户信息修改和添加
    public static Boolean Admin_Guest_Update(String Admin_Guest_no, String Admin_Guest_name, String Admin_Guest_tel,
        String Admin_Guest_mail, String Admin_Guest_code, String Admin_Guest_address, String Admin_Guest_username)
    {
        SqlConnection sj973Conn = DBService.Instance.GetSqlConnection();
        try
        {
            sj973Conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sj973Conn;
            cmd.CommandText = "Update Guest set Guest_name = '" + Admin_Guest_name + "',Guest_tel = '" + Admin_Guest_tel + "',Guest_mail = '" +
                Admin_Guest_mail + "',Guest_code = '" + Admin_Guest_code + "',Guest_address = '" + Admin_Guest_address + "',Guest_username = '" + Admin_Guest_username +
                "' where Guest_no = '" + Admin_Guest_no + "'";
            cmd.CommandType = CommandType.Text;
            if (cmd.ExecuteNonQuery() != null)
                return true;
            else return false;
        }
        catch (Exception)
        {
            return false;
        }
        finally
        {
            sj973Conn.Close();
        }
    }


    public static Boolean Admin_Staff_Insert(String Admin_Staff_no, String Admin_Staff_Password,
        String Admin_Staff_Privilege)
    {
        SqlConnection sj973Conn = DBService.Instance.GetSqlConnection();
        try
        {
            sj973Conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sj973Conn;
            cmd.CommandText = "Insert Into staff ( Staff_no, password ,privilege) Values ('"
                + Admin_Staff_no + "', pwdencrypt('" + Admin_Staff_Password + "') ,'" + Admin_Staff_Privilege + "')";
            cmd.CommandType = CommandType.Text;
            if (cmd.ExecuteNonQuery() != null)
                return true;
            else return false;
        }
        catch (Exception)
        {
            return false;
        }
        finally
        {
            sj973Conn.Close();
        }
    }

    public static Boolean Password_Change(String Admin_staff_no, String Admin_password)
    {
        SqlConnection sj973Conn = DBService.Instance.GetSqlConnection();
        try
        {
            sj973Conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sj973Conn;
            cmd.CommandText = "Update staff set password = pwdencrypt('" + Admin_password + "') where staff_no = '" + Admin_staff_no + "'";
            cmd.CommandType = CommandType.Text;
            if (cmd.ExecuteNonQuery() != null)
                return true;
            else return false;
        }
        catch (Exception)
        {
            return false;
        }
        finally
        {
            sj973Conn.Close();
        }
    }
      */
}
