<%@  Language="C#"  Inherits="System.Web.Mvc.ViewPage" %>
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
                <label>
                    Your password has been changed successfully.</label>
            </li>
        </ul>
    </div>
</body>
</html>