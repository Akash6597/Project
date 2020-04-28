using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Assistant
    {
        public int AssistantId { get; set; }

        public string AssistantName { get; set; }

        public string AssistantMobileNo { get; set; }

        public string AssistantEmail { get; set; }

        public string AssistantAddress { get; set; }

        public int DepartmentId { get; set; }
    }
}
