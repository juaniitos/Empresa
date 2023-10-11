using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using static Factura.Models.Entidad;

namespace Factura.Models
{
    public class Entidad
    {
        public class Product
        {
            [Key]
            public string CodigoProducto { get; set; }
            public string DescripcionProducto { get; set; }
            public int Stock { get; set; }
            public decimal PrecioUnitario { get; set; }
            public DateTime FechaRegistro { get; set; } = DateTime.Now;

        }

        public class Invoice
        {
            [Key]
            public int IdCabecera{ get; set; }
            public string NombreCliente { get; set; }
            public string NombreEmpresa { get; set; }
            public string DireccionEmpresa { get; set; }
            public string TelEmpresa { get; set; }
            public string NombreClienteEnvio { get; set; }
            public string NombreEmpresaEnvio { get; set; }
            public string DireccionEmpresaEnvio { get; set; }
            public string TelEmpresaEnvio { get; set; }
            public string NombreVendedor { get; set; }
            public string OrdenCompra { get; set; }
            public string EnviarPor { get; set; }
            public string TerminosCondiciones { get; set; }
            public DateTime FechaRegistro { get; set; } = DateTime.Now;
            public DateTime Vencimiento {  get; set; }

        }

        public class Invoice_Detail
        {
            [Key]
            public int IdDetalle{ get; set; }
            public int IdCabecera { get; set; }
            public string CodigoProducto { get; set; }
            public string DescripcionProducto { get; set; }
            public int Cantidad { get; set; }
            public decimal PrecioUnitario { get; set; }
            public decimal Total { get; set; }
            public DateTime FechaRegistro { get; set; } = DateTime.Now;

            public virtual Invoice Invoice { get; set; }
            public virtual Product Product { get; set; }    
        }


    }
}