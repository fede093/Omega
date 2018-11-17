﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="PRESENTACION.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Omega</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenedor">
        <div id="izquierda">
            <asp:DataList ID="DataList1" runat="server"></asp:DataList>
        </div>
        <div id="derecha">
            <div  class="search">
                <asp:TextBox ID="TextBox1" runat="server" Width="50%" Height="36px" type="text" placeholder="Nombre del juego"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Buscar" Width="10%" CssClass="btn btn-default"/>
            </div>
            <asp:ListView ID="ListView1" runat="server"></asp:ListView>
        </div>
    </div>
</asp:Content>
