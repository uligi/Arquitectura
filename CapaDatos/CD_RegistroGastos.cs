using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_RegistroGastos
    {
        public List<RegistroGastos> Listar()
        {
            List<RegistroGastos> lista = new List<RegistroGastos>();
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_ListarRegistroGastos", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new RegistroGastos()
                            {
                                GastoID = Convert.ToInt32(dr["GastoID"]),
                                Descripcion = dr["Descripcion"].ToString(),
                                Monto = Convert.ToDecimal(dr["Monto"]),
                                FechaGasto = Convert.ToDateTime(dr["FechaGasto"]),
                                Categoria = dr["Categoria"].ToString(),
                                ReferenciaExterna = dr["ReferenciaExterna"].ToString(),
                                CuentaID = Convert.ToInt32(dr["CuentaID"]),
                                Activo = Convert.ToBoolean(dr["Activo"])
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista = new List<RegistroGastos>();
            }
            return lista;
        }

        public int Registrar(RegistroGastos obj, out string mensaje)
        {
            int idGenerado = 0;
            mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_RegistrarRegistroGastos", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Descripcion", obj.Descripcion);
                    cmd.Parameters.AddWithValue("@Monto", obj.Monto);
                    cmd.Parameters.AddWithValue("@FechaGasto", obj.FechaGasto);
                    cmd.Parameters.AddWithValue("@Categoria", obj.Categoria);
                    cmd.Parameters.AddWithValue("@ReferenciaExterna", obj.ReferenciaExterna);
                    cmd.Parameters.AddWithValue("@CuentaID", obj.CuentaID);

                    cmd.Parameters.Add("@Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    idGenerado = Convert.ToInt32(cmd.Parameters["@Resultado"].Value);
                    mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                mensaje = ex.Message;
            }
            return idGenerado;
        }

        public bool Editar(RegistroGastos obj, out string mensaje)
        {
            bool resultado = false;
            mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_EditarRegistroGastos", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@GastoID", obj.GastoID);
                    cmd.Parameters.AddWithValue("@Descripcion", obj.Descripcion);
                    cmd.Parameters.AddWithValue("@Monto", obj.Monto);
                    cmd.Parameters.AddWithValue("@FechaGasto", obj.FechaGasto);
                    cmd.Parameters.AddWithValue("@Categoria", obj.Categoria);
                    cmd.Parameters.AddWithValue("@ReferenciaExterna", obj.ReferenciaExterna);
                    cmd.Parameters.AddWithValue("@CuentaID", obj.CuentaID);

                    cmd.Parameters.Add("@Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["@Resultado"].Value);
                    mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                mensaje = ex.Message;
            }
            return resultado;
        }

        public bool Eliminar(int id, out string mensaje)
        {
            bool resultado = false;
            mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_EliminarRegistroGastos", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@GastoID", id);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["@Resultado"].Value);
                    mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                mensaje = ex.Message;
            }
            return resultado;
        }
    }
}
