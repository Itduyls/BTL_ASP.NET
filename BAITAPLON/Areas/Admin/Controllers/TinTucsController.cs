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
    public class TinTucsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/TinTucs
        public ActionResult Index()
        {
            var tinTucs = db.TinTucs.Include(t => t.LoaiTinTuc).Include(t => t.TacGia);
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            ViewBag.tintuc = "Tất cả tin tức";
            ViewBag.sobaiviet = tinTucs.ToList().Count();
            ViewData["stt"] = 1;
            return View(tinTucs.ToList());
        }

        // GET: Admin/TinTucs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // GET: Admin/TinTucs/Create
        public ActionResult Create()
        {
            ViewBag.Id_LoaiTinTuc = new SelectList(db.LoaiTinTucs, "Id_LoaiTinTuc", "Ten_LoaiTinTuc");
            ViewBag.Id_Tac_Gia = new SelectList(db.TacGias, "Id_Tac_Gia", "Ten_Tac_Gia");
            return View();
        }

        // POST: Admin/TinTucs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_TinTuc,Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Ngay_Cap_Nhat,Trang_Thai,Id_Tac_Gia")] TinTuc tinTuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        TempData["file"] = FileName;
                        string UploadPath = Server.MapPath("~/Areas/Admin/Data/img/" + FileName);
                        f.SaveAs(UploadPath);
                        tinTuc.img = FileName;
                    }
                    tinTuc.Ngay_Dang = DateTime.Now;

                    db.TinTucs.Add(tinTuc);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.Id_LoaiTinTuc = new SelectList(db.LoaiTinTucs, "Id_LoaiTinTuc", "Ten_LoaiTinTuc", tinTuc.Id_LoaiTinTuc);
                ViewBag.Id_Tac_Gia = new SelectList(db.TacGias, "Id_Tac_Gia", "Ten_Tac_Gia", tinTuc.Id_Tac_Gia);
                return View(tinTuc);
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
               
                return View(tinTuc);
            }
        }

        // GET: Admin/TinTucs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_LoaiTinTuc = new SelectList(db.LoaiTinTucs, "Id_LoaiTinTuc", "Ten_LoaiTinTuc", tinTuc.Id_LoaiTinTuc);
            ViewBag.Id_Tac_Gia = new SelectList(db.TacGias, "Id_Tac_Gia", "Ten_Tac_Gia", tinTuc.Id_Tac_Gia);
            return View(tinTuc);
        }

        // POST: Admin/TinTucs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_TinTuc,Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Ngay_Cap_Nhat,Trang_Thai,Id_Tac_Gia")] TinTuc tinTuc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tinTuc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_LoaiTinTuc = new SelectList(db.LoaiTinTucs, "Id_LoaiTinTuc", "Ten_LoaiTinTuc", tinTuc.Id_LoaiTinTuc);
            ViewBag.Id_Tac_Gia = new SelectList(db.TacGias, "Id_Tac_Gia", "Ten_Tac_Gia", tinTuc.Id_Tac_Gia);
            return View(tinTuc);
        }

        // GET: Admin/TinTucs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // POST: Admin/TinTucs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TinTuc tinTuc = db.TinTucs.Find(id);
            db.TinTucs.Remove(tinTuc);
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
        public ActionResult Thoisu()
        {
            List<TinTuc> li = new List<TinTuc>();
           
            var tinTucs = db.TinTucs.Include(t => t.LoaiTinTuc).Include(t => t.TacGia);
            foreach (var item in tinTucs.ToList())
            {
                if(item.Id_LoaiTinTuc==1)
                {
                    
                    li.Add(item);
                }
            }
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            ViewBag.tintuc = "Tin tức thời sự";
            ViewBag.sobaiviet = li.Count();
            return View("Index",li) ;
        }
        public ActionResult Giaoduc()
        {
            List<TinTuc> li = new List<TinTuc>();
            var tinTucs = db.TinTucs.Include(t => t.LoaiTinTuc).Include(t => t.TacGia);
            foreach (var item in tinTucs.ToList())
            {
                if (item.Id_LoaiTinTuc == 2)
                {
                    li.Add(item);
                }
            }
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            ViewBag.tintuc = "Tin tức giáo dục";
            ViewBag.sobaiviet = li.Count();
            return View("Index", li);
        }
        public ActionResult Doisong()
        {
            List<TinTuc> li = new List<TinTuc>();
            var tinTucs = db.TinTucs.Include(t => t.LoaiTinTuc).Include(t => t.TacGia);
            foreach (var item in tinTucs.ToList())
            {
                if (item.Id_LoaiTinTuc == 3)
                {
                    li.Add(item);
                }
            }
            if (TempData.ContainsKey("username"))
            {
                ViewBag.user = TempData["username"].ToString();

            }
            TempData.Keep("username");
            ViewBag.tintuc = "Tin tức đời sống";
            ViewBag.sobaiviet = li.Count();
            return View("Index", li);
        }
    }
}
