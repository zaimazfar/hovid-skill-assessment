<%@ Page Title="List Page" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="List.aspx.vb" Inherits="hovid.List" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .gridStyle {
            border-collapse: collapse;
            font-family: Arial;
            font-size: 14px;
        }

            .gridStyle th {
                border: 1px solid #000;
                padding: 5px;
                background: #fff;
                color: #000080;
                text-decoration: underline;
                text-align: center;
            }

            .gridStyle td {
                border: 1px solid #000;
                padding: 5px;
            }

            .gridStyle a {
                color: #0000EE;
                text-decoration: underline;
            }
    </style>
    <asp:GridView ID="gvUser" runat="server" CssClass="gridStyle" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="UserID" AllowSorting="True" OnRowEditing="gvUser_RowEditing" OnRowCancelingEdit="gvUser_RowCancelingEdit" OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting" OnSorting="gvUser_Sorting">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
            <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                <ItemTemplate>
                    <%# Eval("UserName") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>' MaxLength="20" />
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="*" ForeColor="Red" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UserNo" SortExpression="UserNo">
                <ItemTemplate>
                    <%# Eval("UserNo") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtUserNo" runat="server" Text='<%# Bind("UserNo") %>' TextMode="Number" />
                    <asp:RequiredFieldValidator ID="rfvUserNo" runat="server" ControlToValidate="txtUserNo" ErrorMessage="*" ForeColor="Red" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CreateDate" SortExpression="CreateDate">
                <ItemTemplate>
                    <%# Eval("CreateDate", "{0:yyyy-MM-dd HH:mm:ss}") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCreateDate" runat="server" Text='<%# Bind("CreateDate", "{0:yyyy-MM-ddTHH:mm:ss}") %>' TextMode="DateTimeLocal" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" ">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Update" OnClientClick="return confirm('Confirm update this record?');" />
                    <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div style="text-align: center; padding: 10px; color: red;">
                Please register user
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
