using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class RegistroVentas
    {
        public int VentaID { get; set; }
        public string Descripcion { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaVenta { get; set; }
        public string Categoria { get; set; }
        public string ReferenciaExterna { get; set; }
        public int CuentaID { get; set; }
        public bool Activo { get; set; }
    }
}
