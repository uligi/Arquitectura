using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_RegistroGastos
    {
        private CD_RegistroGastos objCapaDatos = new CD_RegistroGastos();

        public List<RegistroGastos> Listar()
        {
            return objCapaDatos.Listar();
        }

        public int Registrar(RegistroGastos obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripcion) || obj.Monto <= 0 || obj.FechaGasto == DateTime.MinValue)
            {
                mensaje = "Todos los campos son obligatorios.";
                return 0;
            }

            return objCapaDatos.Registrar(obj, out mensaje);
        }

        public bool Editar(RegistroGastos obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripcion) || obj.Monto <= 0 || obj.FechaGasto == DateTime.MinValue)
            {
                mensaje = "Todos los campos son obligatorios.";
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
