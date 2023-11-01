using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CatalogoWeb
{
    public partial class Buscador : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();
            Session.Add("ListaArticulos", negocio.Listar());

            repeaterPromociones.DataSource = negocio.ListarPromociones();
            repeaterPromociones.DataBind();
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            try
            {
                repBusqueda.DataSource = ((List<Articulos>)Session["ListaArticulos"]).FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
                repBusqueda.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        //protected void cbFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        //{
        //    FiltroAvanzado = cbFiltroAvanzado.Checked;
        //    txtBuscar.Enabled = !FiltroAvanzado;
        //}

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBusquedaAvanzada_Click(object sender, EventArgs e)
        {

        }
    }
}