using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CBBusService.Models;
using Microsoft.AspNetCore.Http;

namespace CBBusService.Controllers
{
    public class DTBusStopController : Controller
    {
        private readonly BusServiceContext _context;

        public DTBusStopController(BusServiceContext context)
        {
            _context = context;    
        }

        // GET: BusStop
        public async Task<IActionResult> Index(string stopsOrderBy)
        {
            if (stopsOrderBy != null) HttpContext.Session.SetString(nameof(stopsOrderBy), stopsOrderBy);

            if (HttpContext.Session.GetString(nameof(stopsOrderBy)) == "location")
                return View(await _context.BusStop.OrderBy(a=>a.Location).ToListAsync());
            else // default to stop number
                return View(await _context.BusStop.OrderBy(a => a.BusStopNumber).ToListAsync());           
        }

        // show all routes using the given stop, if any
        public async Task<IActionResult> RouteSelector(Int32 busStopNumber = 0)
        {
            if (busStopNumber == 0)
            {
                TempData["message"] = "the Route Selector needs a bus stop number to start";
                return RedirectToAction("Index");
            }

            var routes = _context.RouteStop/* ...and some other magic required here... */;
            // do remember my office hours are 11:00-3:00 Thursdays

            if (routes.Any())
            {
                ViewBag.busStopNumber = busStopNumber;
                return View(await routes.ToListAsync());
            }
            else
            {
                TempData["message"] = $"No routes use stop '{busStopNumber}'";
                return RedirectToAction("Index");
            }
        }

        // GET: BusStop/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var busStop = await _context.BusStop.SingleOrDefaultAsync(m => m.BusStopNumber == id);
            if (busStop == null)
            {
                return NotFound();
            }

            return View(busStop);
        }

        // GET: BusStop/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: BusStop/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("BusStopNumber,GoingDowntown,Location,LocationHash")] BusStop busStop)
        {
            if (ModelState.IsValid)
            {
                _context.Add(busStop);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(busStop);
        }

        // GET: BusStop/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var busStop = await _context.BusStop.SingleOrDefaultAsync(m => m.BusStopNumber == id);
            if (busStop == null)
            {
                return NotFound();
            }
            return View(busStop);
        }

        // POST: BusStop/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("BusStopNumber,GoingDowntown,Location,LocationHash")] BusStop busStop)
        {
            if (id != busStop.BusStopNumber)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(busStop);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BusStopExists(busStop.BusStopNumber))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index");
            }
            return View(busStop);
        }

        // GET: BusStop/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var busStop = await _context.BusStop.SingleOrDefaultAsync(m => m.BusStopNumber == id);
            if (busStop == null)
            {
                return NotFound();
            }

            return View(busStop);
        }

        // POST: BusStop/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var busStop = await _context.BusStop.SingleOrDefaultAsync(m => m.BusStopNumber == id);
            _context.BusStop.Remove(busStop);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool BusStopExists(int id)
        {
            return _context.BusStop.Any(e => e.BusStopNumber == id);
        }
    }
}
