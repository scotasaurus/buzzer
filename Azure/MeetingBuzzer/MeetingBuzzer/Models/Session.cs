using MeetingBuzzer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MeetingBuzzer.Models
{
    public class Session
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string parentDeviceId { get; set; }

    }
}