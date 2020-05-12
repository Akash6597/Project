using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class vPrescription
    {
        [Key]
        public int PrescriptionId { get; set; }

        public int PrescriptionDetailId { get; set; }

        public string MedicinName { get; set; }

        public int VisitId { get; set; }

        public string DoctorName { get; set; }

        public string PatientName { get; set; }
    }
}
