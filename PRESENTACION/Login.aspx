<%@ Page Title="" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PRESENTACION.login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-page">
        <div class="form">
            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Usuario Requerido" CssClass="rfv" ControlToValidate="txtNombre" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtContra" runat="server" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvContra" runat="server" ErrorMessage="Contraseña Requerida" CssClass="rfv" ControlToValidate="txtContra" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
            <p class="message">No estas registrado?
            <a href="Registro.aspx">Crear cuenta</a></p>
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
</asp:Content>
