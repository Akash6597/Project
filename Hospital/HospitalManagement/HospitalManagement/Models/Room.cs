using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Room
    {
        public int RoomId { get; set; }

        public int RoomNo { get; set; }

        public string RoomType { get; set; }

        public int RoomPrice { get; set; }

        public bool OccupiedStatus { get; set; }
    }
}
