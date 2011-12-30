<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<AltusSystem.Models.LogOnModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Log On</title>
    <link href="/Content/stylesheet_default.css" rel="stylesheet" type="text/css" />
    <link href="/Content/FormLayout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="loginContent">
        <% using (Html.BeginForm())
           { %>
        <ul class="ul">
            <li>
                <h2>
                    Log On</h2>
            </li>
            <li>
                <%= Html.ValidationSummary(true, "Login was unsuccessful. Please correct the errors and try again.") %>
            </li>
            <li>
                <%= Html.LabelFor(m => m.UserName) %>
            </li>
            <li>
                <%= Html.TextBoxFor(m => m.UserName) %>
                <%= Html.ValidationMessageFor(m => m.UserName) %>
            </li>
            <li>
                <%= Html.LabelFor(m => m.Password) %>
            </li>
            <li>
                <%= Html.PasswordFor(m => m.Password) %>
                <%= Html.ValidationMessageFor(m => m.Password) %>
            </li>
            <li>
                <%= Html.CheckBoxFor(m => m.RememberMe) %>
                <%= Html.LabelFor(m => m.RememberMe) %>
            </li>
            <li>
                <input type="submit" value="Log On" />
            </li>
        </ul>
        <% } %>
    </div>
</body>
</html>