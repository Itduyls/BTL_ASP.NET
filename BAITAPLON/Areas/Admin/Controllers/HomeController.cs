using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BAITAPLON.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            if (TempData.ContainsKey("avatar"))
            {
                ViewBag.avatar = TempData["avatar"].ToString();

            }
            TempData.Keep("avatar");
            return View();
        }
        public ActionResult Tintuc()
        {
            return View();
        }
        public ActionResult Index_Layout()
        {
            return View();
        }
    }
}