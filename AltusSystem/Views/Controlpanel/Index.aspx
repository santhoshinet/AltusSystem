<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Control Panel</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="loginContent">
        <h2>
            Control panel</h2>
        <p>
            Manage your site content.</p>
        <div class="container">
            <div class="left">
                <a href="/Controlpanel/images">Manage Images</a></div>
            <div class="right">
                <a href="/Controlpanel/pages">Manage Pages</a>
            </div>
        </div>
    </div>
</asp:Content>