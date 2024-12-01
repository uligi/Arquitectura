using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_Permisos
    {
        private CD_Permisos objCapaDato = new CD_Permisos();
        public List<Permisos> Listar()
        {
            return objCapaDato.Listar();
        }
    }
}
