using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace MeetingBuzzer
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();
            config.Routes.MapHttpRoute(
                name: "TwoParameterApi",
                routeTemplate: "api/{controller}/{action}/{id}/{deviceId}",
                defaults: new
                {
                    id = RouteParameter.Optional,
                    deviceId = RouteParameter.Optional
                }
            );
            config.Routes.MapHttpRoute(
                name: "ThreeParameterApi",
                routeTemplate: "api/{controller}/{action}/{name}/{deviceOwner}/{deviceInfo}",
                defaults: new
                {
                    id = RouteParameter.Optional,
                    deviceOwner = RouteParameter.Optional,
                    deviceInfo = RouteParameter.Optional
                }
            );

            config.Routes.MapHttpRoute(
                name: "NamedApi",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            ); 

        }
    }
}
