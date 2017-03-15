using System;
using System.Collections.Generic;

namespace CBBusService.Models
{
    public partial class BusStop
    {
        public BusStop()
        {
            RouteStop = new HashSet<RouteStop>();
            TripStop = new HashSet<TripStop>();
        }

        public int BusStopNumber { get; set; }
        public string Location { get; set; }
        public int LocationHash { get; set; }
        public bool GoingDowntown { get; set; }

        public virtual ICollection<RouteStop> RouteStop { get; set; }
        public virtual ICollection<TripStop> TripStop { get; set; }
    }
}
