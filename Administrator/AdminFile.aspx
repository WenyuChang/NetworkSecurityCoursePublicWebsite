<%@ Page Language="C#" MasterPageFile="~/master/AdminMain.master" CodeFile="AdminFile.aspx.cs" Inherits="Administrator_AdminFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <script src="../javascript/newsPicShow.js" type="text/javascript"></script>
<title>网络攻防实践课程网站－管理首页</title>
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <asp:FileUpload ID="FileUpload1" runat="server"/>
    <br />
    <asp:Button id="UploadButton"  Text="Upload file" OnClick="UploadButton_Click" runat="server">
    </asp:Button>    
    <br />
    <asp:Label id="UploadStatusLabel" runat="server">
    </asp:Label>
</asp:Content>