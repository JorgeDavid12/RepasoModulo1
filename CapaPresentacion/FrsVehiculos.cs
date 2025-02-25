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
    }
}
