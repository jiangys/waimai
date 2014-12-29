﻿using PP.WaiMai.WebHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace PP.WaiMai.Web.Areas.Admin.Controllers
{
    public class ReportController : BaseController
    {
        //
        // GET: /Admin/Report/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RepUser(int? page, string Keyword)
        {
            var model = BLLSession.IUserService.GetListBy(m => !m.IsDel).OrderBy(m => m.UserID).Skip(2).ToList();
            ViewBag.AllAmount = model.Sum(m => m.Amount);
            if (!string.IsNullOrEmpty(Keyword))
            {
                //model = model.Where(m => m.UserName.Contains(Keyword)).ToList();
            }
            return View(model.ToPagedList(page ?? 1, 15));
        }

        public ActionResult RepOrder(int? page, string Keyword)
        {
            var model = BLLSession.IOrderService.GetListBy(m => true).OrderByDescending(m => m.OrderID).ToList();
            if (!string.IsNullOrEmpty(Keyword))
            {
                model = model.Where(m => m.FoodMenu.MenuName.Contains(Keyword) || m.User.UserName.Contains(Keyword)).ToList();
            }
            return View(model.ToPagedList(page ?? 1, 15));
        }

        /// <summary>
        /// 消费报表
        /// </summary>
        /// <param name="page"></param>
        /// <param name="Keyword"></param>
        /// <returns></returns>
        public ActionResult RepExpendLog(int? page, string Keyword)
        {

            var model = BLLSession.IExpendLogService.GetListBy(m => true).OrderByDescending(m => m.ExpendLogID);
            if (!string.IsNullOrEmpty(Keyword))
            {
                //model = model.Where(m => m.UserID.Contains(Keyword) || m.User.UserName.Contains(Keyword)).ToList();
            }
            //剩余总金额
            ViewBag.RemainAmount = model.Sum(m => m.RechargeAmount) - model.Sum(m => m.ConsumeAmount);
            return View(model.ToPagedList(page ?? 1, 15));
        }
    }
}