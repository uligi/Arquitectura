using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_Permisos
    {
        private CD_Permisos objCapaDatos = new CD_Permisos();

        public List<Permisos> Listar()
        {
            return objCapaDatos.Listar();
        }

        public int Registrar(Permisos obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.NombreModulo) || string.IsNullOrWhiteSpace(obj.NombreModulo))
            {
                mensaje = "El nombre del módulo no puede estar vacío.";
                return 0;
            }

            return objCapaDatos.Registrar(obj, out mensaje);
        }

        public bool Editar(Permisos obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.NombreModulo) || string.IsNullOrWhiteSpace(obj.NombreModulo))
            {
                mensaje = "El nombre del módulo no puede estar vacío.";
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
