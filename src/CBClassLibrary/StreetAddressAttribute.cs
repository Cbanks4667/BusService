using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace CBClassLibrary
{/// <summary>
/// defines the streetAddress attribute
/// </summary>
    public class StreetAddressAttribute : ValidationAttribute
    {/// <summary>
    /// overides the is valid method
    /// </summary>
    /// <param name="value">value to be evaluated</param>
    /// <param name="validationContext">current context</param>
    /// <returns>Success/Failure</returns>
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value == null || value.ToString() == "")
            {
                return ValidationResult.Success;
            }
            string address = value.ToString();
            Regex pattern = new Regex(@"\A\d*\s\w*\s\w*\.?\Z");
            if (pattern.IsMatch(address))
            {
                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult($"{validationContext.DisplayName} must contain a Building or Unit # a Street Name and a Street Type ex 222 Pinacle Drive");
            }


        }
    }
}
