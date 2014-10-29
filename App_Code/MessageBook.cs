using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;

/// <summary>
/// GuestBook 的摘要说明
/// </summary>
public static class MessageBook
{
    public static DataView DataRead()
    {
        SqlConnection MessageConn = DBService.Instance.GetSqlConnection();
        string sqltxt = "Select Name,Number,MessageId,MessageTitle,MessageContent,Convert(Varchar(30),MessageDate,110) as MessageDate  from Users,Message Where Users.UserId = Message.MessageAuthorId";
        //读取留言数据
        try
        {
            SqlDataAdapter adpGuest = new SqlDataAdapter(sqltxt, MessageConn);
            DataSet dsGuest = new DataSet();
            adpGuest.Fill(dsGuest, "Message");

            DataView dvGuestBook = dsGuest.Tables["Message"].DefaultView;
            return dvGuestBook;
        }
        catch (Exception)
        {
            return null;
        }
    }

    public static Boolean DataAdd(int AuthorId, String Title, String Content)
    {
        SqlConnection MessageConn = DBService.Instance.GetSqlConnection();
        //提交留言数据
        try
        {
            string str = "Insert into Message(MessageAuthorId,MessageTitle,MessageContent,MessageDate)values('" + AuthorId + "','" + Title + "','" + Content +
                "','" + DateTime.Now + "')";

            MessageConn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = MessageConn;
            cmd.CommandText = str;
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            return false;
        }
        finally
        {
            MessageConn.Close();
        }
    }
}
