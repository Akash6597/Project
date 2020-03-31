using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace School.Models
{
    public class EnquiryDetail
    {
        [Key]
        public int EnquiryId { get; set; }

        public string EnquiryDetails { get; set; }
        
        public int ParentId { get; set; }
    }
}
