using System.ComponentModel.DataAnnotations;

namespace KWebApi.Data.Model
{
    public class Project
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
