using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data; //imp
using System.Data.SqlClient; //imp

namespace CapaDatos
{
    public class CDVehiculos
    {
        CDConexion conexion = new CDConexion();

        public DataTable MtMostrarVehiculos()
        {
            string QryMostrarClientes = "uspTblVehiculosMostrar";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrarClientes, conexion.MtdAbrirConexion());
            DataTable dtMostrarClientes = new DataTable();
            adapter.Fill(dtMostrarClientes);
            conexion.MtdCerrarConexion();
            return dtMostrarClientes;
        }

        public void CP_mtdAgregarVehiculos(string Marca, string Modelo, int Año, decimal Precio, string Estado)
        {

            string Usp_crear = "uspVehiculosInsertar";
            SqlCommand cmd_InsertarVehiculos = new SqlCommand(Usp_crear, conexion.MtdAbrirConexion());
            cmd_InsertarVehiculos.CommandType = CommandType.StoredProcedure;

            cmd_InsertarVehiculos.Parameters.AddWithValue("@Marca", Marca);
            cmd_InsertarVehiculos.Parameters.AddWithValue("@Modelo", Modelo);
            cmd_InsertarVehiculos.Parameters.AddWithValue("@Año", Año);
            cmd_InsertarVehiculos.Parameters.AddWithValue("@Precio", Precio);
            cmd_InsertarVehiculos.Parameters.AddWithValue("@Estado", Estado);
            cmd_InsertarVehiculos.ExecuteNonQuery();
        }

    }
}
