using System;
using System.Collections.Generic;

namespace CBBusService.Models
{
    public partial class Bus
    {
        public Bus()
        {
            Trip = new HashSet<Trip>();
        }

        public int BusId { get; set; }
        public int BusNumber { get; set; }
        public string Status { get; set; }
        public string Comments { get; set; }

        public virtual ICollection<Trip> Trip { get; set; }
    }
}
