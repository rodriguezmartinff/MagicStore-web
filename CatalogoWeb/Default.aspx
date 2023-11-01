<%@ Page Title="" Language="C#" MasterPageFile="~/MiMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CatalogoWeb.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Novedades:</h1>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <asp:Repeater runat="server" ID="repRepetidor">
            <ItemTemplate>
                <div class="col">

                    <div class="card h-100">
                        <img src="/Imagenes/Articulos/<%#Eval("ImagenUrl")  %>" onerror="this.src='/Imagenes/Articulos/sinfoto.jpg'" class="card-img-top" alt="..." style="max-width: 325px; height: 325px; object-fit: contain;">
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

    <h1>Mas vendidos:</h1>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <asp:Repeater runat="server" ID="repeaterMasVendidos">
            <ItemTemplate>
                <div class="col">

                    <div class="card h-100">
                        <img src="/Imagenes/Articulos/<%#Eval("ImagenUrl")  %>" onerror="this.src='/Imagenes/Articulos/sinfoto.jpg'" class="card-img-top" alt="..." style="max-width: 325px; height: 325px; object-fit: contain;">
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

    <br />

    <h1>Promociones:</h1>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <asp:Repeater runat="server" ID="repeaterPromociones">
            <ItemTemplate>
                <div class="col">

                    <div class="card h-100">
                        <img src="/Imagenes/Articulos/<%#Eval("ImagenUrl")  %>" onerror="this.src='/Imagenes/Articulos/sinfoto.jpg'" class="card-img-top" alt="..." style="max-width: 325px; height: 325px; object-fit: contain;">
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

    <h1>Colecciones completas:</h1>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <asp:Repeater runat="server" ID="repeaterColecciones">
            <ItemTemplate>
                <div class="col">

                    <div class="card h-100">
                        <img src="/Imagenes/Articulos/<%#Eval("ImagenUrl")  %>" onerror="this.src='/Imagenes/Articulos/sinfoto.jpg'" class="card-img-top" alt="..." style="max-width: 325px; height: 325px; object-fit: contain;">
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
