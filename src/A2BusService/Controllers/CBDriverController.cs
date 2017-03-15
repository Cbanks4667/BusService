using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CBBusService.Models;

namespace CBBusService.Controllers
{
    /// <summary>
    /// defines the CBDriverController
    /// </summary>
    public class CBDriverController : Controller
    {
        private readonly BusServiceContext _context;
        //Sets the context
        public CBDriverController(BusServiceContext context)
        {
            _context = context;    
        }

        // gets the drivers page and displays the view
        public async Task<IActionResult> Index()
        {
            var busServiceContext = _context.Driver.Include(d => d.ProvinceCodeNavigation).OrderBy(a=>a.FullName);
            return View(await busServiceContext.ToListAsync());
        }

        // gets the details page and displays the view
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return View();
            }

            var driver = await _context.Driver.SingleOrDefaultAsync(m => m.DriverId == id);
            if (driver == null)
            {
                return View();
            }

            return View(driver);
        }

        // gets the create page and displays the view
        public IActionResult Create()
        {
            ViewData["ProvinceCode"] = new SelectList(_context.Province, "ProvinceCode", "ProvinceCode");
            return View();
        }

        // adds a new record if successful
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("DriverId,City,DateHired,FirstName,FullName,HomePhone,LastName,PostalCode,ProvinceCode,Street,WorkPhone")] Driver driver)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    _context.Add(driver);
                    await _context.SaveChangesAsync();
                    TempData["message"] = string.Format("{0} added as a new driver record", driver.FullName);
                    return RedirectToAction("Index");
                }
               
            }
            catch (Exception ex)
            {

                ModelState.AddModelError("", ex.GetBaseException().ToString());
                ViewData["ProvinceCode"] = new SelectList(_context.Province, "ProvinceCode", "ProvinceCode", driver.ProvinceCode);
               
            }
            return View(driver);
        }

        // gets the edit view for a single record
        public async Task<IActionResult> Edit(int? id)
        {
            
            try
            {
                if (id == null)
                {
                    TempData["message"] = "no id selected";
                    return View();
                }

                var driver = await _context.Driver.SingleOrDefaultAsync(m => m.DriverId == id);
                ViewBag.Name = driver.FullName;
                if (driver == null)
                {
                    TempData["message"] = "no driver record found";
                    return View();
                }
                ViewData["ProvinceCode"] = new SelectList(_context.Province.OrderBy(a=>a.Name), "ProvinceCode", "ProvinceCode", driver.ProvinceCode);
                return View(driver);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.GetBaseException().ToString());
               
                return View();
            }
           
           
        }

        // edits the record if successful
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("DriverId,City,DateHired,FirstName,FullName,HomePhone,LastName,PostalCode,ProvinceCode,Street,WorkPhone")] Driver driver)
        {
            //driver.FullName = driver.LastName + ", " + driver.FirstName;
            try
            {
                if (id != driver.DriverId)
                {
                    TempData["message"] = "id does not equal driver id";
                    return View();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        TempData["message"] = string.Format("{0} record has been successfully edited", driver.FullName);
                        _context.Update(driver);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!DriverExists(driver.DriverId))
                        {
                            return View();
                        }
                        else
                        {
                            throw;
                        }
                    }
                    return RedirectToAction("Index");
                }
                ViewData["ProvinceCode"] = new SelectList(_context.Province, "ProvinceCode", "ProvinceCode", driver.ProvinceCode);
                return View(driver);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.GetBaseException().ToString());
                return View();
            }
        }

        // gets the delete view for a single record
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                TempData["message"] = "no id selected";
                return View();
            }

            var driver = await _context.Driver.SingleOrDefaultAsync(m => m.DriverId == id);
            if (driver == null)
            {
                TempData["message"] = "No driver record found";
                return View();
            }

            return View(driver);
        }

        // deletes the driver Record if succesful
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var driver = await _context.Driver.SingleOrDefaultAsync(m => m.DriverId == id);
            _context.Driver.Remove(driver);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        /// <summary>
        /// determines if the driver exits
        /// </summary>
        /// <param name="id">id for driver</param>
        /// <returns>context of driver</returns>
        private bool DriverExists(int id)
        {
            return _context.Driver.Any(e => e.DriverId == id);
        }
    }
}
