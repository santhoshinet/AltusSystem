<%@ Page Language="C#"  Inherits="System.Web.Mvc.ViewPage<AltusSystem.Models.RegisterModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register</title>
    <link href="/Content/stylesheet_default.css" rel="stylesheet" type="text/css" />
    <link href="/Content/FormLayout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="loginContent">
        <% using (Html.BeginForm())
           {%>
        <ul class="ul">
            <li>
                <h2>
                    Create a New Account</h2>
            </li>
            <li>
                <p>
                    Use the form below to create a new account.
                </p>
                <p>
                    Passwords are required to be a minimum of
                    <%=Html.Encode(ViewData["PasswordLength"])%>
                    characters in length.
                </p>
                <%=Html.ValidationSummary(true,
                                                        "Account creation was unsuccessful. Please correct the errors and try again.")%>
            </li>
            <li>
                <%=Html.LabelFor(m => m.UserName)%></li>
            <li>
                <%=Html.TextBoxFor(m => m.UserName)%>
                <%=Html.ValidationMessageFor(m => m.UserName)%>
            </li>
            <li>
                <%=Html.LabelFor(m => m.Email)%>
            </li>
            <li>
                <%=Html.TextBoxFor(m => m.Email)%>
                <%=Html.ValidationMessageFor(m => m.Email)%>
            </li>
            <li>
                <%=Html.LabelFor(m => m.Password)%>
            </li>
            <li>
                <%=Html.PasswordFor(m => m.Password)%>
                <%=Html.ValidationMessageFor(m => m.Password)%>
            </li>
            <li>
                <%=Html.LabelFor(m => m.ConfirmPassword)%>
            </li>
            <li>
                <%=Html.PasswordFor(m => m.ConfirmPassword)%>
                <%=Html.ValidationMessageFor(m => m.ConfirmPassword)%>
            </li>
            <li>
                <input type="submit" value="Register" />
            </li>
        </ul>
        <%
            }%>
    </div>
</body>
</html>