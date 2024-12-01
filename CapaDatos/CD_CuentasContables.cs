using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_CuentasContables
    {
        public List<CuentaContable> Listar()
        {
            List<CuentaContable> lista = new List<CuentaContable>();
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_ListarCuentasContables", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new CuentaContable()
                            {
                                CuentaID = Convert.ToInt32(dr["CuentaID"]),
                                CodigoCuenta = dr["CodigoCuenta"].ToString(),
                                DescripcionCuenta = dr["DescripcionCuenta"].ToString(),
                                Clase = dr["Clase"].ToString(),
                                Grupo = dr["Grupo"].ToString(),
                                Rubro = dr["Rubro"].ToString(),
                                Subcuenta = dr["Subcuenta"].ToString(),
                                Nivel = Convert.ToInt32(dr["Nivel"]),
                                CodigoPadre = dr["CodigoPadre"].ToString(),
                                SaldoInicial = Convert.ToDecimal(dr["SaldoInicial"]),
                                FechaCreacion = Convert.ToDateTime(dr["FechaCreacion"]),
                                Activo = Convert.ToBoolean(dr["Activo"])
                            });
                        }
                    }
                }
            }
            catch (Exception)
            {
                lista = new List<CuentaContable>();
            }
            return lista;
        }

        public int Registrar(CuentaContable obj, out string mensaje)
        {
            int idGenerado = 0;
            mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_RegistrarCuentaContable", oConexion);
                    cmd.Parameters.AddWithValue("@CodigoCuenta", obj.CodigoCuenta);
                    cmd.Parameters.AddWithValue("@DescripcionCuenta", obj.DescripcionCuenta);
                    cmd.Parameters.AddWithValue("@Clase", obj.Clase);
                    cmd.Parameters.AddWithValue("@Grupo", obj.Grupo);
                    cmd.Parameters.AddWithValue("@Rubro", obj.Rubro);
                    cmd.Parameters.AddWithValue("@Subcuenta", obj.Subcuenta);
                    cmd.Parameters.AddWithValue("@Nivel", obj.Nivel);
                    cmd.Parameters.AddWithValue("@CodigoPadre", obj.CodigoPadre);
                    cmd.Parameters.AddWithValue("@SaldoInicial", obj.SaldoInicial);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
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

        public bool Editar(CuentaContable obj, out string mensaje)
        {
            bool resultado = false;
            mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_EditarCuentaContable", oConexion);
                    cmd.Parameters.AddWithValue("@CuentaID", obj.CuentaID);
                    cmd.Parameters.AddWithValue("@CodigoCuenta", obj.CodigoCuenta);
                    cmd.Parameters.AddWithValue("@DescripcionCuenta", obj.DescripcionCuenta);
                    cmd.Parameters.AddWithValue("@Clase", obj.Clase);
                    cmd.Parameters.AddWithValue("@Grupo", obj.Grupo);
                    cmd.Parameters.AddWithValue("@Rubro", obj.Rubro);
                    cmd.Parameters.AddWithValue("@Subcuenta", obj.Subcuenta);
                    cmd.Parameters.AddWithValue("@Nivel", obj.Nivel);
                    cmd.Parameters.AddWithValue("@CodigoPadre", obj.CodigoPadre);
                    cmd.Parameters.AddWithValue("@SaldoInicial", obj.SaldoInicial);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
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
                    SqlCommand cmd = new SqlCommand("sp_EliminarCuentaContable", oConexion);
                    cmd.Parameters.AddWithValue("@CuentaID", id);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
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
