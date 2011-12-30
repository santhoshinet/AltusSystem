<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Control Panel</title>
    <link href="/Content/stylesheet_default.css" rel="stylesheet" type="text/css" />
    <link href="/Content/FormLayout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="loginContent">
    <form action="" method="post">
        <ul class="ul">
            <li>
                <h2>
                    Control panel</h2>
            </li>
            <li>
                <p>
                    Manage your site content.</p>
            </li>
            <li>
                <input type="button" value="Manage Images" onclick="window.location = '/controlpanel/Images';" />
                <input type="button" value="Manage Pages" onclick="window.location = '/controlpanel/Pages';" />
            </li>
         </ul>
    </form>
</div>
</body>
</html>