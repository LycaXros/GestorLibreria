using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GestorLibreria
{
    public partial class Base : Form
    {
        public Base()
        {
            InitializeComponent();
        }

        private void UserNameLbl_Click(object sender, EventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }
    }
}
