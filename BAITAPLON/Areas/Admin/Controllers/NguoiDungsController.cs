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
    public class NguoiDungsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/NguoiDungs
        public ActionResult Index()
        {
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            if (TempData.ContainsKey("chucvu"))
            {
                ViewBag.chucvu = TempData["chucvu"].ToString();

            }
            TempData.Keep("chucvu");
            if (TempData.ContainsKey("avatar"))
            {
                ViewBag.avatar = TempData["avatar"].ToString();

            }
            TempData.Keep("avatar");
            ViewBag.nguoidung = "Người dùng";
            return View(db.NguoiDungs.ToList());
        }

        // GET: Admin/NguoiDungs/Details/5
        public ActionResult Details(int? id)
        {
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            if (TempData.ContainsKey("chucvu"))
            {
                ViewBag.chucvu = TempData["chucvu"].ToString();

            }
            TempData.Keep("chucvu");
            if (TempData.ContainsKey("avatar"))
            {
                ViewBag.avatar = TempData["avatar"].ToString();

            }
            TempData.Keep("avatar");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Create
        public ActionResult Create()
        {
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            if (TempData.ContainsKey("chucvu"))
            {
                ViewBag.chucvu = TempData["chucvu"].ToString();

            }
            TempData.Keep("chucvu");
            if (TempData.ContainsKey("avatar"))
            {
                ViewBag.avatar = TempData["avatar"].ToString();

            }
            TempData.Keep("avatar");
            return View();
        }

        // POST: Admin/NguoiDungs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_NguoiDung,Ten_NguoiDung,Email,Avatar,Username,Passwork")] NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                var f = Request.Files["ImageFile"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    TempData["file"] = FileName;
                    string UploadPath = Server.MapPath("~/Areas/Admin/assets/img/" + FileName);
                    f.SaveAs(UploadPath);
                    nguoiDung.Avatar = FileName;

                }
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            if (TempData.ContainsKey("chucvu"))
            {
                ViewBag.chucvu = TempData["chucvu"].ToString();

            }
            TempData.Keep("chucvu");
            if (TempData.ContainsKey("avatar"))
            {
                ViewBag.avatar = TempData["avatar"].ToString();

            }
            TempData.Keep("avatar");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDung);
        }

        // POST: Admin/NguoiDungs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_NguoiDung,Ten_NguoiDung,Email,Avatar,Username,Passwork")] NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                var f = Request.Files["ImageFile"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    TempData["file"] = FileName;
                    string UploadPath = Server.MapPath("~/Areas/Admin/assets/img/" + FileName);
                    f.SaveAs(UploadPath);
                    nguoiDung.Avatar = FileName;

                }
                db.Entry(nguoiDung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            if (TempData.ContainsKey("chucvu"))
            {
                ViewBag.chucvu = TempData["chucvu"].ToString();

            }
            TempData.Keep("chucvu");
            if (TempData.ContainsKey("avatar"))
            {
                ViewBag.avatar = TempData["avatar"].ToString();

            }
            TempData.Keep("avatar");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDung);
        }

        // POST: Admin/NguoiDungs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            db.NguoiDungs.Remove(nguoiDung);
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
    }
}
