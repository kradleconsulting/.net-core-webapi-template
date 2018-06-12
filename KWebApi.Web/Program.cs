using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace KWebApi.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false)
                .AddJsonFile("hosting.json", optional: true)
                .Build();

            var host = WebHostBuilder(args)
            .UseKestrel()
            .UseConfiguration(config)
            .UseContentRoot(Directory.GetCurrentDirectory())
            .UseStartup<Startup>()
            .Build();

            host.Run();
        }

        public static IWebHostBuilder WebHostBuilder(string[] args) => WebHost.CreateDefaultBuilder(args);
    }
}
