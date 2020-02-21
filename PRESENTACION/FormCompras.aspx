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
        <asp:GridView ID="gvCompras" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="5" CssClass="auto-style5" style="margin-right: 2px">
            <Columns>
                <asp:TemplateField HeaderText="Codigo de compra">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("cod_compra") %>' CommandName="cod_compra" OnCommand="LinkButton1_Command" Text='<%# Bind("cod_compra") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Medio de pago">
                    <ItemTemplate>
                        <asp:Label ID="lblMedio" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de compra">
                    <ItemTemplate>
                        <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("fecha_compra", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad de juegos comprados">
                    <ItemTemplate>
                        <asp:Label ID="label4" runat="server" Text='<%# Bind("Numero_juegos") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
