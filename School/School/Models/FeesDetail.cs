using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace School.Models
{
    public class FeesDetail
    {
        [Key]
        public int FeesId { get; set; }

        public int FeesPaid { get; set; }

        public int StudentId { get; set; }

        public int StdId { get; set; }
    }
}
