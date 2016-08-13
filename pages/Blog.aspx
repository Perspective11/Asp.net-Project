<%@ Page Title="Blog" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="Posts">
        <asp:Panel class="post" ID="PostTemplate" runat="server">
            <div class="post-profile user-profile">
                <img src="/assets/img/guest-profile.png" alt="user profile" />
                <h5>Post Author</h5>
                <span class="post-timestamp">12/12/12 - 11:11:11</span>
            </div>
            <%--end of post profile--%>
            <h3 class="post-title">Post Title</h3>
            <img class="post-image" src="/assets/img/Wall-e.jpg" alt="post image" />
            <p class="post-text readMore">
                Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.
            </p>
            <div class="post-options">
                <a class="upvote">Upvote </a><span class="post-upvotes">(222)</span>
                <a class="comment">Comment </a><span class="post-comments">(22)</span>
                <a class="more">More</a>
            </div>

            <div class="post-comment-section">
                <div class="post-comment">
                    <div class="comment-profile user-profile">
                        <img src="/assets/img/guest-profile.png" alt="user profile" />
                        <h5>Comment Author</h5>
                        <span class="comment-timestamp">10/10/10 - 12:12:12</span>
                    </div>
                    <%--end of comment profile--%>
                    <p class="comment-text readMore">
                        Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut lao
                    </p>
                    <div class="comment-options">
                        <asp:LinkButton runat="server" class="upvote" >Upvote </asp:LinkButton><span class="comment-upvotes">(22)</span>
                        <asp:LinkButton class="reply"  runat="server" OnClick="replyReplyAnchor_Click">Reply</asp:LinkButton><span class="comment-replys">(2)</span>
                        <a class="more">More</a>
                    </div>

                    <div class="comment-reply-section ">

                        <div class="comment-reply">
                            <div class="reply-profile user-profile">
                                <img src="/assets/img/guest-profile.png" alt="user profile" />
                                <h5>Reply Authore</h5>
                                <span class="reply-timestamp">9/9/9 - 8:8:8</span>
                            </div>
                            <%--end of reply profile--%>
                            <p class="reply-text readMore">
                                Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismo
                            </p>
                            <div class="reply-options">
                                <asp:LinkButton class="upvote"  runat="server">Upvote </asp:LinkButton><span class="reply-upvotes">(1)</span>
                                <asp:LinkButton class="reply"  runat="server" OnClick="replyReplyAnchor_Click">Reply</asp:LinkButton>
                                <a class="more">More</a>
                            </div>
                        </div>


                        <div class="comment-new-reply" runat="server" visible="false">
                            <img class="fb-image-profile thumbnail" src='<%= (Session["imgSaved"] != null) ? "/assets/img/profile-pic.jpeg" : "/assets/img/guest-profile.png" %>' alt="Profile Image" />
                            <textarea runat="server" class="new-reply-txt" id="Textarea1" placeholder="Write your reply"></textarea>
                            <asp:Button runat="server" class="new-reply-btn" CssClass="new-reply-btn" ID="BtnNewReply" Text="Submit" />
                        </div>

                        <%--end of comment new reply--%>
                    </div>
                    <%--end of comment reply section--%>
                </div>
                <%--end of post comment--%>
                <div class="post-new-comment"  runat="server" visible="false">
                    <img class="fb-image-profile thumbnail" src='<%= (Session["imgSaved"] != null) ? "/assets/img/profile-pic.jpeg" : "assets/img/guest-profile.png" %>' alt="Profile Image" />
                    <textarea runat="server" class="new-comment-txt" id="TxtNewComment" placeholder="Write your comment"></textarea>
                    <asp:Button runat="server" class="new-comment-btn" CssClass="new-comment-btn"  Text="Submit" />
                </div>
                <%--end of post new comment--%>
            </div>
            <%--end of post comment section--%>
        </asp:Panel>
        <%--end of post--%>
    </asp:Panel>
  
</asp:Content>

