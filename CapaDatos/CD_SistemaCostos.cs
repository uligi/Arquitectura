using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_SistemaCostos
    {
        public List<SistemaCostos> ResumenCostos()
        {
            List<SistemaCostos> lista = new List<SistemaCostos>();
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_ResumenCostosSinTabla", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new SistemaCostos()
                            {
                                OrdenProduccionID = Convert.ToInt32(dr["OrdenProduccionID"]),
                                DescripcionOrden = dr["DescripcionOrden"].ToString(),
                                TotalCostos = Convert.ToDecimal(dr["TotalCostos"]),
                                TotalVentas = Convert.ToDecimal(dr["TotalVentas"]),
                                Rentabilidad = Convert.ToDecimal(dr["Rentabilidad"])
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lista = new List<SistemaCostos>();
            }
            return lista;
        }
    }
}
