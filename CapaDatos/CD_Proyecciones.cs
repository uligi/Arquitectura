using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CapaEntidad;

namespace CapaDatos
{
    public class CD_Proyecciones
    {
        public List<ProyeccionGastos> ObtenerProyeccionesDeGastos()
        {
            List<ProyeccionGastos> lista = new List<ProyeccionGastos>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_ProyeccionesDeGastos", oConexion)
                {
                    CommandType = CommandType.StoredProcedure
                };
                oConexion.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new ProyeccionGastos
                        {
                            MesProyectado = dr["MesProyectado"].ToString(),
                            ProyeccionGasto = Convert.ToDecimal(dr["ProyeccionGasto"])
                        });
                    }
                }
            }
            return lista;
        }

        public List<ProyeccionVentas> ObtenerProyeccionesDeVentas()
        {
            List<ProyeccionVentas> lista = new List<ProyeccionVentas>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_ProyeccionesDeVentas", oConexion)
                {
                    CommandType = CommandType.StoredProcedure
                };
                oConexion.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new ProyeccionVentas
                        {
                            MesProyectado = dr["MesProyectado"].ToString(),
                            ProyeccionVenta = Convert.ToDecimal(dr["ProyeccionVenta"])
                        });
                    }
                }
            }
            return lista;
        }
    }
}
