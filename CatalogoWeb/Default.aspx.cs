using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Configuration;

namespace CatalogoWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();

                repRepetidor.DataSource = negocio.ListarNovedades();
                repRepetidor.DataBind();

                repeaterMasVendidos.DataSource = negocio.ListarMasVendidos();
                repeaterMasVendidos.DataBind();

                repeaterPromociones.DataSource = negocio.ListarPromociones();
                repeaterPromociones.DataBind();

                repeaterColecciones.DataSource = negocio.ListarColecciones();
                repeaterColecciones.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}