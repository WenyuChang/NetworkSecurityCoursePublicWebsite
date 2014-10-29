<%@ Page Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="WebRoot_index" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <script src="../javascript/newsPicShow.js" type="text/javascript"></script>
<title>网络攻防实践课程网站－首页</title>
    <style type="text/css">
        .style3
        {
            text-align: center;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <div>
    <div id = "introduction">
        <span class="style2">课程简介</span>
        <p class="introduction_content">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            网络安全是一个涵盖较多领域的一门学科，它包括密码学、社会工程学、计算机应用技术等诸多学科；
            网络安全还跟大家的工作和生活息息相关，
            例如网页木马、网站挂马、盗号、QQ账号破解、网银大盗、公司机密资料的窃取等都是造成网络不安全的一些症状，
            网络安全的目的是预防和治疗这些症状，为广大群众提供更好的服务。
            相对而言，我国的网络安全工作起步较晚，目前网络安全的核心技术大多数被西方国家所掌握。
            我们是从2000年开始接触网络安全问题的，
            从很多网络不安全的案例中深切感到有一种使命感在催促我们在国内传播网络安全的知识。
            起初我们在学习过程中购买了大量有关网络安全的书籍，但这些书籍中的理论较多，实践较少，并且技术相对滞后，
            有些技术在目前已经不能使用。鉴于这种情况，我们决定将多年的实践经验和研究成果按照网络攻击的流程进行整理，
            用生动、典型的实际案例来分析网络的攻击与防御，让更多的朋友来了解、推动和探讨网络安全问题，
            提升我国网络安全的整体水平。 
        </p>
        <br />
    </div> 

    <div id = "news">
        <div style="width:240px; float:left;text-align:left">
            <div class="style3">
            <span class="style2">最新公告</span>
            <br />
            <br />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                GridLines="None" PageSize="5" ShowHeader="False" Width="240px">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="NewsId" 
                        DataNavigateUrlFormatString="~/WebRoot/newsDetail.aspx?id={0}" 
                        DataTextField="NewsTitle" Text="NewsTitle">
                    <ItemStyle Font-Bold="True" Font-Size="Small" HorizontalAlign="Left" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" 
                        SortExpression="Column1">
                    <ItemStyle Font-Bold="True" Font-Size="Small" HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"                
                SelectCommand="SELECT TOP 7 [NewsId],  [NewsTitle], CONVERT(VARCHAR(30), [NewsDate],110)  FROM [News] ORDER BY [NewsDate] DESC">
            </asp:SqlDataSource>
        </div>
        
        <div id ="news_pic" style="width:450px; height:200px; float:left; text-align:left; margin:25px;">
        
        </div>
        <div style=" display:none; clear:both;"></div>
        <br />
    </div>
</div>
</asp:Content>

