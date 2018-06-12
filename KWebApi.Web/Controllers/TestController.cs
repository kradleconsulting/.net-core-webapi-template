
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using KWebApi.Data.Model;


namespace KWebApi.Web.Controllers
{
    [Produces("application/json")]
    [Route("api/Test")]
    public class TestController : Controller
    {
        [HttpGet("/login")]

        public string Login()
        {
            IdentityUser u = new IdentityUser() { UserName = "Test", Email = "ttt@tt.yy" };

            return "Yep!";
        }

        [HttpPost("/register")]
        public string Register()
        {
            IdentityUser u = new IdentityUser() { UserName = "Test", Email = "ttt@tt.yy" };
            return "Yep2!";

        }


    }
}
