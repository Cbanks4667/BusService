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
/// defines the countries controller
/// </summary>
    public class CBCountriesController : Controller
    {
        private readonly BusServiceContext _context;
        /// <summary>
        /// sets the current context
        /// </summary>
        /// <param name="context"></param>
        public CBCountriesController(BusServiceContext context)
        {
            _context = context;    
        }

        // gets the countries index page and displays the view
        public async Task<IActionResult> Index()
        {
            return View(await _context.Country.ToListAsync());
        }

        //gets the details for a single record
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return View();
            }

            var country = await _context.Country.SingleOrDefaultAsync(m => m.CountryCode == id);
            if (country == null)
            {
               return View();
            }

            return View(country);
        }

        // gets the create page and displays the view
        public IActionResult Create()
        {
            return View();
        }

        // adds a new country record if successful
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CountryCode,Name,PhonePattern,PostalPattern")] Country country)
        {
            if (ModelState.IsValid)
            {
                _context.Add(country);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(country);
        }

        // gets the edit view for a single record
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return View();
            }

            var country = await _context.Country.SingleOrDefaultAsync(m => m.CountryCode == id);
            if (country == null)
            {
                return View();
            }
            return View(country);
        }
        //edits the record if succesful
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("CountryCode,Name,PhonePattern,PostalPattern")] Country country)
        {
            if (id != country.CountryCode)
            {
                return View();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(country);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CountryExists(country.CountryCode))
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
            return View(country);
        }

        // gets the delete view for  a single record
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return View();
            }

            var country = await _context.Country.SingleOrDefaultAsync(m => m.CountryCode == id);
            if (country == null)
            {
                return NotFound();
            }

            return View(country);
        }
        //deletes the record if succesful
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var country = await _context.Country.SingleOrDefaultAsync(m => m.CountryCode == id);
            _context.Country.Remove(country);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        //checks if country exists
        private bool CountryExists(string id)
        {
            return _context.Country.Any(e => e.CountryCode == id);
        }
    }
}
