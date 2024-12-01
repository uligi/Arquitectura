using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_SistemaCostos
    {
        private CD_SistemaCostos objCapaDato = new CD_SistemaCostos();

        public List<SistemaCostos> ObtenerResumenCostos()
        {
            return objCapaDato.ResumenCostos();
        }
    }
}
