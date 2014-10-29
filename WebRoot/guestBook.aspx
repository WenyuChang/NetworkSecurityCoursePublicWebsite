<%@ Page Language="C#" MasterPageFile="~/master/Main.master" AutoEventWireup="true" CodeFile="guestBook.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/index.css" rel="stylesheet" type="text/css" />

<title>网络攻防实践课程网站－首页</title>
   
    <style type="text/css">
        .style4
        {
            height: 93px;
        }
        .style5
        {
            width: 8%;
            height: 13px;
        }
        .style6
        {
            height: 13px;
        }
        .style7
        {
            width: 8%;
            height: 2px;
        }
        .style8
        {
            height: 2px;
        }
        .style9
        {
            width: 650px;
        }
    </style>
   
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div>
    <div style="width: 764px; border-width:0px; margin:5px 5px;">
        <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
                <table width="100%" border="0" style="font-size:small;">
                    <tr style=" height:8px;">
                        <td style="width:40%;">
                            标题：<a href="MessageDetail.aspx?id=<%#Eval("MessageId") %>"><%#Eval("MessageTitle") %></a>
                        </td>
                        <td style="width:20%;">
                            用户：<%#Eval("Name") %>
                        </td>
                        <td style="width:20%;">
                            学号：<%#Eval("Number") %>
                        </td>
                        <td style="width:20%;">
                            时间：<%#Eval("MessageDate") %>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SeparatorTemplate>
                <tr>
                    <td style="height: 1" colspan="2">
                        <hr style="color: #80A407" />
                    </td>
                </tr>
            </SeparatorTemplate>
        </asp:Repeater>
        <hr style="color: #80A407; height: -15px;" />
        
        <table style=" float:right;">
            <tr>
                <td style=" font-size:small; " align="center"> 
                    <asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click">页首</asp:LinkButton> 
                    <asp:LinkButton ID="lbtnpritPage" runat="server" OnClick="lbtnpritPage_Click">上一页</asp:LinkButton> 
                    <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">下一页</asp:LinkButton> 
                    <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click">页尾</asp:LinkButton>
                    第<asp:Label ID="labPage" runat="server" Text="Label"></asp:Label>页/共<asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label>页 
                   <!--跳至<asp:DropDownList ID="DropDownList1" runat="server"> </asp:DropDownList> -->
                </td>
            </tr> 
        </table> 
        
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" 
            style="font-size: small"></asp:Label>
        
        <table cellpadding="0" cellspacing="1" style="width: 100%; height:150px; font-size:small;">
            <tr>
                <td class="style5">
                    用户名：
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtNick" runat="server" Columns="50" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    标题：
                </td>
                <td class="style8">
                    <asp:TextBox ID="txtTitle" runat="server" Columns="50" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    内容：
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtNote" runat="server" Columns="50" Rows="10" 
                        TextMode="MultiLine" Width="670px" Height="125px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style=" text-align: right" class="style9">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" OnClientClick='return confirm("确认提交留言吗？")'
                        Text="提交" style="text-align:center;" Width="70px" />
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>    