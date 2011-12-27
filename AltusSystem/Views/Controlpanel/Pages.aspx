<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="AltusSystem" %>
<%@ Import Namespace="AltusSystemDL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Pages</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                <h2>List of web pages.</h2>
            </li>
            <li>
                <table id="Cart_Table" class="Cart_Table">
                    <thead>
                        <tr>
                            <th style="width:30px;">Sno</th>
                            <th style="width:240px;">Page Title</th>
                            <th style="width:175px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            foreach (var webPage in webpageList)
                            {%>
                                <tr id='<%= webPage.Name %>'>
                                    <td><%= index++%></td>
                                    <td><%= webPage.Name %></td>
                                    <td>
                                        <a href="/editpage/<%= webPage.ID %>" class="ViewProfile" >Edit Page</a>
                                        <a href="/deletepage/<%= webPage.ID %>" class="ViewProfile" >Delete Page</a>
                                    </td>
                                </tr>
                            <%
                            }%>
                    </tbody>
                </table>
              </li>
              <li>
                    <table class="Cart_Table">
                        <tr>
                            <td><a href="/controlpanel/addpage" >Add new page</a></td>
                        </tr>
                    </table>
              </li>
          </ul>
        </form>
        <%
            }
           else
           {%>
           <ul class="ul">
           <li>
        <h2>
            There is no web page created yet.</h2>
            </li>
            <li>
                <label><a href="/controlpanel/addpage" >Add new page</a></label>
            </li>
            </ul>
        <%}%>
    </div>
</asp:Content>