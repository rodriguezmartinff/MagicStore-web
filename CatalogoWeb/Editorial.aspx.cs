using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CatalogoWeb
{
    public partial class Editorial : System.Web.UI.Page
    {
        public string EditorialActual {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string Editorial = Request.QueryString["editorial"] != null ? Request.QueryString["editorial"] : "";

                MarcaNegocio editorialnegocio = new MarcaNegocio();
                EditorialActual = editorialnegocio.DevolverMarca(Editorial);

                ArticulosNegocio negocio = new ArticulosNegocio();
                repRepetidor.DataSource = negocio.ListarPorMarca(Editorial);
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