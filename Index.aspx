<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Index.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content runat="server" ID="index" ContentPlaceHolderID="MainContent">

    <div class="post">
        <h3 class="post-title"></h3>
        <img class="post-image" src="#" alt="post image"/>
        <div class="post-profile user-profile">
            <img src="#" alt="user profile" />
            <h5></h5>
        </div> <%--end of post profile--%>
        <p class="post-text"></p>
        <div class="post-options"></div>
        <div class="post-info">
            <span class="post-timestamp"></span>
            <span class="post-upvotes"></span>
            <span class="post-comments"></span>
        </div><%--end of post info--%>
        <div class="post-comment-section">
            <div class="post-comment">
                <div class="comment-profile user-profile">
                    <img src="#" alt="user profile" />
                    <h5></h5>
                </div> <%--end of comment profile--%>
                <p class="comment-text"></p>
                <div class="comment-options"></div>
                <div class="comment-info">
                    <span class="comment-timestamp"></span>
                    <span class="comment-upvotes"></span>
                    <span class="comment-replys"></span>
                </div><%--end of comment info--%>
                <div class="comment-reply-section hidden">
                    <div class="comment-reply">
                        <div class="reply-profile user-profile">
                            <img src="#" alt="user profile" />
                            <h5></h5>
                        </div><%--end of reply profile--%>
                        <p class="reply-text"></p>
                        <div class="reply-options"></div>
                        <div class="reply-info">
                            <span class="reply-timestamp"></span>
                            <span class="reply-upvotes"></span>
                        </div><%--end of reply info--%>
                    </div><%--end of comment reply--%>
                </div><%--end of comment reply section--%>
            </div> <%--end of post comment--%>
            <div class="post-new-comment hidden">
                <label></label><input></input>
                <label></label><textarea></textarea>
                <label></label><ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" />
            </div><%--end of post new comment--%>
        </div><%--end of post comment section--%>
    </div><%--end of post--%>
</asp:Content>
