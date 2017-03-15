using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace CBClassLibrary

{/// <summary>
/// Defines the CB Validations class 
/// </summary>
    public class CBValidations: ValidationAttribute
    {
        /// <summary>
        /// Capitalizes the first letter of every word in a string
        /// </summary>
        /// <param name="text">the text to be capitalized</param>
        /// <returns>the text after it is capitalized</returns>
        public static string CapitalizeAll(string text)
        {
            //string word = "";  
            if (text == null || text == "")
            {
                return text;
            }
            else
            {
                
                text = text.Trim();
                text = text.ToLower();
                text = Regex.Replace(text, @"(\b[a-z](?!\s))", m => m.Value.ToUpper(),RegexOptions.IgnoreCase);
                return text;
            }
            
        }
        /// <summary>
        /// Converts Postal Code to all caps with space
        /// </summary>
        /// <param name="text">postal code to be modified</param>
        /// <returns>modified postal code</returns>
        public static string PostalCode(string text)
        {
            if (text == null || text =="")
            {
                return text;
            }
            else
            {
                text = text.Trim();
                text = text.ToUpper();
                if (text.Length == 6)
                {
                    text = text.Insert(3, " ");
                    return text;
                }
                return text;
            }
        }
        /// <summary>
        /// converts a phone number to the format 555-555-5555
        /// </summary>
        /// <param name="text">unaltered phone number</param>
        /// <returns>altered phone number</returns>
        public static string PhoneNumber(string text)
        {
            if (text == null || text == "")
            {
                return text;
            }
            else
            {
                text = text.Trim();
                text = Regex.Replace(text, @"[\D]", "");
                text = text.Insert(3, "-").Insert(7, "-");
                
                return text;
            }
        }
    }
}
