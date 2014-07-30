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
        public string deviceInfo { get; set; }
        public string deviceOwner { get; set; }
        public string stream { get; set; }
        public bool signal { get; set; }

        public Device()
        {
            signal = false;
        }

        public bool isSignaled()
        {
            bool isSignaled = signal;
            signal = false;

            return isSignaled;
        }

        public void Signal()
        {
            signal = true;
        }

    }
}