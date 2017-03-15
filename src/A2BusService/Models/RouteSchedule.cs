using System;
using System.Collections.Generic;

namespace CBBusService.Models
{
    public partial class RouteSchedule
    {
        public RouteSchedule()
        {
            Trip = new HashSet<Trip>();
        }

        public int RouteScheduleId { get; set; }
        public string BusRouteCode { get; set; }
        public TimeSpan StartTime { get; set; }
        public bool IsWeekDay { get; set; }
        public string Comments { get; set; }

        public virtual ICollection<Trip> Trip { get; set; }
        public virtual BusRoute BusRouteCodeNavigation { get; set; }
    }
}
