using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Visit
    {
       public int VisitId { get; set; }

           public int DoctorId { get; set; }

        public int PatientId { get; set; }

        public int AssistantId { get; set; }
    }
}
