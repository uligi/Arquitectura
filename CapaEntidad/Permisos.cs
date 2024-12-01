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
        //  ModuloID INT PRIMARY KEY IDENTITY(1,1),
       // NombreModulo NVARCHAR(100) UNIQUE NOT NULL,
   // RolPermitido NVARCHAR(20) CHECK(RolPermitido IN ('empleado', 'gerente')),
  //  Activo BIT NOT NULL DEFAULT 1  -- Borrado lógico

        public int ModuloID { get; set; }
        public string NombreModulo { get; set; }
        public string RolPermitido { get; set; }
        public bool Activo { get; set; }
    }
}
