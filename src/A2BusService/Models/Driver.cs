using System;
using System.Collections.Generic;

namespace CBBusService.Models
{
    public partial class Driver
    {
        public Driver()
        {
            Trip = new HashSet<Trip>();
        }

        public int DriverId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string HomePhone { get; set; }
        public string WorkPhone { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string ProvinceCode { get; set; }
        public DateTime? DateHired { get; set; }

        public virtual ICollection<Trip> Trip { get; set; }
        public virtual Province ProvinceCodeNavigation { get; set; }
    }
}
