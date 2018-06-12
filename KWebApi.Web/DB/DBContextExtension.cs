using System.Collections.Generic;
using System.Linq;
using KWebApi.Data;
using KWebApi.Data.Model;
using System.IO;
using Newtonsoft.Json;

namespace KWebApi.Web
{

    public static class DBContextExtension
    {
        public static void EnsureSeeded(this DBContext context)
        {
            //User
            //UserPayment
            //UserTestAnswer
            //UserTestQuestion
            //Project
            //Event
            //ICOLink
            //WPTemplate
            //LandingTemplate
            //PresentationTemplate
            //SCTemplate
            //FuncBlock
            //Pricelist
            //UserTest
            //UserResult

            //if (!context.Users.Any())
            //{
            //    var types = JsonConvert.DeserializeObject<List<User>>(File.ReadAllText(@"db\seed" + Path.DirectorySeparatorChar + "users.json"));
            //    context.AddRange(types);
            //    context.SaveChanges();
            //}

            if (!context.FuncBlocks.Any())
            {
                var stati = JsonConvert.DeserializeObject<List<FuncBlock>>(File.ReadAllText(@"db\seed" + Path.DirectorySeparatorChar + "funcblocks.json"));
                context.AddRange(stati);
                context.SaveChanges();

            }
        }
    }
}
