<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="PRESENTACION.CarritoCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="div_principal">
            <div>
                <asp:Label ID="Label2" runat="server" Text="Carrito de compras"></asp:Label>
                <br />
                <asp:GridView ID="gvCarrito" runat="server" OnRowCommand="gvCarrito_RowCommand">
                    <Columns>
                        <asp:CommandField SelectText="Eliminar" ShowSelectButton="True" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Precio total de la compra: "></asp:Label>
                <b>$<asp:Label ID="lblTotal" runat="server" Font-Bold="True"></asp:Label>
                </b>
                &nbsp;
            <asp:Label ID="lblEstado" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Seleione un medio de pago: "></asp:Label>
                <asp:DropDownList ID="ddlMedios" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvMedio" runat="server" ErrorMessage="Selecione medio de pago" ControlToValidate="ddlMedios" ForeColor="Red" InitialValue="---Nada selecionado---" ValidationGroup="medio"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnEjecutarCompra" runat="server" Text="Comprar" OnClick="btnEjecutarCompra_Click" ValidationGroup="medio" />
                <br />
                <br />
                <asp:LinkButton ID="lbSeguirComprando" href="inicio.aspx" runat="server">Seguir comprando</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
