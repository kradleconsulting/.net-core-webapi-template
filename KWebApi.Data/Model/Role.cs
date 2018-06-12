using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity;

namespace KWebApi.Data.Model
{
    public class AppRole : IdentityRole
    {
        public string Description { get; set; }

    }
}
