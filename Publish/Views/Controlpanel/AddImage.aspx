<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<AltusSystem.Models.ImageModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AddImage</title>
    <link href="/Content/stylesheet_default.css" rel="stylesheet" type="text/css" />
    <link href="/Content/FormLayout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <% Html.RenderPartial("Ctrladdimage"); %>
</body>
</html>