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
    public class TinTucsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/TinTucs
        public ActionResult Index(int? page)
        {
            var tinTucs = db.TinTucs.Include(t => t.LoaiTinTuc).Include(t => t.TacGia);
            ViewBag.nguoidung = db.NguoiDungs.ToList().Count;
            ViewBag.tacgia = db.TacGias.ToList().Count;
            ViewBag.tintuc = "Tất cả tin tức";
            ViewBag.sobaiviet = tinTucs.ToList().Count();
            ViewData["stt"] = 1;
            int pageNumber = (page ?? 1);
            int pageSize = 3;

            var tinTucs1 = db.TinTucs.ToList();

            //Bai viet
            var baiviet = tinTucs1.OrderBy(x => x.Ngay_Dang).ToList();
            var ngayDang = tinTucs1.Select(x => x.Ngay_Dang).Distinct().ToList();
            List < String > lingaydang= new List<String>();
            for(int i = 0; i < ngayDang.Count; i++)
            {
                lingaydang.Add(ngayDang[i].Day + "/" + ngayDang[i].Month +"/"+ngayDang[i].Year);

            }
            List<int> liDate = new List<int>(5);

            foreach (var item in ngayDang)
            {
                liDate.Add(tinTucs1.Count(x => x.Ngay_Dang == item));
            }
            var rep = liDate;
            ViewBag.ngaydang = lingaydang;
            ViewBag.sobai = liDate.ToList();
 
            return View(tinTucs.OrderBy(x=>x.Id_TinTuc).ToPagedList(pageNumber,pageSize));
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
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id_TinTuc,Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Ngay_Cap_Nhat,Trang_Thai,Id_Tac_Gia")] TinTuc tinTuc)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    var f = Request.Files["img"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        TempData["file"] = FileName;
                        string UploadPath = Server.MapPath("~/Areas/Admin/Data/img/" + FileName);
                        f.SaveAs(UploadPath);
                        tinTuc.img = FileName;
                    }
                   
                    tinTuc.Ngay_Dang = DateTime.Now;
                    tinTuc.Trang_Thai = "Chưa duyệt";
                    var tenTacGia = "";
                    int idTG=0;
                    if (TempData.ContainsKey("TenTacGia"))
                    {
                         tenTacGia = TempData["TenTacGia"].ToString();
                    }
                    foreach (var item in db.TacGias)
                    {
                        if (item.Ten_Tac_Gia == tenTacGia)
                        {
                            idTG = item.Id_Tac_Gia;
                            break;
                        }
                       
                    }
                    tinTuc.Id_Tac_Gia = idTG;
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
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id_TinTuc,Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Ngay_Cap_Nhat,Trang_Thai,Id_Tac_Gia")] TinTuc tinTuc)
        {
            if (ModelState.IsValid)
            {
                var f = Request.Files["img"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    TempData["file"] = FileName;
                    string UploadPath = Server.MapPath("~/Areas/Admin/Data/img/" + FileName);
                    f.SaveAs(UploadPath);
                    tinTuc.img = FileName;
                  
                }
                tinTuc.Ngay_Cap_Nhat = DateTime.Now;
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
        public ActionResult Thoisu(int? page)
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
           
            ViewBag.tintuc = "Tin tức thời sự";
            ViewBag.sobaiviet = li.Count();

            int pageNumber = (page ?? 1);
            int pageSize = 3;
            return View(li.OrderBy(x => x.Id_TinTuc).ToPagedList(pageNumber, pageSize)) ;
        }
        public ActionResult Giaoduc(int? page)
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
           
            ViewBag.tintuc = "Tin tức giáo dục";
            ViewBag.sobaiviet = li.Count();

            int pageNumber = (page ?? 1);
            int pageSize = 3;
            return View("Thoisu", li.OrderBy(x => x.Id_TinTuc).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Doisong(int? page)
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
           
            ViewBag.tintuc = "Tin tức đời sống";
            ViewBag.sobaiviet = li.Count();

            int pageNumber = (page ?? 1);
            int pageSize = 3;
            return View("Thoisu", li.OrderBy(x => x.Id_TinTuc).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Search()
        {
            List<TinTuc> li = new List<TinTuc>();
            var key = Request.Form["search"].ToString();
            var tinTucs = db.TinTucs.Include(t => t.LoaiTinTuc).Include(t => t.TacGia);
            foreach (var item in tinTucs.ToList())
            {
                if (item.Tieu_De.Contains(key))
                {
                    li.Add(item);
                }
            }
            return View("Thoisu", li);
        }
       
    }
}
