<%@ Page Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="WebRoot_news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/index.css" rel="stylesheet" type="text/css" />
<title>网络攻防实践课程网站</title>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div style="text-align:center;">
    <br />
    <span class="style2">新闻公告</span>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" ShowHeader="False" 
        Width="600px">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="NewsId" 
                DataNavigateUrlFormatString="~/WebRoot/newsDetail.aspx?id={0}" 
                DataTextField="NewsTitle">
            <ItemStyle Font-Bold="True" Font-Size="Small" HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Column1" HeaderText="NewsDate" 
                SortExpression="Column1" ReadOnly="True"  >
            <ItemStyle Font-Bold="True" Font-Size="Small" HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [NewsId],[NewsTitle],CONVERT(VARCHAR(30), [NewsDate],110)
 FROM [News] ORDER BY [NewsDate] DESC">
    </asp:SqlDataSource>
</div>
</asp:Content>