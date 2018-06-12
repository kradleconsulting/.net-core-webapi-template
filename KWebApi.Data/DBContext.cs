using KWebApi.Data.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;


namespace KWebApi.Data
{
    public class DBContext : IdentityDbContext
    {
        public DBContext(DbContextOptions<DBContext> options)
            : base(options)
        {
        }

        public DbSet<Project> Projects { get; set; }
        public DbSet<Event> Events { get; set; }

        
        public DbSet<FuncBlock> FuncBlocks { get; set; }
        public DbSet<Pricelist> Pricelists { get; set; }           

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseNpgsql(@"Server=localhost;Port=5432;Database=kradle-api;User Id=test;Password=test");            
            base.OnConfiguring(optionsBuilder);
        }


    }
}
