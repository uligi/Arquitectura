﻿using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_Usuario
    {
        // Método para listar usuarios
        public List<Usuarios> Listar()
        {
            List<Usuarios> lista = new List<Usuarios>();
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_ListarUsuarios", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Usuarios()
                            {
                                UsuarioID = Convert.ToInt32(dr["UsuarioID"]),
                                Cedula = Convert.ToInt32(dr["Cedula"]),
                                Contrasena = dr["Contrasena"].ToString(),
                                RestablecerContrasena = Convert.ToBoolean(dr["RestablecerContrasena"]),
                                Activo = Convert.ToBoolean(dr["Activo"]),
                                FechaCreacion = Convert.ToDateTime(dr["FechaCreacion"]),
                                Rol = new Roles
                                {
                                    RolID = Convert.ToInt32(dr["RolID"]),
                                    Rol = dr["Rol"].ToString() // Corregido a "Rol"
                                },
                                Persona = new Persona
                                {
                                    Cedula = Convert.ToInt32(dr["Cedula"]),
                                    Nombre = dr["Nombre"].ToString(),
                                    Apellido = dr["Apellido"].ToString(), // Ajustado si es solo un campo
                                    Correo = dr["Correo"].ToString()
                                }
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message); // Para depurar el error
                lista = new List<Usuarios>();
            }
            return lista;
        }


        // Método para registrar un usuario
        public int Registrar(Usuarios obj, out string Mensaje)
        {
            int resultado = 0;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_RegistrarUsuario", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Contrasena", obj.Contrasena);
                    cmd.Parameters.AddWithValue("@RestablecerContraseña", obj.RestablecerContrasena);
                    cmd.Parameters.AddWithValue("@Cedula", obj.Cedula);
                    cmd.Parameters.AddWithValue("@Nombre", obj.Persona.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", obj.Persona.Apellido);
                    cmd.Parameters.AddWithValue("@Correo", obj.Persona.Correo);
                    cmd.Parameters.AddWithValue("@RolID", obj.RolID);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    resultado = Convert.ToInt32(cmd.Parameters["@Resultado"].Value);
                    Mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                resultado = 0;
                Mensaje = ex.Message;
            }
            return resultado;
        }


        // Método para editar un usuario
        public bool Editar(Usuarios obj, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_EditarUsuario", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UsuarioID", obj.UsuarioID);
                    cmd.Parameters.AddWithValue("@Cedula", obj.Cedula);
                    cmd.Parameters.AddWithValue("@Nombre", obj.Persona.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", obj.Persona.Apellido);
                    cmd.Parameters.AddWithValue("@Correo", obj.Persona.Correo);
                    cmd.Parameters.AddWithValue("@RolID", obj.RolID);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    int resultadoSP = Convert.ToInt32(cmd.Parameters["@Resultado"].Value);
                    Mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                    resultado = resultadoSP > 0;
                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }
            return resultado;
        }



        // Método para eliminar (borrado lógico) un usuario
        public bool Eliminar(int id, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_EliminarUsuario", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UsuarioID", id);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    resultado = Convert.ToBoolean(cmd.Parameters["@Resultado"].Value);
                    Mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }
            return resultado;
        }
        public bool CambiarClave(int UsuarioID, string nuevaClave, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_CambiarClave", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UsuarioID", UsuarioID);
                    cmd.Parameters.AddWithValue("@NuevaClave", nuevaClave);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["@Resultado"].Value);
                    Mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }
            return resultado;
        }


        public bool RestablecerContrasena(int UsuarioID, string NuevaContrasena, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.conexion))
                {
                    SqlCommand cmd = new SqlCommand("sp_RestablecerContrasena", oConexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UsuarioID", UsuarioID);
                    cmd.Parameters.AddWithValue("@NuevaContrasena", NuevaContrasena);
                    cmd.Parameters.Add("@Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 500).Direction = ParameterDirection.Output;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    resultado = Convert.ToBoolean(cmd.Parameters["@Resultado"].Value);
                    Mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }
            return resultado;
        }



    }
}
