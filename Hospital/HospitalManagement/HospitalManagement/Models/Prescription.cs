using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Prescription
    {
        public int PrescriptionId { get; set; }

        public DateTime Date { get; set; }

        public int VisitId{get;set;}

        //Custom Attribute
        public int MedicinId { get; set; }

        public string TimeToTake { get; set; }
        
        //public List<PrescriptionDetail> PrescriptionDetails { get; set; }
    }
}
