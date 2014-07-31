using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MeetingBuzzer.Models
{
    public class Meeting
    {
        public string MeetingId { get; set; }
        public string MeetingName { get; set; }
        public Device ParentDevice { get; set; }
        public List<Device> Devices { get; set; }
    }
}