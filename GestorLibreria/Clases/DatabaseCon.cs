using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorLibreria.Clases
{
    class DatabaseCon
    {
        private DatabaseCon _instance;
        private SqlConnection connection;

        private DatabaseCon()
        {
            connection = new SqlConnection();
        }

        public DatabaseCon Instace
        {
            get
            {
                if (_instance == null)
                    _instance = new DatabaseCon();

                return _instance;

            }
        }

        /// <summary>
        /// Devuelve un <see cref="DataTable"/> con los datos del <paramref name="Query"/>
        /// </summary>
        /// <param name="Query">Comando SQL de Selecion </param>
        /// <returns></returns>
        public DataTable TraerDatos(string Query)
        {
            DataTable ret = new DataTable();
            var cmd = new SqlCommand(Query, connection);
            SqlDataAdapter adap = new SqlDataAdapter(cmd);
            connection.Open();
            adap.Fill(ret);
            connection.Close();
            return ret;
        }

    }

}
