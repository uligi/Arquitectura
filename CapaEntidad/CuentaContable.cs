using System;

namespace CapaEntidad
{
    public class CuentaContable
    {
        public int CuentaID { get; set; }
        public string CodigoCuenta { get; set; }
        public string DescripcionCuenta { get; set; }
        public string Clase { get; set; }
        public string Grupo { get; set; }
        public string Rubro { get; set; }
        public string Subcuenta { get; set; }
        public int Nivel { get; set; }
        public string CodigoPadre { get; set; }
        public decimal SaldoInicial { get; set; }
        public DateTime FechaCreacion { get; set; }
        public bool Activo { get; set; }
    }
}
