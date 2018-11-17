<%@ Page Title="" Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="PRESENTACION.registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-page">
        <div class="form">
                <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ErrorMessage="Usuario Requerido" CssClass="rfv" ControlToValidate="txtUsuario" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Nombre Requerido" CssClass="rfv" ControlToValidate="txtNombre" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ErrorMessage="Apellido Requerido" CssClass="rfv" ControlToValidate="txtApellido" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtContra" runat="server" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContra" runat="server" ErrorMessage="Contraseña Requerida" CssClass="rfv" ControlToValidate="txtContra" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="E-Mail"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Requerido" CssClass="rfv" ControlToValidate="txtEmail" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTelefono" runat="server" placeholder="Telefono"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvfTelefono" runat="server" ErrorMessage="Telefono Requerido" CssClass="rfv" ControlToValidate="txtTelefono" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlPais" runat="server" CssClass="ddl">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvPais" runat="server" ErrorMessage="Pais Requerido" CssClass="rfv" ControlToValidate="ddlPais" Font-Size="12px" ForeColor="#CC0000"></asp:RequiredFieldValidator>                
                <asp:Button ID="btnCrear" runat="server" Text="Crear Cuenta" />                
                <p class="message">Ya registrado? <a href="Login.aspx">Ingresar</a></p>
        </div>
    </div>
</asp:Content>
