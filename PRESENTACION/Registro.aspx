﻿<%@ Page Title="" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="PRESENTACION.registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-page">
        <div class="form">
            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Usuario Requerido" CssClass="rfv" ControlToValidate="txtUsuario" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Nombre Requerido" CssClass="rfv" ControlToValidate="txtNombre" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="Apellido Requerido" CssClass="rfv" ControlToValidate="txtApellido" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtContra" runat="server" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="Contraseña Requerida" CssClass="rfv" ControlToValidate="txtContra" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="E-Mail"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv5" runat="server" ErrorMessage="Email Requerido" CssClass="rfv" ControlToValidate="txtEmail" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtTelefono" runat="server" placeholder="Telefono"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rvf6" runat="server" ErrorMessage="Telefono Requerido" CssClass="rfv" ControlToValidate="txtTelefono" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddlPais" runat="server" CssClass="ddl">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfv7" runat="server" ErrorMessage="Pais Requerido" CssClass="rfv" ControlToValidate="ddlPais" Font-Size="12px" ForeColor="#CC0000" InitialValue=" "></asp:RequiredFieldValidator>
            <asp:Button ID="btnCrear" runat="server" Text="Crear Cuenta" OnClick="btnCrear_Click" />
            <p class="message">Ya registrado? <a href="Login.aspx">Ingresar</a></p>
            <br />
            <asp:Label ID="lblError" runat="server" Font-Size="16px" ForeColor="Red"></asp:Label>
        </div>
    </div>
</asp:Content>
