using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class SistemaCostos
    {
        public int OrdenProduccionID { get; set; } // ID de la orden de producción
        public string DescripcionOrden { get; set; } // Descripción de la orden
        public decimal TotalCostos { get; set; } // Total de costos asociados
        public decimal TotalVentas { get; set; } // Total de ventas asociadas
        public decimal Rentabilidad { get; set; } // Rentabilidad (Ventas - Costos)
    }
}

