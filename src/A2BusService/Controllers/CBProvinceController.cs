using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CBBusService.Models;

namespace CBBusService.Controllers
{/// <summary>
/// defines the province controller
/// </summary>
    public class CBProvinceController : Controller
    {
        private readonly BusServiceContext _context;
        /// <summary>
        /// sets the context
        /// </summary>
        /// <param name="context"></param>
        public CBProvinceController(BusServiceContext context)
        {
            _context = context;    
        }

        // gets: CBProvince index table displays its view
        public async Task<IActionResult> Index()
        {
            var busServiceContext = _context.Province.Include(p => p.CountryCodeNavigation);
            return View(await busServiceContext.ToListAsync());
        }

        // gets: details page and displays view
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return View();
            }

            var province = await _context.Province.SingleOrDefaultAsync(m => m.ProvinceCode == id);
            if (province == null)
            {
                return View();
            }

            return View(province);
        }

        // gets: the create view
        public IActionResult Create()
        {
            ViewData["CountryCode"] = new SelectList(_context.Country, "CountryCode", "CountryCode");
            return View();
        }
        //Adds new record if successful
        // POST: CBProvince/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProvinceCode,Capital,CountryCode,Name,TaxCode,TaxRate")] Province province)
        {
            if (ModelState.IsValid)
            {
                _context.Add(province);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewData["CountryCode"] = new SelectList(_context.Country, "CountryCode", "CountryCode", province.CountryCode);
            return View(province);
        }

        // gets the edit view for a single record
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return View();
            }

            var province = await _context.Province.SingleOrDefaultAsync(m => m.ProvinceCode == id);
            if (province == null)
            {
                return View();
            }
            ViewData["CountryCode"] = new SelectList(_context.Country, "CountryCode", "CountryCode", province.CountryCode);
            return View(province);
        }
        //Edits the record if successful
        // POST: CBProvince/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("ProvinceCode,Capital,CountryCode,Name,TaxCode,TaxRate")] Province province)
        {
            if (id != province.ProvinceCode)
            {
                return View();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(province);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProvinceExists(province.ProvinceCode))
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
            ViewData["CountryCode"] = new SelectList(_context.Country, "CountryCode", "CountryCode", province.CountryCode);
            return View(province);
        }

        // gets the delete view for a single record
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return View();
            }

            var province = await _context.Province.SingleOrDefaultAsync(m => m.ProvinceCode == id);
            if (province == null)
            {
                return View();
            }

            return View(province);
        }

        // Deletes record if successful
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var province = await _context.Province.SingleOrDefaultAsync(m => m.ProvinceCode == id);
            _context.Province.Remove(province);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        /// <summary>
        /// determines if a province exitss
        /// </summary>
        /// <param name="id">id of record to check</param>
        /// <returns>context of the record</returns>
        private bool ProvinceExists(string id)
        {
            return _context.Province.Any(e => e.ProvinceCode == id);
        }
    }
}
