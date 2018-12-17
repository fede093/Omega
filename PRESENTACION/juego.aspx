<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="juego.aspx.cs" Inherits="PRESENTACION.juego" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_principal">
        <div id="imagen_juego">
            <asp:DataList ID="dlImagen" runat="server" Height="300px" Width="200px" HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Imagen") %>' Height="300px" Width="200px" />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="detalles_juego">
            <asp:DataList ID="dlDetalles" runat="server" Font-Bold="False">
                <ItemTemplate>
                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Nombre:"></asp:Label>
                    &nbsp;<asp:Label ID="Label8" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Fecha de lanzamiento:"></asp:Label>
                    &nbsp;<asp:Label ID="Label9" runat="server" Text='<%# Bind("Fecha_Lanzamiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Desarrollador:"></asp:Label>
                    &nbsp;<asp:Label ID="Label10" runat="server" Text='<%# Bind("Desarrollador") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Distribuidor:"></asp:Label>
                    &nbsp;<asp:Label ID="Label11" runat="server" Text='<%# Bind("Distribuidor") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Genero:"></asp:Label>
                    &nbsp;<asp:Label ID="Label12" runat="server" Text='<%# Bind("NombreGenero") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Idioma:"></asp:Label>
                    &nbsp;<asp:Label ID="Label13" runat="server" Text='<%# Bind("Idioma") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label23" runat="server" Font-Bold="True" Text="Precio:"></asp:Label>
                    &nbsp;<asp:Label ID="Label14" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Clasificación:"></asp:Label>
                    &nbsp;<asp:Label ID="Label15" runat="server" Text='<%# Bind("Clasificacion") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Pagina oficial:"></asp:Label>
                    &nbsp;<asp:Label ID="Label16" runat="server" Text='<%# Bind("Pagina_oficial") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="descripcion_juego">
            <asp:Label ID="Label2" runat="server" Text="Descripción" Font-Bold="True" Font-Size="Large"></asp:Label>
            <br />
            <br />
            <asp:DataList ID="dlDescripcion" runat="server">
                <ItemTemplate>
                    <asp:Label ID="Label100" runat="server" Font-Bold="True" Text=""></asp:Label>
                    &nbsp;<asp:Label ID="Label856" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="compra" runat="server">
            <div id="dropDown">
                <asp:DropDownList ID="ddlMedios" runat="server" CssClass="MediosdePago"></asp:DropDownList>
            </div>
            <div id="dataCompra">
            <asp:DataList ID="dlPrecio" runat="server" HorizontalAlign="Center" CssClass="DDLCompra">
                <ItemTemplate>
                    <asp:Label ID="Label857" runat="server" Font-Bold="True" Text=" Precio:"></asp:Label>
                    &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Comprar" CommandName="ClickComprar" OnCommand="Button1_Command" />
                </ItemTemplate>
            </asp:DataList>
            </div>
        </div>
</asp:Content>
