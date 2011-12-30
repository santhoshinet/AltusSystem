<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<AltusSystem.Models.ChangePasswordModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Change Password</title>
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
                    Change Password</h2>
            </li>
            <li>
                <%= Html.ValidationSummary(true, "Password change was unsuccessful. Please correct the errors and try again.") %>
            </li>
            <li>
                <%= Html.LabelFor(m => m.OldPassword) %>
            </li>
            <li>
                <%= Html.PasswordFor(m => m.OldPassword) %>
                <%= Html.ValidationMessageFor(m => m.OldPassword) %>
            </li>
            <li>
                <%= Html.LabelFor(m => m.NewPassword) %>
            </li>
            <li>
                <%= Html.PasswordFor(m => m.NewPassword) %>
                <%= Html.ValidationMessageFor(m => m.NewPassword) %>
            </li>
            <li>
                <%= Html.LabelFor(m => m.ConfirmPassword) %>
            </li>
            <li>
                <%= Html.PasswordFor(m => m.ConfirmPassword) %>
                <%= Html.ValidationMessageFor(m => m.ConfirmPassword) %>
            </li>
            <li>
                <input type="submit" value="Change Password" />
            </li>
        </ul>
        <% } %>
    </div>
</body>
</html>