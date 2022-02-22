using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BAITAPLON.Areas;
using PagedList;
namespace BAITAPLON.Controllers
{
    public class HomeUserController : Controller
    {
        // GET: HomeUser
        Model1 db = new Model1();
        // GET: HomeUser
        public ActionResult Index(int? page)
        {
            var listTintuc = db.TinTucs.ToList();
            List<TinTuc> li = new List<TinTuc>();
            foreach (var item in listTintuc)
            {
                if(item.Trang_Thai=="Đã duyệt")
                {
                    li.Add(item);
                }
            }


            int pageNumber = (page ?? 1);
            int pageSize = 4;
            return View(li.OrderBy(x => x.Id_TinTuc).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult XemChiTiet(int id, int tg)
        {
            TinTuc sp = db.TinTucs.Find(id);
            
            var  tacgia = db.TacGias.Where(x=>x.Id_Tac_Gia.Equals(tg)).FirstOrDefault();
            ViewBag.sp = tacgia;

       
            return View(sp);
        }
        public ActionResult Menu()
        {

            var listDanhMuc = db.LoaiTinTucs.ToList();
            return PartialView(listDanhMuc);
            
        }
        
    }
}