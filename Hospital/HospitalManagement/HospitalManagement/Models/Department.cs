using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Department
    {
        public int DepartmentId { get; set; }

        public string DepartmentName { get; set; }

        [NotMapped]
        public List<Doctor> Doctors { get; set; }

        public Department()
        {
            this.Doctors = new List<Doctor>();
        }
    }
}
