using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace School.Models
{
    public class ParentDetail
    {
        [Key]
        public int ParentId { get; set; }

        public string ParentName { get; set; }

        public string ParentEmail { get; set; }

        public long ParentMobileNumber { get; set; }

        public string ParentPassword { get; set; }

        public string ParentAddress { get; set; }
    }
}
