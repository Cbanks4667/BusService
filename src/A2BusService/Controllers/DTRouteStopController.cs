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
    public class DTRouteStopController : Controller
    {
        private readonly BusServiceContext _context;

        public DTRouteStopController(BusServiceContext context)
        {
            _context = context;    
        }

        // GET: DTRouteStop
        public async Task<IActionResult> Index(string busRouteCode, string routeName)
        {
            if (busRouteCode != null)
            {
                HttpContext.Session.SetString("busRouteCode", busRouteCode);
                HttpContext.Session.SetString("routeName", routeName);
            } else if (HttpContext.Session.GetString("busRouteCode") != null)
            {
                busRouteCode = HttpContext.Session.GetString("busRouteCode");
                routeName = HttpContext.Session.GetString("routeName");
            } else
            {
                TempData["message"] = "Please select a bus route to view its stops";
                return RedirectToAction(actionName:"Index", controllerName: "DTBusRoute");
            }
            var busServiceContext = _context.RouteStop
                    .Where(a=>a.BusRouteCode==busRouteCode)
                    .OrderBy(a=>a.OffsetMinutes)
                    .Include(r => r.BusRouteCodeNavigation)
                    .Include(r => r.BusStopNumberNavigation);
            return View(await busServiceContext.ToListAsync());
        }

        // GET: DTRouteStop/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var routeStop = await _context.RouteStop.SingleOrDefaultAsync(m => m.RouteStopId == id);
            if (routeStop == null)
            {
                return NotFound();
            }

            return View(routeStop);
        }

        // GET: DTRouteStop/Create
        public IActionResult Create()
        {
            
            ViewData["BusStopNumber"] = new SelectList(_context.BusStop.OrderBy(a=>a.Location + a.GoingDowntown), "BusStopNumber", "Location");
            return View();
        }

        // POST: DTRouteStop/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("RouteStopId,BusRouteCode,BusStopNumber,OffsetMinutes")] RouteStop routeStop)
        {
            if (ModelState.IsValid)
            {
                _context.Add(routeStop);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            Create();
            return View(routeStop);
        }

        // GET: DTRouteStop/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var routeStop = await _context.RouteStop.SingleOrDefaultAsync(m => m.RouteStopId == id);
            if (routeStop == null)
            {
                return NotFound();
            }
            ViewData["BusStopNumber"] = new SelectList(_context.BusStop.OrderBy(a=>a.Location + a.GoingDowntown), "BusStopNumber", "location", routeStop.BusStopNumber);
            return View(routeStop);
        }

        // POST: DTRouteStop/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("RouteStopId,BusRouteCode,BusStopNumber,OffsetMinutes")] RouteStop routeStop)
        {
            if (id != routeStop.RouteStopId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(routeStop);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RouteStopExists(routeStop.RouteStopId))
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
            await Edit(routeStop.RouteStopId);
            return View(routeStop);
        }

        // GET: DTRouteStop/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var routeStop = await _context.RouteStop.SingleOrDefaultAsync(m => m.RouteStopId == id);
            if (routeStop == null)
            {
                return NotFound();
            }

            return View(routeStop);
        }

        // POST: DTRouteStop/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var routeStop = await _context.RouteStop.SingleOrDefaultAsync(m => m.RouteStopId == id);
            _context.RouteStop.Remove(routeStop);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool RouteStopExists(int id)
        {
            return _context.RouteStop.Any(e => e.RouteStopId == id);
        }
    }
}
