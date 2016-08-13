using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {   
        string loginEmail = inputEmail.Text, loginPassword = inputPassword.Text;

        string connectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        string query = "SELECT userid, type, username, image FROM users WHERE email=@email AND password=@pwd;";

        // set up a connection and command in using() blocks
        using (SqlConnection con = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            // add parameters and set their values
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = loginEmail;
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 50).Value = loginPassword ;

            // open connection
            con.Open();

            // establish data reader
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                // if at least one row is returned....  
                if (dr.Read() && dr.HasRows)
                {
                    // get employee ID and role from the reader
                    string userid = dr[0].ToString();
                    string type = dr[1].ToString();
                    string username = dr[2].ToString();
                    Byte[] imgData = (byte[])dr[3];
                    //string imgString = Convert.ToBase64String(imgData);
                    //byte[] b = null;
                    //b = (byte[])obj.GetValue(0);
                    ////OR
                    //b = (byte[])obj[0];
                    using (Image image = Image.FromStream(new MemoryStream(imgData)))
                    {
                        image.Save(MapPath("~/assets/img/profile-pic.jpeg"), ImageFormat.Jpeg);
                        Session["imgSaved"] = true;
                    }
                    //Session["image"] = dr[3];

                    Session["username"] = username;
                    //Session["imgString"] = imgString;

                    
                    //Session["imgDataLength"] = imgData.Length;

                    // depending on role, jump off to various pages
                    switch (type)
                    {
                        case "admin":
                            Response.Redirect("AdminPanel.aspx");
                            break;

                        case "client":
                            Response.Redirect("Index.aspx");
                            break;

                        default:
                            Response.Write("employee.aspx");
                            break;
                    }
                }
                else
                {
                    // what do you want to do if NO ROW was returned? E.g. email/pwd combo is wrong
                    reauthEmail.Text = "Invalid Email or Password";
                }

                dr.Close();
            }

            con.Close();
        }

    }
}