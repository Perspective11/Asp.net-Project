 using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

public partial class Blog : System.Web.UI.Page
{
    public int PostCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        //postNewComment.Visible = (Session["username"] != null)? true : false;


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
                    LoadPostHtml(doc);
                    //DataSet ds = new DataSet();
                    //XmlReader reader = XmlReader.Create(new StringReader(dr["content"].ToString()));
                    //ds.ReadXml(reader);
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

    protected void LoadPostHtml(XDocument doc)
    {
        Random rnd = new Random();

        Panel Post = new Panel();
        Post.CssClass = "post";

        Panel PostProfile = new Panel();
        PostProfile.CssClass = "post-profile";

        Image PostProfileImg = new Image();
        PostProfileImg.ImageUrl = "~/assets/img/guest-profile.png";

        Literal PostAuthor = new Literal();
        PostAuthor.Text = "<h5>" + doc.XPathSelectElement("/post/post-author").Value + "</h5>";

        Label PostTimestamp = new Label();
        PostTimestamp.CssClass = "post-timestamp";
        PostTimestamp.Text = doc.XPathSelectElement("/post").Attribute("timestamp").Value;

        Literal PostTitle = new Literal();
        PostTitle.Text = "<h3>" + doc.XPathSelectElement("/post/post-title").Value + " </h3>";

        Image PostImage = new Image();
        PostImage.ImageUrl = doc.XPathSelectElement("/post/post-img-url").Value;
        PostImage.CssClass = "post-image";

        Literal PostText = new Literal();
        PostText.Text = "<p class='post-text readMore'>" +doc.XPathSelectElement("/post/post-text").Value + "</p>";

        Panel PostOptions = new Panel();
        PostOptions.CssClass = "post-options";

        LinkButton PostUpvoteBtn = new LinkButton();
        PostUpvoteBtn.Text = "Upvote ";
        PostUpvoteBtn.CssClass = "upvote";

        Label PostUpvotes = new Label();
        PostUpvotes.CssClass = "post-upvotes";
        PostUpvotes.Text = "(" + doc.XPathSelectElement("/post/post-options/post-upvotes").Value + ")";

        LinkButton PostCommentBtn = new LinkButton();
        PostCommentBtn.Text = "Comment ";
        PostCommentBtn.CssClass = "comment";

        Label PostComments = new Label();
        PostComments.CssClass = "post-Comments";
        PostComments.Text = "(" + doc.XPathSelectElement("/post/post-options/post-upvotes").Value + ")";

        LinkButton PostMoreBtn = new LinkButton();
        PostMoreBtn.Text = "More ";
        PostMoreBtn.CssClass = "more";

        Panel PostCommentSection = new Panel();
        PostCommentSection.CssClass = "post-comment-section";

        foreach (XElement XPostComment in doc.XPathSelectElements("/post/post-comment-section/post-comment"))
        {
            Panel PostComment = new Panel();
            PostComment.CssClass = "post-comment";

            Panel CommentProfile = new Panel();
            CommentProfile.CssClass = "comment-profile user-profile";

            Image CommentProfileImg = new Image();
            CommentProfileImg.ImageUrl = "~/assets/img/guest-profile.png";

            Literal CommentAuthor = new Literal();
            CommentAuthor.Text = "<h5>" + XPostComment.XPathSelectElement("comment-author").Value + "</h5>";

            Label CommentTimestamp = new Label();
            CommentTimestamp.CssClass = "comment-timestamp";
            CommentTimestamp.Text = XPostComment.XPathSelectElement(".").Attribute("timestamp").Value;

            Literal CommentText = new Literal();
            CommentText.Text = "<p class='commen-text readMore'>" + XPostComment.XPathSelectElement("comment-text").Value + "</p>";

            Panel CommentOptions = new Panel();
            CommentOptions.CssClass = "comment-options";

            LinkButton CommentUpvoteBtn = new LinkButton();
            CommentUpvoteBtn.Text = "Upvote ";
            CommentUpvoteBtn.CssClass = "upvote";

            Label CommentUpvotes = new Label();
            CommentUpvotes.CssClass = "comment-upvotes";
            CommentUpvotes.Text = "(" + XPostComment.XPathSelectElement("comment-options/comment-upvotes").Value  + ")";

            LinkButton CommentReplyBtn = new LinkButton();
            CommentReplyBtn.Text = "Reply ";
            CommentReplyBtn.CssClass = "reply";

            Label CommentReplys = new Label();
            CommentReplys.CssClass = "comment-replys";
            CommentReplys.Text = "(" + XPostComment.XPathSelectElement("comment-options/comment-replys").Value + ")";

            LinkButton CommentMoreBtn = new LinkButton();
            CommentMoreBtn.Text = "More ";
            CommentMoreBtn.CssClass = "more";

            Panel CommentReplySection = new Panel();
            CommentReplySection.CssClass = "comment-reply-section";

            foreach (XElement XCommentReply in XPostComment.XPathSelectElements("comment-reply-section/comment-reply"))
            {
                Panel CommentReply = new Panel();
                CommentReply.CssClass = "comment-reply";

                Panel ReplyProfile = new Panel();
                ReplyProfile.CssClass = "reply-profile user-profile";

                Image ReplyProfileImg = new Image();
                ReplyProfileImg.ImageUrl = "~/assets/img/guest-profile.png";

                Literal ReplyAuthor = new Literal();
                ReplyAuthor.Text = "<h5>" + XCommentReply.XPathSelectElement("reply-author").Value + "</h5>";

                Label ReplyTimestamp = new Label();
                ReplyTimestamp.CssClass = "reply-timestamp";
                ReplyTimestamp.Text = XCommentReply.XPathSelectElement(".").Attribute("timestamp").Value;

                Literal ReplyText = new Literal();
                ReplyText.Text = "<p class='reply-text readMore'>" + XCommentReply.XPathSelectElement("reply-text").Value + "</p>";

                Panel ReplyOptions = new Panel();
                ReplyOptions.CssClass = "reply-options";

                LinkButton ReplyUpvoteBtn = new LinkButton();
                ReplyUpvoteBtn.Text = "Upvote ";
                ReplyUpvoteBtn.CssClass = "upvote";

                Label ReplyUpvotes = new Label();
                ReplyUpvotes.CssClass = "reply-upvotes";
                ReplyUpvotes.Text = "(" + XCommentReply.XPathSelectElement("reply-options/reply-upvotes").Value + ")";

                LinkButton ReplyReplyBtn = new LinkButton();
                ReplyReplyBtn.Text = "Reply ";
                CommentReplyBtn.CssClass = "reply";

                LinkButton ReplyMoreBtn = new LinkButton();
                ReplyMoreBtn.Text = "More ";
                ReplyMoreBtn.CssClass = "more";

                ReplyProfile.Controls.Add(ReplyProfileImg);
                ReplyProfile.Controls.Add(ReplyAuthor);
                ReplyProfile.Controls.Add(ReplyTimestamp);

                ReplyOptions.Controls.Add(ReplyUpvoteBtn);
                ReplyOptions.Controls.Add(ReplyUpvotes);
                ReplyOptions.Controls.Add(ReplyReplyBtn);
                ReplyOptions.Controls.Add(ReplyMoreBtn);

                CommentReply.Controls.Add(ReplyProfile);
                CommentReply.Controls.Add(ReplyText);
                CommentReply.Controls.Add(ReplyOptions);

                CommentReplySection.Controls.Add(CommentReply);


            }


            CommentProfile.Controls.Add(CommentProfileImg);
            CommentProfile.Controls.Add(CommentAuthor);
            CommentProfile.Controls.Add(CommentTimestamp);

            CommentOptions.Controls.Add(CommentUpvoteBtn);
            CommentOptions.Controls.Add(CommentUpvotes);
            CommentOptions.Controls.Add(CommentReplyBtn);
            CommentOptions.Controls.Add(CommentReplySection);
            CommentOptions.Controls.Add(CommentMoreBtn);

            PostComment.Controls.Add(CommentProfile);
            PostComment.Controls.Add(CommentText);
            PostComment.Controls.Add(CommentOptions);
            PostComment.Controls.Add(CommentReplySection);

            PostCommentSection.Controls.Add(PostComment);
        }
        
        
        PostProfile.Controls.Add(PostProfileImg);
        PostProfile.Controls.Add(PostAuthor);
        PostProfile.Controls.Add(PostTimestamp);

        PostOptions.Controls.Add(PostUpvoteBtn);
        PostOptions.Controls.Add(PostUpvotes);
        PostOptions.Controls.Add(PostCommentBtn);
        PostOptions.Controls.Add(PostComments);
        PostOptions.Controls.Add(PostMoreBtn);

        Post.Controls.Add(PostProfile);
        Post.Controls.Add(PostTitle);
        Post.Controls.Add(PostImage);
        Post.Controls.Add(PostText);
        Post.Controls.Add(PostOptions);
        Post.Controls.Add(PostCommentSection);

        Posts.Controls.Add(Post);

        //Panel post1 = new Panel()
        //{

        //}













    }


    protected void replyReplyAnchor_Click(object sender, EventArgs e)
    {
        //if ((Session["username"] != null))
        //    commentNewReply.Visible = true;
        //else Response.Redirect("~/Login.aspx");
    }
}