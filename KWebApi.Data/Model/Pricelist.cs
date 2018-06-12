using System.ComponentModel.DataAnnotations;

namespace KWebApi.Data.Model
{
    public class Pricelist
    {
        [Key]
        public int Id { get; set; }        

        public int FuncId { get; set; }

        public decimal Amount { get; set; }



    }
}
