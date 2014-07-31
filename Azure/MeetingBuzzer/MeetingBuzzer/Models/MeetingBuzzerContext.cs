using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MeetingBuzzer.Models
{
    public class MeetingBuzzerContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public MeetingBuzzerContext() : base("name=MeetingBuzzerContext")
        {
        }

        public System.Data.Entity.DbSet<MeetingBuzzer.Models.Device> Devices { get; set; }

        public System.Data.Entity.DbSet<MeetingBuzzer.Models.Session> Sessions { get; set; }

        public System.Data.Entity.DbSet<MeetingBuzzer.Models.SessionDeviceRelation> SessionDeviceRelations { get; set; }
    
    }
}
