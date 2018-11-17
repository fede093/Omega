<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormCompras.aspx.cs" Inherits="PRESENTACION.FormCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Administrar Compras" Font-Size="X-Large" Font-Underline="True"></asp:Label>
    </div>
        <div class="Label">
        <asp:Label ID="Label3" runat="server" Text="Listado de compras" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvCompras" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" PageSize="5" CssClass="auto-style5">
            <Columns>
                <asp:TemplateField HeaderText="Codigo de compra">
                    <ItemTemplate>
                        <asp:Label ID="lblCodCompra" runat="server" Text='<%# Bind("cod_compra") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Medio de pago">
                    <ItemTemplate>
                        <asp:Label ID="lblMedio" runat="server" Text='<%# Bind("cod_medio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de compra">
                    <ItemTemplate>
                        <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("fecha_compra", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Juego">
                    <ItemTemplate>
                        <asp:Label ID="lblJuego" runat="server" Text='<%# Bind("Id_Juego") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <ItemTemplate>
                        <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("Cod_Usuario") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
        </asp:GridView>
    </div>
</asp:Content>
