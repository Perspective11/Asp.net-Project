<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Index.aspx.cs" Inherits="_Default" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>--%>

<asp:Content runat="server" ID="index" ContentPlaceHolderID="MainContent">

    <div class="post ">
        <div class="post-profile user-profile">
            <img src="assets/img/guest-profile.png" alt="user profile" />
            <h5>Aiman Nouman</h5>
            <span class="post-timestamp">22/5/1993</span>
        </div> <%--end of post profile--%>
        <h3 class="post-title">How to become a famous Web Developer</h3>
        <img class="post-image" src="assets/img/Wall-e.jpg" alt="post image"/>
        <p class="post-text">Haul wind brig gunwalls sutler Sink me Corsair topsail Arr nipperkin quarterdeck. Shrouds handsomely coffer gaff Sail ho Sink me fluke jack scurvy killick. Poop deck Davy Jones' Locker crimp wench keel six pounders nipper American Main lass belay.
Pirate Round Plate Fleet lad Letter of Marque long boat Blimey prow hands list jury mast. Bounty bowsprit jack heave down hail-shot Shiver me timbers Jack Tar blow the man down Brethren of the Coast bring a spring upon her cable. Quarter warp crow's nest Sail ho heave to draft nipper Gold Road nipperkin boom.
List port grapple hang the jib piracy square-rigged Sail ho splice the main brace Buccaneer schooner. Bilge black jack Arr handsomely ho pink boatswain take a caulk matey avast. Run a rig nipper Pieces of Eight Brethren of the Coast killick run a shot across the bow trysail keel deadlights tackle.</p>
        <div class="post-options">
            <a class="upvote">Upvote <span class="post-upvotes" >(200)</span></a>
            <a class="comment">Comment <span class="post-comments">(350)</span></a>
            <a class="more">More</a>
        </div>
        <div class="post-info">
            
            
        </div><%--end of post info--%>
        <div class="post-comment-section">
            <div class="post-comment">
                <div class="comment-profile user-profile">
                    <img src="assets/img/guest-profile.png" alt="user profile" />
                    <h5>Some Guy</h5>
                </div> <%--end of comment profile--%>
                <p class="comment-text">Marooned run a shot across the bow dance the hempen jig hulk to go on account fluke long boat Jack Ketch Jack Tar booty. Clipper carouser jib quarter driver coxswain mizzen brigantine bilge water shrouds. Sea Legs bounty Admiral of the Black run a rig Pieces of Eight scallywag bilge rat lateen sail spirits quarterdeck.</p>
                <div class="comment-options">
                    <a class="upvote">Upvote</a>
                    <a class="reply">Reply</a>
                    <a class="more">More</a>
                </div>
                <div class="comment-info">
                    <span class="comment-upvotes">2</span>
                    <span class="comment-replys">3</span>
                </div><%--end of comment info--%>
                <div class="comment-reply-section hidden">
                    <div class="comment-reply">
                        <div class="reply-profile user-profile">
                            <img src="assets/img/guest-profile.png" alt="user profile" />
                            <h5>Some Other Guy</h5>
                        </div><%--end of reply profile--%>
                        <p class="reply-text">Sutler boom pink splice the main brace reef chase scurvy ye man-of-war sloop. Starboard topgallant pirate bilge water wherry draft league scuttle cog skysail. Code of conduct bounty execution dock hogshead fathom shrouds walk the plank strike colors schooner man-of-war.</p>
                        <div class="reply-options">
                            <a class="upvote">Upvote</a>
                            <a class="reply">Reply</a>
                            <a class="more">More</a>
                        </div>
                        <div class="reply-info">
                            <span class="reply-timestamp">5/2/2016</span>
                            <span class="reply-upvotes">4</span>
                        </div><%--end of reply info--%>
                    </div><%--end of comment reply--%>
                </div><%--end of comment reply section--%>
            </div> <%--end of post comment--%>
            <div class="post-new-comment hidden">
                <label></label><input></input>
                <label></label><textarea></textarea>
                <label></label><%--<ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" />--%>
            </div><%--end of post new comment--%>
        </div><%--end of post comment section--%>
    </div><%--end of post--%>
</asp:Content>
