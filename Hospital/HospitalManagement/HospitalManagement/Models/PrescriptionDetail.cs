using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class PrescriptionDetail
    {
        public int PrescriptionDetailId { get; set; }

        public int MedicinId { get; set; }

        public int PrescriptionId { get; set; }

        public string TimeToTake { get; set; }
    }
}
