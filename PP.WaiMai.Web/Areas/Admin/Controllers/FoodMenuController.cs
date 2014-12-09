﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PP.WaiMai.WebHelper;
using PagedList;
using PP.WaiMai.Model;

namespace PP.WaiMai.Web.Areas.Admin.Controllers
{
    public class FoodMenuController : BaseController
    {
        //
        // GET: /Admin/FoodMenu/
        public ActionResult Index(int? page, string Keyword)
        {
            var model = BLLSession.IFoodMenuService.GetListBy(m => m.IsDel == false)
                .OrderByDescending(m => m.FoodMenuID).ToList();
            if (!string.IsNullOrEmpty(Keyword))
            {
                model = model.Where(m => m.MenuName.Contains(Keyword)).ToList();
            }
            return View(model.ToPagedList(page ?? 1, 15));
        }

        public ActionResult Add()
        {
            var modelList = BLLSession.IFoodMenuCategoryService.GetListBy(m => m.IsDel == false).OrderByDescending(m => m.FoodMenuCategoryID);
            ViewBag.FoodMenuCategoryList = modelList.Select(m => new SelectListItem()
            {
                Text = m.Restaurant.RestaurantName + "→" + m.CName,
                Value = m.FoodMenuCategoryID.ToString()
            }).ToList();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(FoodMenu model)
        {
            if (ModelState.IsValid)
            {
                model.CreateDate = DateTime.Now;
                model.IsDel = false;
                model.Version = 1;
                var modelList = BLLSession.IFoodMenuService.Add(model);
                return JsonMsgOk("增加菜单成功", "/Admin/FoodMenu");
            }
            // 如果我们进行到这一步时某个地方出错，则重新显示表单
            return JsonMsgNoOk();
        }


        public ActionResult Edit(int id)
        {
            var model = BLLSession.IFoodMenuService.GetModel(m => m.FoodMenuID == id);
            var modelList = BLLSession.IFoodMenuCategoryService.GetListBy(m => m.IsDel == false).OrderByDescending(m => m.FoodMenuCategoryID);
            ViewBag.FoodMenuCategoryDDList = modelList.Select(m => new SelectListItem()
            {
                Text = m.Restaurant.RestaurantName + "→" + m.CName,
                Value = m.FoodMenuCategoryID.ToString(),
                Selected = (model.FoodMenuCategoryID == m.FoodMenuCategoryID)
            }).ToList();

            return View(model);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(FoodMenu model)
        {
            if (ModelState.IsValid)
            {
                var modelList = BLLSession.IFoodMenuService.Modify(model, "FoodMenuCategoryID", "MenuName", "IsSale", "Price");
                return JsonMsgOk("编辑成功", "/Admin/FoodMenu");
            }
            // 如果我们进行到这一步时某个地方出错，则重新显示表单
            return JsonMsgNoOk();
        }
        [HttpPost]
        public ActionResult Del(int id)
        {
            //如果该菜单还没有订单过，则删除
            bool isExistOrder = BLLSession.IOrderService.GetListBy(m => m.FoodMenuID == id).Count() > 0;
            if (!isExistOrder)
            {
                BLLSession.IFoodMenuService.DeleteBy(m => m.FoodMenuID == id);
            }
            else
            {
                //更新为物理删除状态
                BLLSession.IFoodMenuService.Modify(new FoodMenu() { FoodMenuID = id, IsDel = true }, "IsDel");
            }

            return JsonMsgOk("删除成功", "/Admin/FoodMenu");
        }

    }
}