using System;
using System.Collections.Generic;

namespace CBBusService.Models
{
    public partial class Trip
    {
        public Trip()
        {
            TripStop = new HashSet<TripStop>();
        }

        public int TripId { get; set; }
        public int RouteScheduleId { get; set; }
        public DateTime TripDate { get; set; }
        public int DriverId { get; set; }
        public int BusId { get; set; }
        public string Comments { get; set; }

        public virtual ICollection<TripStop> TripStop { get; set; }
        public virtual Bus Bus { get; set; }
        public virtual Driver Driver { get; set; }
        public virtual RouteSchedule RouteSchedule { get; set; }
    }
}
