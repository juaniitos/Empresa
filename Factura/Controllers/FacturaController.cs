using Factura.Models;
using Factura.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using static Factura.Models.Entidad;

namespace Factura.Controllers
{
    public class FacturaController : Controller
    {
        ApplicationDbContext _context = new ApplicationDbContext();
       
        public ActionResult Cabecera()
        {
            var Cabecera = _context.Invoices.OrderByDescending(x => x.IdCabecera).FirstOrDefault();
            if (Cabecera != null)
            {
                var datosCabecera = new ViewModel.CabeceraViewModel
                {
                    IdCabecera = Cabecera.IdCabecera + 1,
                    FechaRegistro = DateTime.Now,
                    Detalles = new List<Invoice_Detail>(), 
                };

                datosCabecera.Detalles = new List<Invoice_Detail>();
                var productos = _context.Products.ToList();
                ViewBag.Productos = productos;

                var detalle = _context.Invoice_Details.OrderByDescending(x => x.IdCabecera).FirstOrDefault();
                ViewBag.Detalles = detalle;

                return View(datosCabecera);
            }
            else
            {
                var datosCabecera = new ViewModel.CabeceraViewModel
                {
                    IdCabecera = 1,
                    FechaRegistro = DateTime.Now,
                    Detalles = new List<Invoice_Detail>(),
                };
                var productos = _context.Products.ToList();
                ViewBag.Productos = productos;

                var detalle = _context.Invoice_Details.OrderByDescending(x => x.IdCabecera).FirstOrDefault();
                ViewBag.Detalles = detalle;
                return View(datosCabecera);
            }
        }

        
        [HttpGet]
        public JsonResult GetProduct(string idProducto)
        {
            var datosProducto = _context.Products.SingleOrDefault(x => x.CodigoProducto == idProducto);
            return Json(datosProducto, JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        public ActionResult Cabecera(ViewModel.CabeceraViewModel cabecera)
        {
            var productos =_context.Products.ToList();
            if (ModelState.IsValid)
            {
                var fechaString = Convert.ToDateTime(cabecera.Vencimiento).ToString("dd/MM/yyyy");
                
                if (DateTime.TryParse(fechaString, out var vencimiento) && vencimiento >= SqlDateTime.MinValue.Value && vencimiento <= SqlDateTime.MaxValue.Value)
                {
                    var cabeceraFactura = new Invoice
                    {
                        NombreCliente = cabecera.NombreCliente,
                        NombreEmpresa = cabecera.NombreEmpresa,
                        DireccionEmpresa = cabecera.DireccionEmpresa,
                        TelEmpresa = cabecera.TelEmpresa,
                        NombreClienteEnvio = cabecera.NombreClienteEnvio,
                        NombreEmpresaEnvio = cabecera.NombreEmpresaEnvio,
                        DireccionEmpresaEnvio = cabecera.DireccionEmpresaEnvio,
                        TelEmpresaEnvio = cabecera.TelEmpresaEnvio,
                        NombreVendedor = cabecera.NombreVendedor,
                        OrdenCompra = cabecera.OrdenCompra,
                        EnviarPor = cabecera.EnviarPor,
                        TerminosCondiciones = cabecera.TerminosCondiciones,
                        FechaRegistro = DateTime.UtcNow,
                        Vencimiento = cabecera.Vencimiento.Date,
                    };

                    _context.Invoices.Add(cabeceraFactura);
                    _context.SaveChanges();
                    int IdCabeceraFact = cabeceraFactura.IdCabecera;

                    foreach (var detalleViewModel in cabecera.Detalles)
                    {
                        var detalleFactura = new Invoice_Detail
                        {
                            //IdDetalle = detalleViewModel.IdDetalle,
                            CodigoProducto = detalleViewModel.CodigoProducto,
                            DescripcionProducto = detalleViewModel.DescripcionProducto,
                            Cantidad = detalleViewModel.Cantidad,
                            PrecioUnitario = detalleViewModel.PrecioUnitario,
                            Total = detalleViewModel.Total,

                            IdCabecera = IdCabeceraFact // Asignar la clave foránea a la cabecera
                        };

                        _context.Invoice_Details.Add(detalleFactura);
                    }
                    _context.SaveChanges();
                }

                ViewBag.Productos = productos;

                return RedirectToAction("Cabecera");
            }
            ViewBag.Productos = productos;
            return View(cabecera);
        }
    }
}
