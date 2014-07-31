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
    public class SessionsController : ApiController
    {
        private MeetingBuzzerContext db = new MeetingBuzzerContext();

        [HttpGet]
        [ActionName("GetAllSessions")]
        public IEnumerable<Meeting> GetAllSessions()
        {
            List<Meeting> meetings = new List<Meeting>();
            foreach(Session session in db.Sessions)
            {
                Meeting meeting = new Meeting();
                meeting.MeetingId = session.Id;
                meeting.MeetingName = session.Name;
                meetings.Add(meeting);
            }
            return meetings;
        }

        [HttpGet]
        [ActionName("GetMeeting")]
        public IHttpActionResult GetSession(string id)
        {
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return NotFound();
            }

            // TODO: REfactor
            Meeting meeting = new Meeting();
            meeting.MeetingId = session.Id;
            meeting.MeetingName = session.Name;
            Device parentDevice = db.Devices.Find(session.parentDeviceId);
            meeting.ParentDevice = parentDevice;
            meeting.Devices = new List<Device>();
            foreach (SessionDeviceRelation sdr in db.SessionDeviceRelations.Where(x => (x.MeetingId == session.Id)))
            {
                Device device = db.Devices.Find(sdr.DeviceId);
                meeting.Devices.Add(device);
            }


            return Ok(meeting);
        }
            
        [HttpGet]
        [ActionName("CreateSession")]
        public IHttpActionResult CreateSession(string id, string deviceId)
        {
            // Create a meeting that we can manage.
            // TODO: Remove dupes, manage meetings that have expired
            Session session = new Session();
            session.Id = Convert.ToString(Guid.NewGuid());
            session.Name = id;

            Device device = db.Devices.Find(deviceId);
            if (device == null)
            {
                return NotFound();
            }

            session.parentDeviceId = deviceId;

            SessionDeviceRelation sdRelation = new SessionDeviceRelation();
            sdRelation.Id = Convert.ToString(Guid.NewGuid()); // TODO: Fix this
            sdRelation.MeetingId = session.Id;
            sdRelation.DeviceId = deviceId;
            db.SessionDeviceRelations.Add(sdRelation);

            db.Sessions.Add(session);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SessionExists(session.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok(session);
        }

        [HttpGet]
        [ActionName("JoinMeeting")]
        public IHttpActionResult JoinMeeting(string id, string deviceId)
        {
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return NotFound();
            }

            Device device = db.Devices.Find(deviceId);
            if (device == null)
            {
                return NotFound();
            }


            SessionDeviceRelation sdRelation = new SessionDeviceRelation();
            sdRelation.Id = Convert.ToString(Guid.NewGuid()); // TODO: Fix this
            sdRelation.MeetingId = session.Id;
            sdRelation.DeviceId = deviceId;
            db.SessionDeviceRelations.Add(sdRelation);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SessionExists(session.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok();
        }

        [HttpGet]
        [ActionName("SignalMeeting")]
        public IHttpActionResult Signal(string id, string deviceId)
        {
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return NotFound();
            }

            foreach (SessionDeviceRelation sdr in db.SessionDeviceRelations.Where(x => ((x.MeetingId == id) && (x.DeviceId != deviceId))))
            {
                Device device = db.Devices.Find(sdr.DeviceId);
                device.Signal = true;
            }

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SessionExists(session.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok();
        }

        [HttpGet]
        [ActionName("LeaveMeeting")]
        public IHttpActionResult LeaveMeeting(string id, string deviceId)
        {
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return NotFound();
            }

            foreach (var sdr in db.SessionDeviceRelations.Where(x => ((x.MeetingId == id) && (x.DeviceId == deviceId))))
            {
                db.SessionDeviceRelations.Remove(sdr);
            }

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SessionExists(session.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok();
        }

        [HttpGet]
        [ActionName("RemoveMeeting")]
        public IHttpActionResult RemoveMeeting(string id, string deviceId)
        {
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return NotFound();
            }

            if (session.parentDeviceId == deviceId)
            {
                db.Sessions.Remove(session);
                db.SaveChanges();
            }

            return Ok(session);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SessionExists(string id)
        {
            return db.Sessions.Count(e => e.Id == id) > 0;
        }
    }
}