using System;
using System.Collections.Generic;

namespace CBBusService.Models
{
    public partial class TripStop
    {
        public int TripStopId { get; set; }
        public int TripId { get; set; }
        public int BusStopNumber { get; set; }
        public TimeSpan TripStopTime { get; set; }
        public string Comments { get; set; }

        public virtual BusStop BusStopNumberNavigation { get; set; }
        public virtual Trip Trip { get; set; }
    }
}
