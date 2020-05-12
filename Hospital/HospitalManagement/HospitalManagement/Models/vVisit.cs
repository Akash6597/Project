using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class vVisit
    {
        [Key]
        public int VisitId { get; set; }

        public int DoctorId { get; set; }
        
        public string DoctorName { get; set; }

        public int PatientId { get; set; }

        public string PatientName { get; set; }

        public int AssistantId { get; set; }

        public string AssistantName { get; set; }
    }
}
