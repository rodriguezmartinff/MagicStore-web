using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace CatalogoWeb
{
    public partial class MiMasterPage : System.Web.UI.MasterPage
    {
        public List<Categorias> listCategorias;
        public List<Marcas> listEditorial;
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaNegocio negocio = new CategoriaNegocio();
            listCategorias = negocio.listar();

            MarcaNegocio negocio1 = new MarcaNegocio();
            listEditorial = negocio1.listar();
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("Default.aspx", false);
        }
    }
}