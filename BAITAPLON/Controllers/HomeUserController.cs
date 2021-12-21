using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BAITAPLON.Controllers
{
    public class HomeUserController : Controller
    {
        // GET: HomeUser
        public ActionResult Index()
        {
            return Redirect("Admin");
        }
    }
}