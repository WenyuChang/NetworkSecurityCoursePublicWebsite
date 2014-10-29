<%@ Page Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="changePWD.aspx.cs" Inherits="WebRoot_changePWD" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="width:500px;margin:10px auto;">
        <asp:ChangePassword ID="ChangePassword" runat="server" NewPasswordRegularExpression="^\w{6,18}$"
                                NewPasswordRegularExpressionErrorMessage="密码长度应在6~18之间，只能包含字符、数字和下划线。" Width="400px"
                                OnChangingPassword="ChangePassword_ChangingPassword">
                                <TitleTextStyle CssClass="title" />
                                <ChangePasswordTemplate>
                                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td>
                                                <table border="0" cellpadding="0" style="width: 400px;">
                                                    <tr>
                                                        <td align="center" class="title" colspan="2">
                                                            更改密码
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">密码:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                                                ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">新密码:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                                                ErrorMessage="必须填写“新密码”。" ToolTip="必须填写“新密码”。" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">确认新密码:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                                                ErrorMessage="必须填写“确认新密码”。" ToolTip="必须填写“确认新密码”。" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                                                ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="“确认新密码”与“新密码”项必须匹配。"
                                                                ValidationGroup="ChangePassword"></asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:RegularExpressionValidator ID="NewPasswordRegExp" runat="server" ControlToValidate="NewPassword"
                                                                Display="Dynamic" ErrorMessage="密码长度应在6~18之间，只能包含字符、数字和下划线。" ValidationExpression="^\w{6,18}$"
                                                                ValidationGroup="ChangePassword"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2" style="color: Red;">
                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="您输入的密码错误。"
                                                                OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="ChangePassword"
                                                                ControlToValidate="CurrentPassword"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" CssClass="button"
                                                                Text="更改密码" ValidationGroup="ChangePassword" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button"
                                                                Text="取消" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ChangePasswordTemplate>
                            </asp:ChangePassword>
    </div>
</asp:Content>

