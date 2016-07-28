<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #user-profile.fb-profile{
            display: none;
            visibility: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="login-container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <div class="form-signin">
                <%--<span  ></span>--%>
                <asp:Label id="reauthEmail" class="reauth-email" runat="server" Text=""></asp:Label>
                <asp:TextBox id="inputEmail" name="inputEmail" class="form-control" runat="server" placeholder="Email address" TextMode="Email" required="true" autofocus="true"></asp:TextBox>
                <asp:TextBox id="inputPassword" name="inputPassword" class="form-control" runat="server" placeholder="Password" TextMode="Password" required="true"></asp:TextBox>
                 <%--<input type="email" id="inputEmail" name="inputEmail" class="form-control" runat="server" placeholder="Email address" required autofocus>--%>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <asp:Button class="btn btn-lg btn-primary btn-block btn-signin" ID="btnSignIn" runat="server" type="submit" Text="Sign in" OnClick="btnSignIn_Click" />
                <%--<button  onclick="SignIn_Click" runat="server">Sign in</button>--%>
            </div><!-- /form -->
            <a href="#" class="forgot-password">
                Forgot the password?
            </a>
        </div><!-- /card-container -->
      </div>
</asp:Content>