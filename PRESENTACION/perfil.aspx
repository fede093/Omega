<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="PRESENTACION.perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Omega - Perfil</title>
    <style type="text/css">
        .auto-style2 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_principal">
        <div id="usuario_icon">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/userlarge.png" />
        </div>
        <div id="numero_juegos">
            <asp:DataList ID="dlUsuario" runat="server" Height="50px">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Size="XX-Large" Text='<%# Bind("Usuario") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="detalles_usuarios">
            <asp:DataList ID="dlDetalles" runat="server" CssClass="auto-style2">
                <ItemTemplate>
                    Nombre:
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    <br />
                    Apellido:
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                    <br />
                    Telefono:
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    <br />
                    Email:
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    <br />
                    Pais:
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("NombrePais") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="juegos_comprados">
        </div>
    </div>
</asp:Content>
