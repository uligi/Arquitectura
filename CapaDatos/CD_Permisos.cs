using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_Permisos
    {

        public List<Permisos> Listar()
        {
            List<Permisos> lista = new List<Permisos>();
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_ListarPermisosModulo", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Permisos()
                            {
                                ModuloID = Convert.ToInt32(dr["ModuloID"]),
                                NombreModulo = dr["NombreModulo"].ToString(),
                                RolPermitido = dr["RolPermitido"].ToString(),
                                Activo = Convert.ToBoolean(dr["Activo"]),
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo de errores
                lista = new List<Permisos>();
            }
            return lista;
        }
    }
}
