using System;
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
            return View();
        }

        [HttpGet]
        public ActionResult Pages()
        {
            var scope = ObjectScopeProvider1.GetNewObjectScope();
            var pages = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                         select c).ToList();
            ViewData["webpageList"] = pages;
            return View();
        }

        [HttpGet]
        public ActionResult Images()
        {
            var scope = ObjectScopeProvider1.GetNewObjectScope();
            var files = (from c in scope.GetOqlQuery<File>().ExecuteEnumerable()
                         select c).ToList();
            ViewData["fileList"] = files;
            return View();
        }

        [HttpGet]
        public ActionResult EditPage(string pid)
        {
            if (pid != null)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                var pages = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                             where c.ID != null && c.ID.Equals(pid)
                             select c).ToList();
                var contentPage = new PageModel();
                foreach (ContentPage page in pages)
                {
                    contentPage.PageTitle = page.Name;
                    contentPage.Content = page.Content;
                    contentPage.ID = page.ID;
                    break;
                }
                return View(contentPage);
            }
            return RedirectToAction("Pages");
        }

        [HttpGet]
        public ActionResult AddPage()
        {
            return View(new PageModel());
        }

        [HttpGet]
        public ActionResult AddImage()
        {
            return View(new ImageModel());
        }

        [HttpPost]
        public ActionResult EditPage(PageModel pageModel)
        {
            if (ModelState.IsValid)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                var pages = (from c in scope.GetOqlQuery<ContentPage>().ExecuteEnumerable()
                             where c.ID != null && c.ID.Equals(pageModel.ID)
                             select c).ToList();
                foreach (ContentPage page in pages)
                {
                    scope.Transaction.Begin();
                    page.Name = pageModel.PageTitle;
                    page.Content = pageModel.Content;
                    scope.Add(page);
                    scope.Transaction.Commit();
                    break;
                }
                return RedirectToAction("Pages");
            }
            return View(pageModel);
        }

        [HttpPost]
        public ActionResult AddPage(PageModel adPageModel)
        {
            if (ModelState.IsValid)
            {
                var scope = ObjectScopeProvider1.GetNewObjectScope();
                var contentPage = new ContentPage { Name = adPageModel.PageTitle, Content = adPageModel.Content, ID = DateTime.Now.Ticks.ToString() };
                scope.Transaction.Begin();
                scope.Add(contentPage);
                scope.Transaction.Commit();
                return RedirectToAction("Pages");
            }
            return View(adPageModel);
        }

        [HttpPost]
        public ActionResult AddImage(ImageModel file, HttpPostedFileBase image)
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
                productFile.ID = DateTime.Now.Ticks.ToString();
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
                         where c.ID != null && c.ID.Equals(pid)
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
                          where c.ID.Equals(id)
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