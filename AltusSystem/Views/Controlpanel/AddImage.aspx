<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AltusSystem.Models.ImageModel>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">AddImage</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="loginContent">
        <% using (Html.BeginForm("AddImage", "Controlpanel", FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>
           <ul class="ul">
            <li>
                <h2>Add Image</h2>
            </li>
            <li>
                <%=Html.ValidationSummary(true,"Unable to add product. Please correct the errors and try again.")%>
            </li>
            <li>
                <label>File</label>
            </li>
            <li>
                <input type="file" name="image" />
                <%=Html.ValidationMessageFor(m => m.Image)%>
            </li>
            <li>
                <input type="submit" value="Add images" />
                <%= Html.HiddenFor(m => m.Id) %>
            </li>
        </ul>
        <%
            }%>
</asp:Content>