using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace School.Models
{
    public class StudentDetail
    {
        [Key]
        public int StudentId { get; set; }

        public int StudentRollNo { get; set; }

        public string StudentName { get; set; }

        public int ParentId{get;set;}

        public int StdId { get; set; }
    }
}
