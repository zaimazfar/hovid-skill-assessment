<%@ Page Title="Register Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="hovid._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .form-container {
            font-family: 'Times New Roman', Times, serif;
            margin: 20px;
        }
        .form-table {
            border-collapse: collapse;
        }
        .form-table td {
            padding: 4px 8px;
            vertical-align: middle;
            font-size: 16px;
        }
        .title-row {
            text-align: center;
            font-weight: bold;
            text-decoration: underline;
            font-size: 18px;
            padding-bottom: 10px !important;
        }
        .textbox-style {
            width: 220px;
            border: 1px solid #7a7a7a;
            padding: 2px;
        }
        .button-style {
            padding: 2px 12px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }
        .button-style {
            padding: 2px 12px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }
    </style>
    <main aria-labelledby="title">
        <div class="form-container">
            <table class="form-table">
                <tr>
                    <td></td>
                    <td class="title-row">Register</td>
                </tr>
                <tr>
                    <td>User Name :</td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="textbox-style"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>User No :</td>
                    <td>
                        <asp:TextBox ID="txtUserNo" runat="server" CssClass="textbox-style" type="number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center;">
                        <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="button-style" OnClick="btnCreate_Click"/>
                    </td>
                </tr>
            </table>
        </div>
    </main>
</asp:Content>