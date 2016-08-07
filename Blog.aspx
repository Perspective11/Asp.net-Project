<%@ Page Title="Blog" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <% foreach (XDocument postXml in postsXml)
        {
    %> <%--foreach to iterate through the posts--%>
    <div class="post">
        <div class="post-profile user-profile">
            <img src="assets/img/guest-profile.png" alt="user profile" />
            <h5><%= postXml.Root.Element("post-author").Value %></h5>
            <span class="post-timestamp"><%= postXml.Root.Element("post-timestamp").Value %></span>
        </div>
        <%--end of post profile--%>
        <h3 class="post-title"><%= postXml.Root.Element("post-title").Value %></h3>
        <img class="post-image" src="assets/img/Wall-e.jpg" alt="post image" />
        <p class="post-text readMore">
            <%= postXml.Root.Element("post-text").Value %>
        </p>
        <div class="post-options">
            <a class="upvote">Upvote </a><span class="post-upvotes">(<%= postXml.Root.Element("post-options").Element("post-upvotes").Value %>)</span>
            <a class="comment">Comment </a><span class="post-comments">(<%= postXml.Root.Element("post-options").Element("post-comments").Value %>)</span>
            <a class="more">More</a>
        </div>

        <div class="post-comment-section">
            <%  foreach (var commentElement in postXml.Root.Elements("post-comment-section").Elements())
                {

            %> <%--foreach to iterate through the comments within the post--%>
            <div class="post-comment">
                <div class="comment-profile user-profile">
                    <img src="assets/img/guest-profile.png" alt="user profile" />
                    <h5><%= commentElement.Element("comment-author").Value %></h5>
                    <span class="comment-timestamp"><%= commentElement.Element("comment-timestamp").Value %></span>
                </div>
                <%--end of comment profile--%>
                <p class="comment-text readMore"><%= commentElement.Element("comment-text").Value %></p>
                <div class="comment-options">
                    <asp:LinkButton runat="server" class="upvote" id="commentUpvoteAnchor">Upvote </asp:LinkButton><span class="comment-upvotes">(<%= commentElement.Element("comment-options").Element("comment-upvotes").Value %>)</span>
                    <asp:LinkButton class="reply" id="commentReplyAnchor" runat="server" OnClick="replyReplyAnchor_Click">Reply</asp:LinkButton><span class="comment-replys">(<%= commentElement.Element("comment-options").Element("comment-replys").Value %>)</span>
                    <a class="more">More</a>
                </div>

                <div class="comment-reply-section ">
                    <% foreach (var replyElement in commentElement.Element("comment-reply-section").Elements())
                        {
                    %> <%--foreach to iterate through the the replys within the comment--%>

                    <div class="comment-reply">
                        <div class="reply-profile user-profile">
                            <img src="assets/img/guest-profile.png" alt="user profile" />
                            <h5><%= replyElement.Element("reply-author").Value %></h5>
                            <span class="reply-timestamp"><%= replyElement.Element("reply-timestamp").Value %></span>
                        </div>
                        <%--end of reply profile--%>
                        <p class="reply-text readMore"><%= replyElement.Element("reply-text").Value %></p>
                        <div class="reply-options">
                            <asp:LinkButton class="upvote" id="replyUpvoteAnchor" runat="server">Upvote </asp:LinkButton><span class="reply-upvotes">(<%= replyElement.Element("reply-options").Element("reply-upvotes").Value %>)</span>
                            <asp:LinkButton class="reply" id="replyReplyAnchor" runat="server" OnClick="replyReplyAnchor_Click">Reply</asp:LinkButton>
                            <a class="more">More</a>
                        </div>
                    </div>

                    <%--end of comment reply--%>
                    <% } %> <%-- end of foreach to iterate through the the replys within the comment--%>
                    <div class="comment-new-reply" id="commentNewReply" runat="server" visible="false">
                        <img class="fb-image-profile thumbnail" src=<%= (Session["imgSaved"] != null) ? "assets/img/profile-pic.jpeg" : "assets/img/guest-profile.png" %> alt="Profile Image" />
                        <textarea runat="server" class="new-reply-txt" id="Textarea1" placeholder="Write your reply"></textarea>
                        <asp:Button runat="server" class="new-reply-btn" CssClass="new-reply-btn" id="BtnNewReply" Text="Submit" />
                    </div>

                    <%--end of comment new reply--%>
                </div>
                <%--end of comment reply section--%>
            </div>
            <%--end of post comment--%>
            <% } %> <%-- end of foreach to iterate through the comments within the post--%>
            <div class="post-new-comment" id="postNewComment" runat="server" visible="false">
                <img class="fb-image-profile thumbnail" src=<%= (Session["imgSaved"] != null) ? "assets/img/profile-pic.jpeg" : "assets/img/guest-profile.png" %> alt="Profile Image" />
                <textarea runat="server" class="new-comment-txt" id="TxtNewComment" placeholder="Write your comment"></textarea>
                <asp:Button runat="server" class="new-comment-btn" CssClass="new-comment-btn" id="BtnNewComment" Text="Submit" />
            </div>
            <%--end of post new comment--%>
        </div>
        <%--end of post comment section--%>
    </div>
    <%--end of post--%>
    <%}; %> <%-- end of foreach to iterate through the posts--%>
</asp:Content>

