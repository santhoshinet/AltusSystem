using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AltusSystem.Models;
using AltusSystemDL;
using File = AltusSystemDL.File;

namespace AltusSystem.Controllers
{
    public class ControlpanelController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            return View();
        }

        [HttpGet]
        public ActionResult Pages()
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            var scope = ObjectScopeProvider1.GetNewObjectScope();
            var pages = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                         select c).ToList();
            ViewData["webpageList"] = pages;
            return View();
        }

        [HttpGet]
        public ActionResult Images()
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            LoadImages();
            return View();
        }

        [HttpGet]
        public ActionResult InsertImage()
        {
            LoadImages();
            return View(new ImageModel());
        }

        private void LoadImages()
        {
            var scope = ObjectScopeProvider1.GetNewObjectScope();
            var files = (from c in scope.GetOqlQuery<File>().ExecuteEnumerable()
                         select c).ToList();
            ViewData["fileList"] = files;
        }

        [HttpGet]
        public ActionResult EditPage(string pid)
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            if (pid != null)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                var pages = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                             where c.Id != null && c.Id.Equals(pid)
                             select c).ToList();
                var contentPage = new PageModel();
                foreach (ContentPage page in pages)
                {
                    contentPage.PageTitle = page.Name;
                    contentPage.Content = page.Content;
                    contentPage.ID = page.Id;
                    break;
                }
                return View(contentPage);
            }
            return RedirectToAction("Pages");
        }

        [HttpGet]
        public ActionResult AddPage()
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            return View(new PageModel());
        }

        [HttpGet]
        public ActionResult AddImage()
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            return View(new ImageModel());
        }

        [HttpGet]
        public ActionResult Ajaxaddimage()
        {
            ViewData["Status"] = "";
            return View(new ImageModel());
        }

        [HttpPost]
        public ActionResult Ajaxaddimage(ImageModel file, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                scope.Transaction.Begin();
                var productFile = new File { Filename = image.FileName };
                Stream fileStream = image.InputStream;
                int fileLength = image.ContentLength;
                productFile.Filedata = new byte[fileLength];
                fileStream.Read(productFile.Filedata, 0, fileLength);
                productFile.MimeType = image.ContentType;
                productFile.Id = DateTime.Now.Ticks.ToString();
                scope.Add((productFile));
                scope.Transaction.Commit();
                ViewData["Status"] = "Image added successfully.";
                return View(new ImageModel());
            }
            return View(file);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult EditPage(PageModel pageModel)
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            if (ModelState.IsValid)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                var pages = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                             where c.Id != null && c.Id.Equals(pageModel.ID)
                             select c).ToList();
                foreach (ContentPage page in pages)
                {
                    scope.Transaction.Begin();
                    page.Name = pageModel.PageTitle;
                    page.Content = pageModel.Content;
                    scope.Add(page);
                    scope.Transaction.Commit();
                    try
                    {
                        using (var connection = new SqlConnection("Data Source=208.91.198.196;Initial Catalog=admin_sruthilaya;Persist Security Info=True;User ID=sruthilaya;Password=password@123"))
                        {
                            connection.Open();
                            string qry = "update content_page set [<_content>k___backing_field] = '" + pageModel.Content + "' where [<_i_d>k___backing_field]='" + page.Id + "'";
                            var command = new SqlCommand(qry, connection);
                            command.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                    catch (Exception)
                    {
                        continue;
                    }
                    break;
                }
                return RedirectToAction("Pages");
            }
            return View(pageModel);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddPage(PageModel adPageModel)
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            if (ModelState.IsValid)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                var contentPage = new ContentPage { Name = adPageModel.PageTitle, Content = adPageModel.Content, Id = DateTime.Now.Ticks.ToString() };
                scope.Transaction.Begin();
                scope.Add(contentPage);
                scope.Transaction.Commit();
                try
                {
                    using (var connection = new SqlConnection("Data Source=208.91.198.196;Initial Catalog=admin_sruthilaya;Persist Security Info=True;User ID=sruthilaya;Password=password@123"))
                    {
                        connection.Open();
                        string qry = "update content_page set [<_content>k___backing_field] = '" + adPageModel.Content + "' where [<_i_d>k___backing_field]='" + contentPage.Id + "'";
                        var command = new SqlCommand(qry, connection);
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Pages");
                }
                return RedirectToAction("Pages");
            }
            return View(adPageModel);
        }

        [HttpPost]
        public ActionResult AddImage(ImageModel file, HttpPostedFileBase image)
        {
            if (!User.Identity.IsAuthenticated)
                return RedirectToAction("LogOn", "Account");
            if (ModelState.IsValid)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                scope.Transaction.Begin();
                var productFile = new File { Filename = image.FileName };
                Stream fileStream = image.InputStream;
                int fileLength = image.ContentLength;
                productFile.Filedata = new byte[fileLength];
                fileStream.Read(productFile.Filedata, 0, fileLength);
                productFile.MimeType = image.ContentType;
                productFile.Id = DateTime.Now.Ticks.ToString();
                scope.Add((productFile));
                scope.Transaction.Commit();
                return RedirectToAction("Images");
            }
            return View(file);
        }

        public ActionResult DeletePage(string pid)
        {
            var scope = ObjectScopeProvider1.GetNewObjectScope();
            var pages = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                         where c.Id != null && c.Id.Equals(pid)
                         select c).ToList();
            foreach (var contentPage in pages)
            {
                scope.Transaction.Begin();
                scope.Remove(contentPage);
                scope.Transaction.Commit();
            }
            return RedirectToAction("Pages");
        }

        public ActionResult DeleteImage(string id)
        {
            var scope = ObjectScopeProvider1.GetNewObjectScope();
            var images = (from c in scope.GetOqlQuery<File>().ExecuteEnumerable()
                          where c.Id.Equals(id)
                          select c).ToList();
            foreach (var image in images)
            {
                scope.Transaction.Begin();
                scope.Remove(image);
                scope.Transaction.Commit();
            }
            return RedirectToAction("Images");
        }
    }
}