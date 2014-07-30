using MeetingBuzzer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MeetingBuzzer.Controllers
{
    public class DevicesController : ApiController
    {
        public static List<Device> devices = new List<Device>();

        [HttpGet]
        [ActionName("RegisterDevice")]
        public Device RegisterDevice(string name, string deviceOwner, string deviceInfo)
        {
            Device device = new Device();
            device.Name = name;
            device.deviceInfo = deviceInfo;
            device.deviceOwner = deviceOwner;
            device.Id = Convert.ToString(Guid.NewGuid());
            devices.Add(device);

            return device;
        }

        [HttpGet]
        [ActionName("GetDevice")]
        public IHttpActionResult GetDevice(string id)
        {
            Device device = GetDeviceFromId(id);
            if (device == null)
            {
                return NotFound();
            }

            return Ok(device);
        }

        [HttpGet]
        [ActionName("IsSignaled")]
        public IHttpActionResult IsSignaled(string id)
        {
            Device device = GetDeviceFromId(id);
            if (device == null)
            {
                return NotFound();
            }

            return Ok(device.isSignaled());
            
        }

        [HttpGet]
        [ActionName("RemoveDevice")]
        public IHttpActionResult RemoveDevice(string id)
        {
            int count = devices.RemoveAll(d => d.Id == id);
            if (count == 0)
            {
                return NotFound();
            }

            return Ok(count);
        }

        [NonAction]
        public Device GetDeviceFromId(string id)
        {
            return devices.Find(d => d.Id == id);
        }

    }
}
