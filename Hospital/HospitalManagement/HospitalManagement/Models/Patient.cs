using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Patient
    {
        public int PatientId { get; set; }

        public string PatientName { get; set; }

        public string PatientMobileNo { get; set; }

        public string PatientEmail { get; set; }

        public int PatientAge { get; set; }

        public string PatientAddress { get; set; }

        public DateTime DateAddmission { get; set; }

        public DateTime DateDischarge { get; set; }
    }
}
