using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class OrdenesProduccion
    {
        public int OrdenProduccionID { get; set; }
        public string DescripcionOrden { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
        public decimal CostoTotal { get; set; }
        public decimal MateriaPrima { get; set; }
        public int CuentaID { get; set; }
        public bool Activo { get; set; }
    }
}