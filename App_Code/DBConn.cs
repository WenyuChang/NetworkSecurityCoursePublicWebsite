using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;

public sealed class DBService
{
    private static DBService m_instance;

    private DBService(){}

    public static DBService Instance
    {
        get{
            if (m_instance == null)
                m_instance = new DBService();
            return m_instance;
        }
    }

    public SqlConnection GetSqlConnection()
    {
        //利用webconfig建立连接字符串
        return new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
}
