using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CBBusService;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CBBusService.Models;
namespace CBBusService
{/// <summary>
/// defines the BusServiceContext
/// </summary>
    public class BusServiceContext_Singleton
    {
        private static BusServiceContext context;
        private static object sysLock = new object();
        /// <summary>
        /// Sets/Gets the current context
        /// </summary>
        /// <returns>current context</returns>
        public static BusServiceContext Context()
        {
            if (context == null)
            {
                lock(sysLock)
                {
                    if (context == null)
                    {
                        var optionsBuilder = new DbContextOptionsBuilder<BusServiceContext>();
                        optionsBuilder.UseSqlServer(@"Server=.\sqlexpress;database=BusService;trusted_connection=true");
                        context = new BusServiceContext(optionsBuilder.Options);
                    }
                }
            }
            return context;
        }
    }
}
