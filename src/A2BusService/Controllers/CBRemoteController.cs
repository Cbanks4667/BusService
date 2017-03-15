using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CBBusService.Models;
using System.Text.RegularExpressions;

namespace CBBusService.Controllers
{
    /// <summary>
    /// defines the CBremote controller
    /// </summary>
    public class CBRemoteController : Controller
    {
    
        BusServiceContext _context = BusServiceContext_Singleton.Context();
        /// <summary>
        /// Evaluates if province entered is valid
        /// </summary>
        /// <param name="provinceCode">province code to be evaluate</param>
        /// <returns>True/False</returns>
        public JsonResult IsValidProvince(string provinceCode)
        {
            try
            {
                var province = _context.Province.SingleOrDefault(a=>a.ProvinceCode == provinceCode);
                if (province == null)
                {
                    return Json($"Province Code '{provinceCode}' is not on file");
                }
                else
                {
                    Regex pattern = new Regex(@"\A[a-z]{2}\Z", RegexOptions.IgnoreCase);
                    if (!pattern.IsMatch(provinceCode))
                    {
                        return Json("Province Code must be 2 letters");
                    }                 
                }

            }
            catch (Exception ex)
            {
                return Json($"Error in Province Code: {ex.GetBaseException().Message}");
            }
            return Json(true);
        }
    }


}