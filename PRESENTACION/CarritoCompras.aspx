<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="PRESENTACION.CarritoCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_principal">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Carrito de compras"></asp:Label>
            <br />
            <asp:GridView ID="gvCarrito" runat="server">
                <Columns>
                    <asp:CommandField SelectText="Eliminar" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Seleione un medio de pago: "></asp:Label>
            <asp:DropDownList ID="ddlMedios" runat="server"></asp:DropDownList>
            <br />
            <asp:Button ID="btnAceptar" runat="server" Text="Comprar" OnClick="btnAceptar_Click" />            
            <br />
            <br />
            <asp:LinkButton ID="lbSeguirComprando" href="inicio.aspx" runat="server">Seguir comprando</asp:LinkButton>
        </div>
    </div>
</asp:Content>
