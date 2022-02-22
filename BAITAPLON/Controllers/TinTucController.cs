using BAITAPLON.Areas;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BAITAPLON.Controllers
{
    public class TinTucController : Controller
    {
        Model1 db = new Model1();
        // GET: TinTuc
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult MenuTinTuc(int Id_LoaiTinTuc, int? page)
        {

            var list = db.TinTucs.Where(s => s.Id_LoaiTinTuc == Id_LoaiTinTuc).Select(s => s).ToList();

            var madm = Id_LoaiTinTuc;
            List<LoaiTinTuc> s1 = new List<LoaiTinTuc>();
            s1 = db.LoaiTinTucs.Where(h => h.Id_LoaiTinTuc == madm).ToList();
            ViewBag.ma = s1[0].Id_LoaiTinTuc;
            List<TinTuc> li = new List<TinTuc>();
            foreach (var item in list)
            {
                if (item.Trang_Thai == "Đã duyệt")
                {
                    li.Add(item);
                }
            }
            int pageSize = 4;
            int pageNumber = (page ?? 1);

            return View(li.ToPagedList(pageNumber, pageSize));

        }
    }
}