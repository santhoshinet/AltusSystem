<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="AltusSystemDL" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pages</title>
    <link href="/Content/stylesheet_default.css" rel="stylesheet" type="text/css" />
    <link href="/Content/FormLayout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="loginContent">
        <%
            var webpageList = (List<ContentPage>)ViewData["webpageList"];
            int index = 1; %>
        <% if (webpageList.Count > 0)
           {
        %>
        <form method="post" action="Checkout">
        <ul class="ul">
            <li>
                <h2>
                    List of web pages.</h2>
            </li>
            <li>
                <table id="Cart_Table" class="Cart_Table">
                    <thead>
                        <tr>
                            <th style="width: 30px;">
                                Sno
                            </th>
                            <th style="width: 240px;">
                                Page Title
                            </th>
                            <th style="width: 175px;">
                                Actions
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            foreach (var webPage in webpageList)
                            {%>
                        <tr id='<%= webPage.Name %>'>
                            <td>
                                <%= index++%>
                            </td>
                            <td>
                                <%= webPage.Name %>
                            </td>
                            <td>
                                <a href="/editpage/<%= webPage.Id %>" class="ViewProfile">Edit Page</a> <a href="/deletepage/<%= webPage.Id %>"
                                    class="ViewProfile">Delete Page</a>
                            </td>
                        </tr>
                        <%
                            }%>
                    </tbody>
                </table>
            </li>
            <li>
                <input type="button" value="Add new page" onclick="window.location = '/controlpanel/addpage';" />
                <input type="button" value="Controlpanel" onclick="window.location = '/controlpanel';" />
            </li>
        </ul>
        </form>
        <%
            }
           else
           {%>
           <form method="post" action="">
        <ul class="ul">
            <li>
                <h2>
                    There is no web page created yet.</h2>
            </li>
            <li>
                <input type="button" value="Add new page" onclick="window.location = '/controlpanel/addpage';" />
                <input type="button" value="Home" onclick="window.location = '/controlpanel';" />
            </li>
        </ul>
        </form>
        <%}%>
    </div>
</body>
</html>