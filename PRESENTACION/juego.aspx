<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="juego.aspx.cs" Inherits="PRESENTACION.juego" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_principal">
        <div id="imagen_juego">
            <asp:Image ID="Image1" runat="server" />
        </div>
        <div id="detalles_juego">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        </div>
        <div id="descripcion_juego">
            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        </div>
        <div id="compra">
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </div>
</asp:Content>
