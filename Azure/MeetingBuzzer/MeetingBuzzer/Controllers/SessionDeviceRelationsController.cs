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
    public class SessionDeviceRelationsController : ApiController
    {
        private MeetingBuzzerContext db = new MeetingBuzzerContext();

        // GET: api/SessionDeviceRelations
        public IQueryable<SessionDeviceRelation> GetSessionDeviceRelations()
        {
            return db.SessionDeviceRelations;
        }

        // GET: api/SessionDeviceRelations/5
        [ResponseType(typeof(SessionDeviceRelation))]
        public IHttpActionResult GetSessionDeviceRelation(string id)
        {
            SessionDeviceRelation sessionDeviceRelation = db.SessionDeviceRelations.Find(id);
            if (sessionDeviceRelation == null)
            {
                return NotFound();
            }

            return Ok(sessionDeviceRelation);
        }

        // PUT: api/SessionDeviceRelations/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSessionDeviceRelation(string id, SessionDeviceRelation sessionDeviceRelation)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != sessionDeviceRelation.Id)
            {
                return BadRequest();
            }

            db.Entry(sessionDeviceRelation).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SessionDeviceRelationExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/SessionDeviceRelations
        [ResponseType(typeof(SessionDeviceRelation))]
        public IHttpActionResult PostSessionDeviceRelation(SessionDeviceRelation sessionDeviceRelation)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SessionDeviceRelations.Add(sessionDeviceRelation);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SessionDeviceRelationExists(sessionDeviceRelation.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = sessionDeviceRelation.Id }, sessionDeviceRelation);
        }

        // DELETE: api/SessionDeviceRelations/5
        [ResponseType(typeof(SessionDeviceRelation))]
        public IHttpActionResult DeleteSessionDeviceRelation(string id)
        {
            SessionDeviceRelation sessionDeviceRelation = db.SessionDeviceRelations.Find(id);
            if (sessionDeviceRelation == null)
            {
                return NotFound();
            }

            db.SessionDeviceRelations.Remove(sessionDeviceRelation);
            db.SaveChanges();

            return Ok(sessionDeviceRelation);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SessionDeviceRelationExists(string id)
        {
            return db.SessionDeviceRelations.Count(e => e.Id == id) > 0;
        }
    }
}