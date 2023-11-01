using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace CatalogoWeb
{
    public partial class Categoria : System.Web.UI.Page
    {

        public string CategoriaActual { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                string Categoria = Request.QueryString["categoria"] != null ? Request.QueryString["categoria"] : "";

                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                CategoriaActual = categoriaNegocio.DevolverCategoria(Categoria);

                ArticulosNegocio negocio = new ArticulosNegocio();
                repRepetidor.DataSource = negocio.ListarPorCategoria(Categoria);
                repRepetidor.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}