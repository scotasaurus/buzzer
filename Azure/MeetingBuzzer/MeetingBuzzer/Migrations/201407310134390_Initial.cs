namespace MeetingBuzzer.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Devices",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Name = c.String(),
                        DeviceInfo = c.String(),
                        DeviceOwner = c.String(),
                        Stream = c.String(),
                        Signal = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.SessionDeviceRelations",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        DeviceId = c.String(),
                        MeetingId = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Sessions",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Name = c.String(),
                        parentDeviceId = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Sessions");
            DropTable("dbo.SessionDeviceRelations");
            DropTable("dbo.Devices");
        }
    }
}
