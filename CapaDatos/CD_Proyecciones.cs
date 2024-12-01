using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_Proyecciones
    {
        public List<ProyeccionGastos> ObtenerProyeccionesGastos()
        {
            List<ProyeccionGastos> lista = new List<ProyeccionGastos>();
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_ProyeccionesDeGastos", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new ProyeccionGastos
                            {
                                MesProyectado = Convert.ToDateTime(dr["MesProyectado"]),
                                ProyeccionGasto = Convert.ToDecimal(dr["ProyeccionGasto"])
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista = new List<ProyeccionGastos>();
            }
            return lista;
        }

        public List<ProyeccionVentas> ObtenerProyeccionesVentas(DateTime mesSeleccionado)
        {
            List<ProyeccionVentas> lista = new List<ProyeccionVentas>();
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_ProyeccionesDeVentas", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Agregar parámetro del mes seleccionado
                    cmd.Parameters.AddWithValue("@MesSeleccionado", mesSeleccionado);

                    oConexion.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new ProyeccionVentas
                            {
                                MesProyectado = Convert.ToDateTime(dr["MesProyectado"]),
                                ProyeccionVenta = Convert.ToDecimal(dr["ProyeccionVenta"])
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista = new List<ProyeccionVentas>();
            }
            return lista;
        }


    }
}
