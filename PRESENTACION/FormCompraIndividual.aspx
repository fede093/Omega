<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormCompraIndividual.aspx.cs" Inherits="PRESENTACION.FormCompraIndividual" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Compra individual" Font-Size="X-Large" Font-Underline="True"></asp:Label>
    </div>
        <div class="Label">
        <asp:Label ID="Label3" runat="server" Text="Listado de compra" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvCompraIndividual" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="5" CssClass="auto-style5" style="margin-right: 2px">
            <Columns>
                <asp:TemplateField HeaderText="Codigo de compra">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cod_Compra") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Juego">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cod_Usuario") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
