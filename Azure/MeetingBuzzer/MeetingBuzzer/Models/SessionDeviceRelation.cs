using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MeetingBuzzer.Models
{
    public class SessionDeviceRelation
    {
        [Key]
        public string Id { get; set; }
        
        public string DeviceId { get; set; }
        public string MeetingId { get; set; }
    }
}