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
        public FrsVehiculos()
        {
            InitializeComponent();
        }

        public void MtdMostrarVehiculos()
        {
            CDVehiculos cdVehiculos = new CDVehiculos();
            DataTable dtMostrarVehiculos = cdVehiculos.MtMostrarVehiculos();
            dgvVehiculos.DataSource = dtMostrarVehiculos;
        }

        private void FrsVehiculos_Load(object sender, EventArgs e)
        {
            MtdMostrarVehiculos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            CDVehiculos cdVehiculos = new CDVehiculos();

            try
            {
                cdVehiculos.CP_mtdAgregarVehiculos(txtMarca.Text,txtModelo.Text, int.Parse(txtAño.Text), decimal.Parse(txtPrecio.Text), cmbEstado.Text);
                MtdMostrarVehiculos();
                MessageBox.Show("El Cliente se agrego con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
