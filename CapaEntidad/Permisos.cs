using Antlr.Runtime.Misc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class Permisos
    {
 
        public int ModuloID { get; set; }
        public string NombreModulo { get; set; }
        public string RolPermitido { get; set; }
        public bool Activo { get; set; }
    }
}
