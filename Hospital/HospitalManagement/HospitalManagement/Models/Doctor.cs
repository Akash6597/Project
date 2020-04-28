using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Doctor
    {
      public int DoctorId { get; set; }

        public string DoctorName { get; set; }

        public string DoctorMobileNo { get; set; }
        
        public string DoctorEmail { get; set; }

        public string DoctorAddress { get; set; }

        public int DepartmentId { get; set; }
    }
}
