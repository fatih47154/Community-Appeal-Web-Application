﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Community_Appeal_Web_Application.App_Classes
{
    public class _SecurityFilter: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            string actionName = filterContext.ActionDescriptor.ActionName;
            //if (HttpContext.Current.Session["Kullanici"] == null && controllerName != "Kullanici" && actionName != "Login")
            //{
            //    filterContext.Result = new RedirectResult("/Kullanici/Login");
            //}
            //if (HttpContext.Current.Session["Admin"] == null && controllerName == "Home")
            //{
            //    filterContext.Result = new RedirectResult("/Admin/Login");
            //}
            //if (HttpContext.Current.Session["Admin"] == null && controllerName == "Admin" && actionName != "Login")
            //{
            //    filterContext.Result = new RedirectResult("/Admin/Login");
            //}
            base.OnActionExecuting(filterContext);
        }
    }
}