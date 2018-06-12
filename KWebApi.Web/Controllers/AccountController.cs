using System;
using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Configuration;

using System.ComponentModel.DataAnnotations;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Linq;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;

using Microsoft.IdentityModel.Tokens;

namespace KWebApi.Web.Controllers
{
    [EnableCors("CorsPolicy")]
    [Produces("application/json")]
    [Route("api/Account")]    
    public class AccountController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly IConfiguration _configuration;

        public AccountController(
            UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            IConfiguration configuration
            )
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [EnableCors("CorsPolicy")]
        [HttpPost("login")]
        public async Task<object> Login([FromBody] LoginDto model)
        {
            IdentityUser user = _userManager.Users.SingleOrDefault(r => r.Email == model.Email);

            var result = await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);

            if (result.Succeeded)
            {
                var appUser = _userManager.Users.SingleOrDefault(r => r.Email == model.Email);

                var cookieOptions = new CookieOptions()
                {
                    //Path = "/Account/Login",
                    //Expires = DateTimeOffset.UtcNow.AddYears(1),
                    //SameSite = SameSiteMode.None,
                    //Domain = "localhost",
                    //HttpOnly = false,
                    //Secure = false                    
                };

                Response.Cookies.Append("authtoken",
                                        await GenerateJwtToken(model.Email, user),
                                        cookieOptions);
                //await GenerateJwtToken(model.Email, user)
                return new JsonResult(new { Message = "ok" });
            }

            //throw new ApplicationException("INVALID_LOGIN_ATTEMPT");
            // TODO: implement errorhandling middleware, concerning 500s and nginx route errors as well

            string msg = "unauthorized";

            if (result.IsLockedOut) { msg = "locked out"; }
            if (result.IsNotAllowed) { msg = "not allowed"; }
            if (result.RequiresTwoFactor) { msg = "requires two factor"; }

            return new JsonResult(new { Message = msg });
        }

        [EnableCors("CorsPolicy")]
        [HttpPost("register")]
        public async Task<object> Register([FromBody] RegisterDto model)
        {
            var user = new IdentityUser
            {
                UserName = model.Email,
                Email = model.Email
            };

            var result = await _userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);

                Response.Cookies.Append("authtoken",
                                        await GenerateJwtToken(model.Email, user),
                                        new CookieOptions() { HttpOnly = true });
                //await GenerateJwtToken(model.Email, user)
                return new JsonResult(new { Message = "ok" });
            }

            // TODO: implement errorhandling middleware, concerning 500s and nginx route errors as well
            return new JsonResult(new { Message = result.Errors.FirstOrDefault().Description });

            //throw new ApplicationException("UNKNOWN_ERROR");
        }

        [EnableCors("CorsPolicy")]
        [HttpPost("GetUserByEmail")]
        public object GetUser([FromBody] GetUserDto model)
        {
            //var token = Request.Cookies.FirstOrDefault(e => e.Key == "authtoken").Value;

            //JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();

            //var parameters = new TokenValidationParameters
            //{
            //      //"JwtKey": "just some key with true random digit \"4\" that is hopefully random enough",
            //    ValidIssuer = "kradle.ru",                
            //    //IssuerSigningKeys = openIdConfig.SigningKeys
            //};

            //SecurityToken validatedToken;
            //var claimsPrincipal = handler.ValidateToken(token, parameters, out validatedToken);

            IdentityUser user = _userManager.Users.SingleOrDefault(r => r.Email == (model.Email ?? String.Empty));

            return new JsonResult(Json(user));
        }

        [EnableCors("CorsPolicy")]
        [HttpPost("GetCurrentUser")]
        public object GetCurrentUser()
        {
            var token = Request.Cookies.FirstOrDefault(e => e.Key == "authtoken");

            ClaimsPrincipal claimsPrincipal = null;

            if (token.Value != null)
            {
                JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();

                var parameters = new TokenValidationParameters
                {
                    //"JwtKey": "just some key with true random digit \"4\" that is hopefully random enough",
                    ValidIssuer = "kradle.ru",
                    ValidateIssuerSigningKey = true,
                    ValidateAudience = false,
                    ValidateIssuer = false,
                    IssuerSigningKeys = new List<SecurityKey>()
                                        {
                                            new SymmetricSecurityKey(
                                                Encoding.ASCII.GetBytes(
                                                    "just some key with true random digit \"4\" that is hopefully random enough"
                                                    )
                                                )
                                        },
                    ValidateLifetime = true
                };

                SecurityToken validatedToken;
                claimsPrincipal = handler.ValidateToken(token.Value, parameters, out validatedToken);
            }
            IdentityUser user = null;

            if (claimsPrincipal != null)
            {
                user = _userManager.Users.SingleOrDefault(e => e.UserName == claimsPrincipal.Claims.FirstOrDefault(e2 => e2.Type == "sub").Value);
            };

            if (user != null)
            {
                return new JsonResult(Json(user));
            }
            else
            {
                string msg = "unauthorized";

                return new JsonResult(new { Message = msg });
            }
        }



        [Authorize]
        [HttpPost("test")]
        public object TestMethod()
        {        
            return new JsonResult(new { Message = "Test Passed!" });
        }

        private async Task<string> GenerateJwtToken(string email, IdentityUser user)
        {
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Sub, email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.NameIdentifier, user.Id)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtKey"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var expires = DateTime.Now.AddDays(Convert.ToDouble(_configuration["JwtExpireDays"]));

            var token = new JwtSecurityToken(
                _configuration["JwtIssuer"],
                _configuration["JwtIssuer"],
                claims,
                expires: expires,
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token).ToString();
        }

        public class LoginDto
        {
            [Required]
            public string Email { get; set; }

            [Required]
            public string Password { get; set; }

        }

        public class RegisterDto
        {
            [Required]
            public string Email { get; set; }

            [Required]
            [StringLength(100, ErrorMessage = "PASSWORD_MIN_LENGTH", MinimumLength = 6)]
            public string Password { get; set; }
        }

        public class GetUserDto
        {
            [Required]
            public string Email { get; set; }
        }

    }
}