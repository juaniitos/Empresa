using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using static Factura.Models.Entidad;

namespace Factura.ViewModel
{
    public class ProductoViewModel
    {
        public List<Product> ListaProductos { get; set; }
    }
   
    public class CabeceraViewModel
    {
        public CabeceraViewModel() 
        { 
            Detalles = new List<Invoice_Detail>();
            ListaCabecera = new List<Invoice>();
        }
        
        
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

        [Required(ErrorMessage = "La fecha de vencimiento es obligatoria.")]
        [Display(Name = "Fecha de Vencimiento")]
        [DataType(DataType.Date)]
        //[DateRange(ErrorMessage = "La fecha de vencimiento debe estar entre el 1 de enero de 1753 y el 31 de diciembre de 9999.")]
        public DateTime Vencimiento { get; set; }

        public List<Invoice> ListaCabecera { get; set; }
        public List<Invoice_Detail> Detalles { get; set; } //Relación con tabla Detalle*/
        public List<DetalleViewModel> DetallesDetalle { get; set; }
    }

    public class DetalleViewModel
    {
        public int IdDetalle{ get; set; }
        public int IdCabecera { get; set; }
        public string CodigoProducto { get; set; }
        public string DescripcionProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal Total { get; set; }

        public List<Product> ListaProductos { get; set; } //Relación con tabla Producto
        public List<Invoice> ListaCabecera { get; set; }
  
    }
}