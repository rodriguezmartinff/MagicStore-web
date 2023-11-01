<%@ Page Title="" Language="C#" MasterPageFile="~/MiMasterPage.Master" AutoEventWireup="true" CodeBehind="Buscador.aspx.cs" Inherits="CatalogoWeb.Buscador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Aca busca puta</h3>

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

<%--    <%if (FiltroAvanzado)
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

    <div class="row row-cols-1 row-cols-md-4 g-4">
        <asp:Repeater runat="server" ID="repBusqueda">
            <ItemTemplate>
                <div class="col">

                    <div class="card h-100">
                        <img src="/Imagenes/Articulos/<%#Eval("ImagenUrl")  %>" onerror="this.src='https://wintechnology.co/wp-content/uploads/2021/11/imagen-no-disponible.jpg'" class="card-img-top" alt="..." style="max-width: 325px; height: 325px; object-fit: contain;">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                            <p class="card-text"><%#Eval("Descripcion")%></p>
                            <p class="card-text">$ <%#Math.Floor(Convert.ToDecimal(Eval("Precio"))).ToString("N0")%></p>
                            <a href="Detalle.aspx?id=<%#Eval("Id")%>" class="btn btn-primary" id="<%#Eval("Id")%>">Ver más...</a>
                        </div>
                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>
    </div>

    <br />

    <h1>Promociones:</h1>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <asp:Repeater runat="server" ID="repeaterPromociones">
            <ItemTemplate>
                <div class="col">

                    <div class="card h-100">
                        <img src="/Imagenes/Articulos/<%#Eval("ImagenUrl")  %>" onerror="this.src='https://wintechnology.co/wp-content/uploads/2021/11/imagen-no-disponible.jpg'" class="card-img-top" alt="..." style="max-width: 325px; height: 325px; object-fit: contain;">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                            <p class="card-text"><%#Eval("Descripcion")%></p>
                            <a href="Detalle.aspx?id=<%#Eval("Id")%>" class="btn btn-primary" id="<%#Eval("Id")%>">Ver más...</a>
                        </div>
                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>
    </div>

</asp:Content>
