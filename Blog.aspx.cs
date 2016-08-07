using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Blog : System.Web.UI.Page
{
    public int PostCount = 0;
    public SqlDataReader pdr;
    public List<XDocument> postsXml = new List<XDocument>();
    protected void Page_Load(object sender, EventArgs e)
    {

        postNewComment.Visible = (Session["username"] != null)? true : false;


        string connectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        //extract the number of post inside the database
        string query = "SELECT * from posts";
        using (SqlConnection con = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            // open connection
            con.Open();

            // establish data reader
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    XDocument doc = XDocument.Parse(dr["content"].ToString());
                    postsXml.Add(doc);
                }
                
                dr.Close();
            }

            con.Close();
        }

                XmlPostTemplate();
    }
    protected void XmlPostTemplate()
    {
        XDocument doc = XDocument.Load(MapPath("~/assets/posts/post-template.xml")); 
    }
    /*
     var q = from b in xml.Descendants("product")
        select new
        {
            name = (string)b.Element("name"),
            price = (double?)b.Element("price"),                    
            extra = (string)b.Element("extra1"),
            deeplink = (string)b.Element("deepLink")                   
        };
     */

    protected void replyReplyAnchor_Click(object sender, EventArgs e)
    {
        if ((Session["username"] != null))
            commentNewReply.Visible = true;
        else Response.Redirect("~/Login.aspx");
    }
}