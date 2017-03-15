using System;
using System.Collections.Generic;

namespace CBBusService.Models
{
    public partial class BusRoute
    {
        public BusRoute()
        {
            RouteSchedule = new HashSet<RouteSchedule>();
            RouteStop = new HashSet<RouteStop>();
        }

        public string BusRouteCode { get; set; }
        public string RouteName { get; set; }

        public virtual ICollection<RouteSchedule> RouteSchedule { get; set; }
        public virtual ICollection<RouteStop> RouteStop { get; set; }
    }
}
