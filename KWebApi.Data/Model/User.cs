using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace KWebApi.Data.Model
{
    public class AppUser : IdentityUser
    {
        public string Name { get; set; }

        public string Password { get; set; }
        public string Login { get; set; }
    }
}
