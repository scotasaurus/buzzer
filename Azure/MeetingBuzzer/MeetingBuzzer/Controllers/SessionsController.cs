using MeetingBuzzer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MeetingBuzzer.Controllers
{
    public class SessionsController : ApiController
    {
        public static List<Session> sessions = new List<Session>();
        public static DevicesController devicesController = new DevicesController();

        [HttpGet]
        [ActionName("GetAllSessions")]
        public IEnumerable<Session> GetAllSessions()
        {
            List<Session> sessions = new List<Session>();


            return sessions;
        }

        [HttpGet]
        [ActionName("GetSession")]
        public IHttpActionResult GetSession(string id)
        {
            var session = sessions.FirstOrDefault((p) => p.meeting.Id == id);
            if (session == null)
            {
                return NotFound();
            }

            return Ok(session);
        }

        [HttpGet]
        [ActionName("CreateSession")]
        public IHttpActionResult CreateSession(string id, string deviceId)
        {
            // Create a meeting that we can manage.
            // TODO: Remove dupes, manage meetings that have expired
            Session session = new Session();

            Meeting meeting = new Meeting();
            meeting.Name = id;
            meeting.Id = Convert.ToString(Guid.NewGuid());

            session.meeting = meeting;

            Device device = devicesController.GetDeviceFromId(deviceId);
            if (device == null)
            {
                return NotFound();
            }

            session.parentDevice = device;
            session.devices.Add(device);
            sessions.Add(session);

            return Ok(meeting);
        }

        [HttpGet]
        [ActionName("JoinMeeting")]
        public IHttpActionResult JoinMeeting(string id, string deviceId)
        {
            Session session = sessions.Find((s) => s.meeting.Id == id);
            if (session == null)
            {
                return NotFound();
            }

            Device device = devicesController.GetDeviceFromId(deviceId);
            if (device == null)
            {
                return NotFound();
            }

            session.devices.Add(device);

            return Ok();
        }

        [HttpGet]
        [ActionName("Signal")]
        public IHttpActionResult Signal(string id, string deviceId)
        {
            Session session = sessions.Find((s) => s.meeting.Id == id);
            if (session == null)
            {
                return NotFound();
            }

            foreach (Device d in session.devices)
            {
                d.Signal();
            }

            return Ok();
        }

        [HttpGet]
        [ActionName("LeaveMeeting")]
        public IHttpActionResult LeaveMeeting(string id, string deviceId)
        {
            Session session = sessions.Find((s) => s.meeting.Id == id);
            if (session == null)
            {
                return NotFound();
            }

            int deleted = session.devices.RemoveAll((d) => d.Id == deviceId);
            if (deleted == 0)
            {
                return NotFound();
            }

            return Ok();
        }

        [HttpGet]
        [ActionName("RemoveMeeting")]
        public IHttpActionResult RemoveMeeting(string id, string deviceId)
        {
            Session session = sessions.Find((s) => s.meeting.Id == id);
            if (session == null)
            {
                return NotFound();
            }

            if (session.parentDevice.Id != deviceId)
            {
                return NotFound();
            }

            return Ok(sessions.Remove(session));
        }
    }
}
