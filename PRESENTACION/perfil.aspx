<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="PRESENTACION.perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Omega - Perfil</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_principal">
        <div id="usuario_icon">
            <asp:Image ID="Image1" runat="server" />
        </div>
        <div id="numero_juegos">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <div id="detalles_usuarios">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </div>
        <div id="juegos_comprados">
            <asp:ListView ID="ListView1" runat="server"></asp:ListView>
        </div>
    </div>
</asp:Content>
