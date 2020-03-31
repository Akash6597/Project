using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace School.Models
{
    public class StdDetail
    {
        [Key]
        public int StdId { get; set; }

        public string Std { get; set; }

        public int Fees { get; set; }
    }
}
