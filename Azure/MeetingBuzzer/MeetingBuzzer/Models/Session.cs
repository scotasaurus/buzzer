using MeetingBuzzer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MeetingBuzzer.Models
{
    public class Session
    {
        public Meeting meeting { get; set; }
        public Device parentDevice { get; set; }
        public List<Device> devices { get; set; }
 
    }
}