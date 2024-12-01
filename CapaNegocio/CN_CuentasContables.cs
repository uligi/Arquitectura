using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_CuentasContables
    {
        private CD_CuentasContables objCapaDatos = new CD_CuentasContables();

        public List<CuentaContable> Listar()
        {
            return objCapaDatos.Listar();
        }

        public int Registrar(CuentaContable obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.CodigoCuenta) || string.IsNullOrWhiteSpace(obj.DescripcionCuenta))
            {
                mensaje = "Los campos Código y Descripción no pueden estar vacíos.";
                return 0;
            }

            return objCapaDatos.Registrar(obj, out mensaje);
        }

        public bool Editar(CuentaContable obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.CodigoCuenta) || string.IsNullOrWhiteSpace(obj.DescripcionCuenta))
            {
                mensaje = "Los campos Código y Descripción no pueden estar vacíos.";
                return false;
            }

            return objCapaDatos.Editar(obj, out mensaje);
        }

        public bool Eliminar(int id, out string mensaje)
        {
            return objCapaDatos.Eliminar(id, out mensaje);
        }
    }
}
