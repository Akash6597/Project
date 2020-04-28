using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Medicine
    {
        [Key]
       public int MedicinId { get; set; }

       public string MedicinName { get; set; }

   public int MedicinePrice { get; set; }

public string TimeToTake { get; set; }

           public int DoctorId{ get; set; }
    }
}
