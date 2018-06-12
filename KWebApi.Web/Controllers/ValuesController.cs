using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.EntityFrameworkCore;

using KWebApi.Data;
using KWebApi.Data.Model;

using Newtonsoft.Json;

namespace KWebApi.Web.Controllers
{
    [Produces("application/json")]
    [Route("api/Values")]    
    public class ValuesController : Controller
    {
        private readonly DBContext _context;

        public ValuesController(DBContext context)
        {
            _context = context;
        }
        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            List<FuncBlock> blockList = new List<FuncBlock>();
            blockList = _context.FuncBlocks.ToList();

            //List<FuncBlock> blockList = JsonConvert.DeserializeObject<List<FuncBlock>>(System.IO.File.ReadAllText(@"db\seed" + Path.DirectorySeparatorChar + "funcblocks.json"));
            //[{"Id":0,"Name":"Admin","Password":"qwe123","Login":"Admin"}]
            //return new string[] { "value1", "value2" };

            return blockList.Select(e => e.Name).ToArray();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public string Post()
        {
            return "value";
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
