using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AltusSystemDL;

namespace AltusSystem.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Pages(string pid)
        {
            if (string.IsNullOrEmpty(pid))
                ViewData["Content"] = "";
            else
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                var count = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                             where c.Name.ToLower().Trim().Equals(pid.ToLower().Trim())
                             select c).Count();
                if (count > 0)
                {
                    var page = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                                where c.Name.ToLower().Trim().Equals(pid.ToLower().Trim())
                                select c).First();
                    ViewData["Content"] = page.Content;
                }
                else
                    ViewData["Content"] = "";
            }
            return View();
        }

        public FileContentResult Photo(string pid)
        {
            try
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                List<File> files = (from c in scope.GetOqlQuery<File>().ExecuteEnumerable()
                                    where c.Id.Equals(pid)
                                    select c).ToList();
                if (files.Count > 0)
                {
                    return File(files[0].Filedata, files[0].MimeType, files[0].Filename);
                }
            }
            catch (Exception)
            {
                return null;
            }
            return null;
        }

        public ActionResult Index()
        {
            Response.Redirect("/Index.htm");
            return null;
        }
    }
}