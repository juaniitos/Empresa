using System.Data.Entity;
using static Factura.Models.Entidad;

namespace Factura.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext() : base("MiConex") { }

        public DbSet<Product> Products { get; set; }
        public DbSet<Invoice> Invoices { get; set; }
        public DbSet<Invoice_Detail> Invoice_Details { get; set; }
    }
}