using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BAITAPLON.Areas;

namespace BAITAPLON.Areas.Admin.Controllers
{
    public class TacGiasController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/TacGias
        public ActionResult Index()
        {
            try { 
            int dem = 0;
            foreach (var item in db.TacGias.ToList())
            {
                if(item.Chucvu=="Quản lý")
                {
                    dem++;
                }
            }
            TempData["dem"] = dem;
            ViewBag.tacgia = "Tác giả";
            return View(db.TacGias.ToList());
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return RedirectToAction("error", "home");
            }
        }

        // GET: Admin/TacGias/Details/5
        public ActionResult Details(int? id)
        {

         
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TacGia tacGia = db.TacGias.Find(id);
            if (tacGia == null)
            {
                return HttpNotFound();
            }
            return View(tacGia);
        }

        // GET: Admin/TacGias/Create
        public ActionResult Create()
        {
          
            return View();
        }

        // POST: Admin/TacGias/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Tac_Gia,Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork")] TacGia tacGia)
        {
            try { 
            if (ModelState.IsValid)
            {
                var f = Request.Files["Avatar"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    TempData["file"] = FileName;
                    string UploadPath = Server.MapPath("~/Areas/Admin/assets/img/" + FileName);
                    f.SaveAs(UploadPath);
                    tacGia.Avatar = FileName;

                }
               
                db.TacGias.Add(tacGia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tacGia);
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return RedirectToAction("error", "home");
            }
        }

        // GET: Admin/TacGias/Edit/5
        public ActionResult Edit(int? id)
        {
           
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TacGia tacGia = db.TacGias.Find(id);
            if (tacGia == null)
            {
                return HttpNotFound();
            }
            return View(tacGia);
        }

        // POST: Admin/TacGias/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Tac_Gia,Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork")] TacGia tacGia)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var f = Request.Files["Avatar"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/Areas/Admin/assets/img/" + FileName);
                        f.SaveAs(UploadPath);
                        tacGia.Avatar = FileName;
                    }
                    



                    db.Entry(tacGia).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
             
                return View(tacGia);
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return RedirectToAction("error", "home");
            }
        }

        // GET: Admin/TacGias/Delete/5
        public ActionResult Delete(int? id)
        {
           
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TacGia tacGia = db.TacGias.Find(id);
            if (tacGia == null)
            {
                return HttpNotFound();
            }
            return View(tacGia);
        }

        // POST: Admin/TacGias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TacGia tacGia = db.TacGias.Find(id);
            db.TacGias.Remove(tacGia);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult Login()
        {
        
            return View();
        }
        public ActionResult CheckLogin()
        {
            try
            {
                List<TacGia> li = new List<TacGia>();
                li = db.TacGias.ToList();
                string username = Request.Form["username"];
                string passwork = Request.Form["passwork"];
                foreach (var item in li)
                {
                    if (item.Username.ToString() == username && item.Passwork.ToString() == passwork)
                    {
                        TempData["username"] = item.Ten_Tac_Gia;
                        TempData["chucvu"] = item.Chucvu;
                        TempData["avatar"] = item.Avatar;
                        return RedirectToAction("Index", "TinTucs");
                    }
                }
                ViewBag.error = "Tài khoản hoặc mật khẩu không đúng";
                return View("Login");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return RedirectToAction("error", "home");
            }
        }
    }
}
