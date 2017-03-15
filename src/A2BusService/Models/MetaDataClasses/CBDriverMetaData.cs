using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CBBusService.Models;
using CBBusService;
//using CBBusService;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;
using CBClassLibrary;

namespace CBBusService.Models
{
    /// <summary>
    /// defines the partial driver class
    /// </summary>
    [ModelMetadataType(typeof(CBDriverMetaData))]
    public partial class Driver : IValidatableObject
    {
        BusServiceContext _context = BusServiceContext_Singleton.Context();
       /// <summary>
       /// validates the driver object
       /// </summary>
       /// <param name="validationContext">the current context</param>
       /// <returns>returns series of ValidationResult objects</returns>
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            yield return ValidationResult.Success;
            if (FirstName == null || FirstName.ToString() == "")
            {
                yield return new ValidationResult("The First name cannot be empty or null ");
            }
            else
            {
                FirstName = CBValidations.CapitalizeAll(FirstName.ToString());
            }
            if (LastName == null || LastName.ToString() == "")
            {
                yield return new ValidationResult("The Last Name cannot be empty or null");
            }
            else
            {
                LastName = CBValidations.CapitalizeAll(LastName);
            }
            if (FullName == null || FullName.ToString() == "")
            {
                FullName = LastName + ", " + FirstName;
            }
            if (PostalCode != null || PostalCode.ToString() != "")
            {
                PostalCode = CBValidations.PostalCode(PostalCode);
            }
            else
            {
                yield return new ValidationResult("Postal Code cannot be empty or null");
            }
            if (HomePhone != null || HomePhone.ToString() != "")
            {
                HomePhone = CBValidations.PhoneNumber(HomePhone);
            }
            else
            {
                yield return new ValidationResult("Home Phone cannot be empty or null");
            }
            if (WorkPhone != null || WorkPhone.ToString() != "")
            {
                WorkPhone = CBValidations.PhoneNumber(WorkPhone);
            }
            if (ProvinceCode != null || ProvinceCode != "")
            {
                ProvinceCode = ProvinceCode.ToUpper();
            }
            else
            {
                yield return new ValidationResult("Province cannot be empty or null");
            }
            if (Street != null || Street.ToString() != "")
            {
                Street = CBValidations.CapitalizeAll(Street);
            }
            if (DateHired == null || DateHired.ToString() == "")
            {
                yield return new ValidationResult("Hire Date cannot be left blank or be null");
            }
        }
            
    }
    /// <summary>
    /// applies the annotations to the diver model
    /// 
    /// </summary>
    public class CBDriverMetaData
    {
        
        public int DriverId { get; set; }
        [Required]
        [Display(Name ="First Name")]
        public string FirstName { get; set; }
        [Required]
        [Display(Name ="Last Name")]
        public string LastName { get; set; }
        [Display(Name ="Full Name")]
        public string FullName { get; set; }
        [Display(Name = "Home Phone")]
        [Required]
        [PhoneNumber]
        public string HomePhone { get; set; }
        [Display(Name = "Work Phone")]
        [PhoneNumber]
        public string WorkPhone { get; set; }
        [Display(Name ="Street Address")]
        [StreetAddress]
        public string Street { get; set; }
        [Display(Name = "City")]
        public string City { get; set; }
        [Display(Name ="Postal Code")]
        [PostalCodeValidation]
        public string PostalCode { get; set; }
        [Display(Name ="Province")]
        [Remote("IsValidProvince","CBRemote")]
        public string ProvinceCode { get; set; }
        [Display(Name ="Hired")]
        [DateNoteInFuture]
        [Required]
        [DisplayFormat(ApplyFormatInEditMode = true,DataFormatString ="{0:dd/MMM/yyyy}")]
        public DateTime? DateHired { get; set; }
    }
}
