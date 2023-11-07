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
    public partial class ListaArticulos : System.Web.UI.Page
    {

        public enum TipoUsuario
        {
            NULO = 0,
            ADMIN = 1,
            NORMAL = 2,
        }

        public TipoUsuario UsuarioTipo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //FiltroAvanzado = cbFiltroAvanzado.Checked;
            
            if (!IsPostBack)
            {
                ViewState["AddCategoria"] = false;
                ViewState["AddEditorial"] = false;
            }

            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                Session.Add("ListaArticulos", negocio.Listar());

                if (Session["usuario"] == null)
                    UsuarioTipo = TipoUsuario.NULO;
                else if (((Dominio.Usuario)Session["usuario"]).tipoUsuario == Dominio.TipoUsuario.ADMIN)
                    UsuarioTipo = TipoUsuario.ADMIN;
                else
                    UsuarioTipo = TipoUsuario.NORMAL;

                UsuarioTipo = TipoUsuario.ADMIN;

                if (UsuarioTipo == TipoUsuario.ADMIN)
                {
                    gvArticulosLogin.DataSource = Session["ListaArticulos"];
                    gvArticulosLogin.DataBind();

                    CategoriaNegocio negociocat = new CategoriaNegocio();
                    gvCategorias.DataSource = negociocat.listar();
                    gvCategorias.DataBind();

                    MarcaNegocio negociomarc = new MarcaNegocio();
                    gvEditoriales.DataSource = negociomarc.listar();
                    gvEditoriales.DataBind();
                }
                else
                {
                    gvArticulos.DataSource = Session["ListaArticulos"];
                    gvArticulos.DataBind();
                }



            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void gvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string IdSeleccionado = gvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("Detalle.aspx?Id=" + IdSeleccionado);
        }

        protected void gvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvArticulos.PageIndex = e.NewPageIndex;
            gvArticulos.DataBind();
        }

        protected void gvArticulosLogin_SelectedIndexChanged(object sender, EventArgs e)
        {
            string IdSeleccionado = gvArticulosLogin.SelectedDataKey.Value.ToString();
            Response.Redirect("AgregarEditar.aspx?Id=" + IdSeleccionado);
        }

        protected void gvArticulosLogin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvArticulosLogin.PageIndex = e.NewPageIndex;
            gvArticulosLogin.DataBind();
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (UsuarioTipo == TipoUsuario.ADMIN)
            {
                gvArticulosLogin.DataSource = ((List<Articulos>)Session["ListaArticulos"]).FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
                gvArticulosLogin.DataBind();
            }
            else
            {
                gvArticulos.DataSource = ((List<Articulos>)Session["ListaArticulos"]).FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
                gvArticulos.DataBind();
            }
        }

        protected void gvCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string IdSeleccionado = gvCategorias.SelectedDataKey.Value.ToString();

                ArticulosNegocio articulosNegocio = new ArticulosNegocio();
                if(articulosNegocio.ListarPorCategoria(IdSeleccionado).Count != 0)
                {
                    Session.Add("mensaje", 11);
                    Response.Redirect("Mensaje.aspx", false);
                    return;
                }

                CategoriaNegocio negocio = new CategoriaNegocio();
                negocio.EliminarCategoria(int.Parse(IdSeleccionado));
                Response.Redirect("ListaArticulos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void gvCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategorias.PageIndex = e.NewPageIndex;
            gvCategorias.DataBind();
        }

        protected void gvEditoriales_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string IdSeleccionado = gvEditoriales.SelectedDataKey.Value.ToString();

                ArticulosNegocio articulosNegocio = new ArticulosNegocio();
                if (articulosNegocio.ListarPorMarca(IdSeleccionado).Count != 0)
                {
                    Session.Add("mensaje", 12);
                    Response.Redirect("Mensaje.aspx", false);
                    return;
                }

                MarcaNegocio negocio = new MarcaNegocio();
                negocio.Eliminar(int.Parse(IdSeleccionado));
                Response.Redirect("ListaArticulos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void gvEditoriales_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEditoriales.PageIndex = e.NewPageIndex;
            gvEditoriales.DataBind();
        }

        protected void btnAddCategoria_Click(object sender, EventArgs e)
        {
            ViewState["AddCategoria"] = !(bool)ViewState["AddCategoria"];
        }

        protected void btnAddCatAceptar_Click(object sender, EventArgs e)
        {

            ViewState["AddCategoria"] = !(bool)ViewState["AddCategoria"];

            CategoriaNegocio negocio = new CategoriaNegocio();
            
            try
            {
                negocio.Agregar(txtAddCategoria.Text);
                Response.Redirect("ListaArticulos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false );
            }
        }

        protected void btnAddEditAceptar_Click(object sender, EventArgs e)
        {
            ViewState["AddEditorial"] = !(bool)ViewState["AddEditorial"];

            MarcaNegocio negocio = new MarcaNegocio();

            try
            {
                negocio.Agregar(txtAddEditorial.Text);
                Response.Redirect("ListaArticulos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnAddEditorial_Click(object sender, EventArgs e)
        {
            ViewState["AddEditorial"] = !(bool)ViewState["AddEditorial"];
        }

        //protected void cbFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        //{
        //    FiltroAvanzado = cbFiltroAvanzado.Checked;
        //    txtBuscar.Enabled = !FiltroAvanzado;
        //    ddlCampo_SelectedIndexChanged(sender, e);
        //}

        //protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ddlCriterio.Items.Clear();
        //    if (ddlCampo.SelectedItem.ToString() != "Precio")
        //    {
        //        ddlCriterio.Items.Add("Contiene");
        //        ddlCriterio.Items.Add("Termina con");
        //        ddlCriterio.Items.Add("Empieza con");
        //    }
        //    else
        //    {
        //        ddlCriterio.Items.Add("Igual a");
        //        ddlCriterio.Items.Add("Menor a");
        //        ddlCriterio.Items.Add("Mayor a");
        //    }
        //}

        //protected void btnBusquedaAvanzada_Click(object sender, EventArgs e)
        //{
        //    if(ddlCampo.SelectedIndex == 2)
        //    {
        //        if(txtFiltroAvanzado.Text == "")
        //        {
        //            lblValidacion.Text = "Ingrese valor";
        //            return;
        //        }

        //        try
        //        {
        //            decimal aux = decimal.Parse(txtFiltroAvanzado.Text);
        //        }
        //        catch (Exception)
        //        {
        //            lblValidacion.Text = "Formato incorrecto";
        //            return;
        //        }
        //    }
        //    lblValidacion.Text = "";
        //    try
        //    {
        //        ArticulosNegocio negocio = new ArticulosNegocio();

        //        if (UsuarioTipo == TipoUsuario.ADMIN)
        //        {
        //            gvArticulosLogin.DataSource = negocio.Filtrar(ddlCampo.SelectedValue.ToString(),
        //            ddlCriterio.SelectedValue.ToString(), txtFiltroAvanzado.Text);
        //            gvArticulosLogin.DataBind();
        //        }
        //        else
        //        {
        //            gvArticulos.DataSource = negocio.Filtrar(ddlCampo.SelectedValue.ToString(),
        //            ddlCriterio.SelectedValue.ToString(), txtFiltroAvanzado.Text);
        //            gvArticulos.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Session.Add("error", ex.ToString());
        //        Response.Redirect("Error.aspx", false);
        //    }
        //}
    }
}