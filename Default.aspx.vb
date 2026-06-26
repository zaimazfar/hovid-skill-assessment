Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Reset()
        End If
    End Sub

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click

        Using con As New SqlConnection(
            ConfigurationManager.ConnectionStrings("DB").ConnectionString)

            Using cmd As New SqlCommand("sp_tbUser_Create", con)

                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text)
                cmd.Parameters.AddWithValue("@UserNo", txtUserNo.Text)

                con.Open()
                cmd.ExecuteNonQuery()

                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertmessage", "alert('Data saved successfully!');", True)
                Reset()
            End Using

        End Using

    End Sub

    Protected Sub Reset()
        txtUserName.Text = String.Empty
        txtUserNo.Text = String.Empty
    End Sub
End Class