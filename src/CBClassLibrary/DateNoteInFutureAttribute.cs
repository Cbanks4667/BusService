using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace CBClassLibrary
{
    /// <summary>
    /// defines the datenotinfuture attribute
    /// </summary>
    public class DateNoteInFutureAttribute : ValidationAttribute
    {/// <summary>
    /// overides the isValid method
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
            string myDate = value.ToString();

            if (DateTime.Parse(myDate) > DateTime.Now)          
            {
                return new ValidationResult($"{validationContext.DisplayName} date cannot be in the future");
            }
            else
            {
                return ValidationResult.Success;
            }
            
        }
    }
}
