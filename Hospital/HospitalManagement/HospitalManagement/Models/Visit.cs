using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Visit
    {

       public int VisitId { get; set; }
        
        public Doctor Doctors { get; set; }

        public int DoctorId { get; set; }


        public Patient Patients { get; set; }

        public int PatientId { get; set; }


        public Assistant Assistants { get; set; }

        public int AssistantId { get; set; }

        [NotMapped]
        public List<vVisit> vVisits { get; set; }



    }
}
