using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;

namespace CapaPresentacion
{
    public partial class FrsVehiculos : Form
    {
        CDVehiculos cdVehiculos = new CDVehiculos();
        public FrsVehiculos()
        {
            InitializeComponent();
        }

        public void MtdMostrarVehiculos()
        {
            //CDVehiculos cdVehiculos = new CDVehiculos();
            DataTable dtMostrarVehiculos = cdVehiculos.MtMostrarVehiculos();
            dgvVehiculos.DataSource = dtMostrarVehiculos;
        }

        private void FrsVehiculos_Load(object sender, EventArgs e)
        {
            MtdMostrarVehiculos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //CDVehiculos cdVehiculos = new CDVehiculos();

            try
            {
                cdVehiculos.CP_mtdAgregarVehiculos(txtMarca.Text,txtModelo.Text, int.Parse(txtAño.Text), decimal.Parse(txtPrecio.Text), cmbEstado.Text);
                MtdMostrarVehiculos();
                MessageBox.Show("El Vehiculo se agrego con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {

                int codigo = int.Parse(txtIDVh.Text);
                string marca = txtMarca.Text;
                string modelo = txtModelo.Text;
                int año = int.Parse(txtAño.Text);
                decimal precio = decimal.Parse(txtPrecio.Text);
                string Estado = cmbEstado.Text;

                int vCantidadRegistros = cdVehiculos.CP_mtdActualizarVh(codigo, marca, modelo, año,precio, Estado);
                MtdMostrarVehiculos();
                MessageBox.Show("El Vehiculo se actualizo con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
