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

    }
}
