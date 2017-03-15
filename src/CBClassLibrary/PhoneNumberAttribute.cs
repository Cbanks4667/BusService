using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using System.Linq;
using System.Threading.Tasks;

namespace CBClassLibrary
{/// <summary>
/// defines the phoneNumber attribute
/// </summary>
    public class PhoneNumberAttribute : ValidationAttribute
    {/// <summary>
    /// overides the validationResult isValid method
    /// </summary>
    /// <param name="value">the object to be evaluated</param>
    /// <param name="validationContext">the current context</param>
    /// <returns>ValidationResult object</returns>
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value == null || value.ToString() == "")
            {
                return ValidationResult.Success;
            }
            string phoneNumber = value.ToString();
            Regex pattern = new Regex(@"\A\D*(\d{3})\D*(\d{3})\D*(\d{4})\D*\Z");         
            if (pattern.IsMatch(phoneNumber))
            {
                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult($"{validationContext.DisplayName} must contain a 10 digit phone number ex 555 555 5555");
            }


        }
    }
}
