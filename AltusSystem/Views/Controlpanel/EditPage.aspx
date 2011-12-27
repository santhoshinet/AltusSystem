<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AltusSystem.Models.PageModel>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">EditPage</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="loginContent">
        <% using (Html.BeginForm("EditPage", "Controlpanel", FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>
            <ul class="ul">
                <li>
                    <h2>Edit Page</h2>
                </li>
                <li>
                    <%=Html.ValidationSummary(true,"Unable to add page. Please correct the errors and try again.")%>
                </li>
                <li>
                    <label>Title</label>
                </li>
                <li>
                    <%=Html.TextBoxFor(m => m.PageTitle)%>
                    <%=Html.ValidationMessageFor(m => m.PageTitle)%>
                </li>
                <li>
                    <label>Content</label>
                </li>
                <li>
                    <%=Html.TextAreaFor(m => m.Content, new { @class = "textarea" })%>
                    <%=Html.ValidationMessageFor(m => m.Content)%>
                </li>
                <li>
                    <input type="submit" value="Edit page" />
                    <%= Html.HiddenFor(m => m.ID) %>
                </li>
            </ul>
        <%
            }%>
    </div>
<script src="/Scripts/jquery-1.6.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/Scripts/jquery-ui-1.8.13.custom.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/Scripts/elrte.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="/Content/smoothness/jquery-ui-1.8.13.custom.css" type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet" href="/Content/elrte.min.css" type="text/css" media="screen" charset="utf-8" />
<script src="/Scripts/i18n/elrte.ru.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
        $().ready(function() {
            var opts = {
                cssClass: 'el-rte',
                // lang     : 'ru',
                height: 450,
                toolbar: 'complete',
                cssfiles: ['/Content/elrte-inner.css']
            }
            $('.textarea').elrte(opts);
        })
</script>
</asp:Content>