<%@ Page Title="" Language="C#" MasterPageFile="~/MiMasterPage.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="CatalogoWeb.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Detalle del artículo:</h2>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="lblCodigo" class="form-label">Codigo:</label>
                <asp:Label runat="server" Text="Label" ID="lblCodigo" CssClass="form-control"></asp:Label>
            </div>
            <div class="mb-3">
                <label for="lblNombre" class="form-label">Nombre:</label>
                <asp:Label runat="server" Text="Label" ID="lblNombre" CssClass="form-control"></asp:Label>
            </div>
            <div class="mb-3">
                <label for="lblDescripcion" class="form-label">Descripcion:</label>
                <asp:Label runat="server" Text="Label" ID="lblDescripcion" CssClass="form-control"></asp:Label>
            </div>
            <div class="mb-3">
                <label for="lblMarca" class="form-label">Marca:</label>
                <asp:Label runat="server" Text="Label" ID="lblMarca" CssClass="form-control"></asp:Label>
            </div>
            <div class="mb-3">
                <label for="lblDetalle" class="form-label">Detalle:</label>
                <asp:Label runat="server" Text="Label" ID="lblDetalle" CssClass="form-control"></asp:Label>
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="lblCategoria" class="form-label">Categoria:</label>
                <asp:Label runat="server" Text="Label" ID="lblCategoria" CssClass="form-control"></asp:Label>
            </div>
            <div class="mb-3">
                <label for="lblPrecio" class="form-label">Precio:</label>
                <asp:Label runat="server" Text="Label" ID="lblPrecio" CssClass="form-control"></asp:Label>
            </div>
            <asp:Image runat="server" ID="imgImagen" Style="width: 350px; height: 350px; object-fit: contain;" onerror="this.src='https://wintechnology.co/wp-content/uploads/2021/11/imagen-no-disponible.jpg'"></asp:Image>
        </div>

    </div>

    <div class="row">
        <br />
        <h2>Productos relacionados:</h2>
        <br />
        <div class="row row-cols-1 row-cols-md-4 g-4">
            <asp:Repeater runat="server" ID="repeaterRelacionados">
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

    </div>
</asp:Content>
