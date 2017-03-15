using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using CBClassLibrary;

namespace CBClassLibrary
{
   /// <summary>
   /// defines the postal code attribute
   /// </summary>
    public class PostalCodeValidationAttribute : ValidationAttribute
    {
        /// <summary>
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
                string myValue = value.ToString();
            Regex pattern = new Regex(@"[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ] ?\d[ABCEGHJKLMNPRSTVWXYZ]\d", RegexOptions.IgnoreCase);
            if (pattern.IsMatch(myValue))
            {
                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult($"{validationContext.DisplayName} must match Cdn pattern A3A 3A3");
            }

    }
    }
}
