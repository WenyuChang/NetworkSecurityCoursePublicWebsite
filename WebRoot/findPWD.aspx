<%@ Page Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="findPWD.aspx.cs" Inherits="WebRoot_findPWD" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="width:500px;margin:10px auto;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="findPass">
                <div class="module">
                    <div class="moduleTitle">
                        是否忘记了您的密码?
                    </div>
                </div>
                <div class="moduleContent">
                    <table id="checkUser" border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;"
                        runat="server">
                        <tr>
                            <td align="center" colspan="2">
                                要接收您的密码，请输入您的用户名。
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" CssClass="textbox" MaxLength="16"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color: Red;">
                                <p id="errorUser" runat="server">
                                    该用户名不存在。</p>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="SubmitButton" runat="server" Text="下一步" ValidationGroup="PasswordRecovery1"
                                    OnClick="SubmitButton_Click" CssClass="button" />
                            </td>
                        </tr>
                    </table>
                    <table id="success" border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;"
                        runat="server">
                        <tr>
                            <td id="mailTitle" align="center" class="title" colspan="2" runat="server">
                                验证成功
                            </td>
                        </tr>
                        <tr>
                            <td id="mailError" align="center" colspan="2" runat="server">
                                密码已经发送到您的注册邮箱。
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label4" runat="server">注册邮箱:</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="mail" runat="server" CssClass="textbox" MaxLength="16" ReadOnly="true"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>

