using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_Roles
    {
        private CD_Roles objCapaDato = new CD_Roles();

        // Método para listar roles
        public List<Roles> Listar()
        {
            return objCapaDato.Listar();
        }

        // Método para registrar un nuevo rol
        public int Registrar(Roles obj, out string Mensaje)
        {
            return objCapaDato.Registrar(obj, out Mensaje);
        }

        // Método para editar un rol
        public bool Editar(Roles obj, out string Mensaje)
        {
            return objCapaDato.Editar(obj, out Mensaje);
        }

        // Método para eliminar un rol
        public bool Eliminar(int id, out string Mensaje)
        {
            return objCapaDato.Eliminar(id, out Mensaje);
        }
    }
}
