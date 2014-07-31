using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using MeetingBuzzer.Models;

namespace MeetingBuzzer.Controllers
{
    public class DevicesController : ApiController
    {
        private MeetingBuzzerContext db = new MeetingBuzzerContext();

        [HttpGet]
        [ActionName("RegisterDevice")]
        public IHttpActionResult RegisterDevice(string name, string deviceOwner, string deviceInfo)
        {
            Device device = new Device();
            device.Name = name;
            device.DeviceInfo = deviceInfo;
            device.DeviceOwner = deviceOwner;
            device.Id = Convert.ToString(Guid.NewGuid());
            db.Devices.Add(device);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                throw;
            }


            return Ok(device);
        }

        [HttpGet]
        [ActionName("GetDevice")]
        public IHttpActionResult GetDevice(string id)
        {
            Device device = db.Devices.Find(id);
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
            Device device = db.Devices.Find(id);
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
            Device device = db.Devices.Find(id);
            if (device == null)
            {
                return NotFound();
            }

            db.Devices.Remove(device);
            db.SaveChanges();

            return Ok(device);

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DeviceExists(string id)
        {
            return db.Devices.Count(e => e.Id == id) > 0;
        }
    }
}