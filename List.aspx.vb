Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class List
    Inherits System.Web.UI.Page

    Private ReadOnly connectionString As String =
        ConfigurationManager.ConnectionStrings("DB").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadData()
        End If
    End Sub

    Private Function GetUserData() As DataTable

        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand("sp_tbUser_Read", connection)

                command.CommandType = CommandType.StoredProcedure

                Dim adapter As New SqlDataAdapter(command)
                Dim table As New DataTable()

                adapter.Fill(table)

                Return table
            End Using
        End Using

    End Function

    Private Sub LoadData()

        Dim table As DataTable = GetUserData()

        gvUser.DataSource = table
        gvUser.DataBind()

    End Sub

    Protected Sub gvUser_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gvUser.EditIndex = e.NewEditIndex
        LoadData()
    End Sub

    Protected Sub gvUser_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gvUser.EditIndex = -1
        LoadData()
    End Sub

    Protected Sub gvUser_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)

        Dim row As GridViewRow = gvUser.Rows(e.RowIndex)
        Dim userID As Long = CLng(gvUser.DataKeys(e.RowIndex).Value)

        Dim txtUserName As TextBox = CType(row.FindControl("txtUserName"), TextBox)
        Dim txtUserNo As TextBox = CType(row.FindControl("txtUserNo"), TextBox)
        Dim txtCreateDate As TextBox = CType(row.FindControl("txtCreateDate"), TextBox)

        Dim userName As String = txtUserName.Text
        Dim userNo As Integer = Convert.ToInt32(txtUserNo.Text)

        Dim createDate As DateTime
        DateTime.TryParse(txtCreateDate.Text, createDate)

        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand("sp_tbUser_Update", connection)

                command.CommandType = CommandType.StoredProcedure

                command.Parameters.AddWithValue("@UserID", userID)
                command.Parameters.AddWithValue("@UserName", userName)
                command.Parameters.AddWithValue("@UserNo", userNo)
                command.Parameters.AddWithValue("@CreateDate", createDate)

                connection.Open()
                command.ExecuteNonQuery()

            End Using
        End Using

        gvUser.EditIndex = -1
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertmessage", "alert('Data updated successfully!');", True)
        LoadData()

    End Sub

    Protected Sub gvUser_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        Dim userID As Long = CLng(gvUser.DataKeys(e.RowIndex).Value)

        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand("sp_tbUser_Delete", connection)

                command.CommandType = CommandType.StoredProcedure
                command.Parameters.AddWithValue("@UserID", userID)

                connection.Open()
                command.ExecuteNonQuery()

            End Using
        End Using

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertmessage", "alert('Data deleted successfully!');", True)
        LoadData()

    End Sub

    Protected Sub gvUser_Sorting(sender As Object, e As GridViewSortEventArgs)

        Dim table As DataTable = GetUserData()
        Dim view As DataView = table.DefaultView

        Dim direction As String = "ASC"

        If ViewState("SortDirection") IsNot Nothing Then
            If ViewState("SortDirection").ToString() = "ASC" Then
                direction = "DESC"
            End If
        End If

        ViewState("SortDirection") = direction

        view.Sort = e.SortExpression & " " & direction

        gvUser.DataSource = view
        gvUser.DataBind()

    End Sub

End Class