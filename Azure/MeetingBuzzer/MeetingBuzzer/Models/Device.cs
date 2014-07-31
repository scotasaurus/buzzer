using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MeetingBuzzer.Models
{
    public class Device
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string DeviceInfo { get; set; }
        public string DeviceOwner { get; set; }
        public string Stream { get; set; }
        public bool Signal { get; set; }

        public Device()
        {
            Signal = false;
        }

        public bool isSignaled()
        {
            bool isSignaled = Signal;
            Signal = false;

            return isSignaled;
        }

    }
}