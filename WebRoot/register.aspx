<%@ Page Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>用户注册</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="width:500px;margin:10px auto;">
 <contentTemplate> 
        <asp:CreateUserWizard ID="createUser" runat="server" Width="360px" 
            EmailRegularExpression="^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$" 
            EmailRegularExpressionErrorMessage="请输入一个有效的电子邮箱地址。" 
            PasswordRegularExpression="^\w{6,16}$" 
            PasswordRegularExpressionErrorMessage="密码长度应在6~16之间，只能包含字符、数字和下划线。" 
            onnextbuttonclick="create_Click" CreateUserButtonText="注册用户">
            <CreateUserButtonStyle CssClass="button" />
            <TitleTextStyle CssClass="title" />
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" ID="create">
                    <ContentTemplate>
                        <div class="module" style="width:362px;margin:0px 0px 0px -1px;">
                            <div class="moduleTitle" >
                                    注册新帐户
                            </div>
                        </div>
                        
                            <table border="0" style="font-size: 100%;width:100%;">
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="textbox" MaxLength="16"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" ValidationGroup="createUser">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="textbox"
                                            MaxLength="16"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" ValidationGroup="createUser">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
                                            MaxLength="16">确认密码:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                            ErrorMessage="必须填写“确认密码”。" ToolTip="必须填写“确认密码”。" ValidationGroup="createUser">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">电子邮件:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Email" runat="server" CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                            ErrorMessage="必须填写“电子邮件”。" ToolTip="必须填写“电子邮件”。" ValidationGroup="createUser">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">学号:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Question" runat="server" CssClass="textbox" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                            ErrorMessage="必须填写“学号”。" ToolTip="必须填写“学号”。" ValidationGroup="createUser">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">姓名:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Answer" runat="server" CssClass="textbox" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                            ErrorMessage="必须填写“姓名”。" ToolTip="必须填写“姓名”。" ValidationGroup="createUser">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                            ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="“密码”和“确认密码”必须匹配。"
                                            ValidationGroup="createUser"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:RegularExpressionValidator ID="PasswordRegExp" runat="server" ControlToValidate="Password"
                                            Display="Dynamic" ErrorMessage="密码长度应在6~18之间，只能包含字符、数字和下划线。" ValidationExpression="^\w{6,16}$"
                                            ValidationGroup="createUser"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:RegularExpressionValidator ID="EmailRegExp" runat="server" ControlToValidate="Email"
                                            Display="Dynamic" ErrorMessage="请输入一个有效的电子邮件。" ValidationExpression="^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$"
                                            ValidationGroup="createUser"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:RegularExpressionValidator ID="UsernameRegExp" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="用户名长度应在6~18之间，只能包含字符、数字和下划线。" ValidationExpression="^\w{6,18}$"
                                            ValidationGroup="createUser" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="该用户名已存在。" OnServerValidate="check_Username" Display="Dynamic" ValidationGroup="createUser"></asp:CustomValidator>
                                    </td>
                                </tr>
                            </table>
                       
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server" ID="created">
                    <ContentTemplate>
                        <table border="0" style="font-size:100%;width:350px;">
                            <tr>
                                <td align="center" class="title" colspan="2">
                                    完成</td>
                            </tr>
                            <tr>
                                <td>
                                    已成功创建您的帐户。</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinueButton" CssClass="button" runat="server" CausesValidation="False" 
                                        CommandName="Continue" Text="继续" ValidationGroup="createUser" 
                                        onclick="ContinueButton_Click" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>   
        </contentTemplate> 
    </div>
</asp:Content>

