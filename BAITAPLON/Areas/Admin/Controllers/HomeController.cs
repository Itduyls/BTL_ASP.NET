
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BAITAPLON.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Home
        public ActionResult Index()
        {
           

            return View();



        }
        public ActionResult Register()
        {
            return View();
        }
        // login


        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CheckLogin()
        {
            


                var username = Request.Form["username"];
                var passwork = Request.Form["passwork"];
                var data = db.TacGias.Where(s => s.Username.Equals(username) && s.Passwork.Equals(passwork)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["FullName"] = data.FirstOrDefault().Ten_Tac_Gia;
                    Session["ChucVu"] = data.FirstOrDefault().Chucvu;
                    Session["Avatar"] = data.FirstOrDefault().Avatar;
                    return RedirectToAction("Index","TinTucs");
                }
                else
                {
                TempData["error"] = "Sai tên tài khoản hoặc mật khẩu.";
                    return RedirectToAction("Login");
                }
            
           
           
        }


        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }

    }
}