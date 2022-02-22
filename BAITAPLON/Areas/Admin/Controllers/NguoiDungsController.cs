using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BAITAPLON.Areas;
using PagedList;
namespace BAITAPLON.Areas.Admin.Controllers
{
    public class NguoiDungsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/NguoiDungs
        public ActionResult Index(int? page)
        {
            try { 
            ViewBag.nguoidung = "Người dùng";
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.NguoiDungs.OrderBy(x => x.Id_NguoiDung).ToPagedList(pageNumber, pageSize));
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return RedirectToAction("error", "home");
            }
        }

        // GET: Admin/NguoiDungs/Details/5
        public ActionResult Details(int? id)
        {
          
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
           
            return View();
        }

        // POST: Admin/NguoiDungs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_NguoiDung,Ten_NguoiDung,Email,Avatar,Username,Passwork")] NguoiDung nguoiDung)
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
                    nguoiDung.Avatar = FileName;

                }
               
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nguoiDung);
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return RedirectToAction("error", "home");
            }
        }

        // GET: Admin/NguoiDungs/Edit/5
        public ActionResult Edit(int? id)
        {
           
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
                    nguoiDung.Avatar = FileName;

                }
                db.Entry(nguoiDung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nguoiDung);
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;

                return RedirectToAction("error", "home");
            }
        }

        // GET: Admin/NguoiDungs/Delete/5
        public ActionResult Delete(int? id)
        {
           
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
