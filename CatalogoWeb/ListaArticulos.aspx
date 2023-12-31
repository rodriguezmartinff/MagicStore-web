﻿<%@ Page Title="Lista" Language="C#" MasterPageFile="~/MiMasterPage.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="CatalogoWeb.ListaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validar {
            color: red;
            font-size: 13px;
        }
    </style>
    <script>
        function validar() {
            const txtCategoria = document.getElementById("txtAddCategoria");

            var resultado = new Boolean(true);

            if (txtCategoria.value == "") {
                txtCategoria.classList.remove("is-valid");
                txtCategoria.classList.add("is-invalid");
                resultado = false;
            } else {
                txtCategoria.classList.remove("is-invalid");
                txtCategoria.classList.add("is-valid");
            }
            return resultado;



        }

        function validareditorial() {
            const txteditorial = document.getElementById("txtAddEditorial");

            if (txteditorial.value == "") {
                txteditorial.classList.add("is-invalid");
                return false
            }
            return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de articulos:</h1>

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Buscar por nombre" runat="server" />
                <asp:TextBox runat="server" ID="txtBuscar" CssClass="form-control" OnTextChanged="txtBuscar_TextChanged" AutoPostBack="true" />
            </div>
        </div>

        <%--<div class="col-6">
            <br />
            <asp:CheckBox Text="Filtro avanzado" ID="cbFiltroAvanzado" runat="server" AutoPostBack="true"
                OnCheckedChanged="cbFiltroAvanzado_CheckedChanged" />
        </div>--%>
    </div>

    <%--<%if (FiltroAvanzado)
        { %>
    <asp:Panel ID="panel1" runat="server" DefaultButton="btnBusquedaAvanzada">
        <div class="row">


            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCampo"
                        OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="Nombre" />
                        <asp:ListItem Text="Categoria" />
                        <asp:ListItem Text="Precio" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Criterio" ID="lblCriterio" runat="server" />
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCriterio" />
                </div>
            </div>

            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Filtro" ID="lblFiltro" runat="server" />
                    <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control" />
                    <asp:Label Text="" ID="lblValidacion" runat="server" CssClass="validar" />
                </div>
            </div>

            <div class="col-3">
                <div class="mb-3">
                    <br />
                    <asp:Button ID="btnBusquedaAvanzada" runat="server" CssClass="btn btn-primary"
                        Text="Buscar" OnClick="btnBusquedaAvanzada_Click" />
                </div>
            </div>


        </div>
    </asp:Panel>
    <%}
    %>--%>

    <%if (UsuarioTipo == TipoUsuario.ADMIN)
        {
    %>
    <asp:GridView ID="gvArticulosLogin" runat="server" CssClass="table" AutoGenerateColumns="false" PageSize="5"
        OnSelectedIndexChanged="gvArticulosLogin_SelectedIndexChanged" DataKeyNames="Id" AllowPaging="true" OnPageIndexChanging="gvArticulosLogin_PageIndexChanging">
        <Columns>
            <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Editorial" DataField="Marca" />
            <asp:BoundField HeaderText="Categoría" DataField="Categoria" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:F0}" />
            <asp:CommandField HeaderText="" SelectText="Editar/Eliminar" ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
    <a href="AgregarEditar.aspx" class="btn btn-primary">Agregar articulo</a>

    <hr />

    <asp:GridView ID="gvCategorias" runat="server" CssClass="table" AutoGenerateColumns="false" PageSize="5"
        OnSelectedIndexChanged="gvCategorias_SelectedIndexChanged" DataKeyNames="Id" AllowPaging="true" OnPageIndexChanging="gvCategorias_PageIndexChanging">
        <Columns>
            <asp:BoundField HeaderText="Categorias" DataField="Descripcion" />
            <asp:CommandField HeaderText="" SelectText="Eliminar" ShowSelectButton="true" />
        </Columns>
    </asp:GridView>

    <div class="row">
        <div class="col-2">
            <asp:Button Text="Agregar Categoria" runat="server" class="btn btn-primary" ID="btnAddCategoria" OnClick="btnAddCategoria_Click" />
        </div>
        <div class="col-6">
            <%if ((bool)ViewState["AddCategoria"])
                {%>
            <div class="row">
                <div class="col-3">
                    <asp:TextBox runat="server" ID="txtAddCategoria" CssClass="form-control" ClientIDMode="Static" />
                </div>
                <div class="col-3">
                    <asp:Button Text="Aceptar" runat="server" class="btn btn-secondary" ID="btnAddCatAceptar" OnClick="btnAddCatAceptar_Click" OnClientClick="return validar()" />
                </div>
            </div>
            <%} %>
        </div>
    </div>

    <hr />

    <asp:GridView ID="gvEditoriales" runat="server" CssClass="table" AutoGenerateColumns="false" PageSize="5"
        OnSelectedIndexChanged="gvEditoriales_SelectedIndexChanged" DataKeyNames="Id" AllowPaging="true" OnPageIndexChanging="gvEditoriales_PageIndexChanging">
        <Columns>
            <asp:BoundField HeaderText="Editoriales" DataField="Descripcion" />
            <asp:CommandField HeaderText="" SelectText="Eliminar" ShowSelectButton="true" />
        </Columns>
    </asp:GridView>

    <div class="row">
        <div class="col-2">
            <asp:Button Text="Agregar Editorial" runat="server" class="btn btn-primary" ID="btnAddEditorial" OnClick="btnAddEditorial_Click" />
        </div>
        <div class="col-6">
            <%if ((bool)ViewState["AddEditorial"])
                {%>
            <div class="row">
                <div class="col-3">
                    <asp:TextBox runat="server" ID="txtAddEditorial" CssClass="form-control" ClientIDMode="Static" />
                </div>
                <div class="col-3">
                    <asp:Button Text="Aceptar" runat="server" class="btn btn-secondary" ID="btnAddEditAceptar" OnClick="btnAddEditAceptar_Click" OnClientClick="return validareditorial()" />
                </div>
            </div>
            <%} %>
        </div>
    </div>

    <%}
        else
        {%>
    <asp:GridView ID="gvArticulos" runat="server" CssClass="table" AutoGenerateColumns="false" PageSize="5"
        OnSelectedIndexChanged="gvArticulos_SelectedIndexChanged" DataKeyNames="Id" AllowPaging="true" OnPageIndexChanging="gvArticulos_PageIndexChanging">
        <Columns>
            <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Marca" DataField="Marca" />
            <asp:BoundField HeaderText="Categoría" DataField="Categoria" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:F0}" />
            <asp:CommandField HeaderText="" SelectText="Ver mas" ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
    <%}%>
</asp:Content>
