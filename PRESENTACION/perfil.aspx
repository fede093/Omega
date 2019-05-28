<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="PRESENTACION.perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Omega - Perfil</title>
    <style type="text/css">
        .auto-style2 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_principal">
        <div id="usuario_icon">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/userlarge.png" />
        </div>
        <div id="numero_juegos">
            <asp:DataList ID="dlUsuario" runat="server" Height="50px">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Size="XX-Large" Text='<%# Bind("Usuario") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="detalles_usuarios">
            <asp:DataList ID="dlDetalles" runat="server" CssClass="auto-style2">
                <ItemTemplate>
                    Nombre:
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    <br />
                    Apellido:
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                    <br />
                    Telefono:
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    <br />
                    Email:
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    <br />
                    Pais:
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="juegos_comprados">
            <asp:ListView ID="lvComprados" runat="server" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="">
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Bind("Id_juego") %>' CommandName="Click" ImageUrl='<%# Bind("Imagen") %>' OnCommand="ImageButton2_Command" />
                        <br />
                        Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Usuario:
                        <asp:Label ID="Cod_UsuarioLabel" runat="server" Text='<%# Eval("Cod_Usuario") %>' />
                        <br />
                        Fecha de compra:
                        <asp:Label ID="fecha_compraLabel" runat="server" Text='<%# Eval("fecha_compra") %>' />
                        <br />
                        Medio de pago:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">Imagen:
                        <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen") %>' />
                        <br />
                        Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />
                        Cod_Usuario:
                        <asp:TextBox ID="Cod_UsuarioTextBox" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                        <br />
                        fecha_compra:
                        <asp:TextBox ID="fecha_compraTextBox" runat="server" Text='<%# Bind("fecha_compra") %>' />
                        <br />
                        Cod_MPago:
                        <asp:Label ID="Cod_MPagoLabel1" runat="server" Text='<%# Eval("Cod_MPago") %>' />
                        <br />
                        Descripcion:
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No se han devuelto datos.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">Imagen:
                        <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen") %>' />
                        <br />
                        Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />
                        Cod_Usuario:
                        <asp:TextBox ID="Cod_UsuarioTextBox" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                        <br />
                        fecha_compra:
                        <asp:TextBox ID="fecha_compraTextBox" runat="server" Text='<%# Bind("fecha_compra") %>' />
                        <br />
                        Descripcion:
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Bind("Id_juego") %>' ImageUrl='<%# Bind("Imagen") %>' CommandName="Click" OnCommand="ImageButton2_Command" />
                        <br />
                        Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Usuario:
                        <asp:Label ID="Cod_UsuarioLabel" runat="server" Text='<%# Eval("Cod_Usuario") %>' />
                        <br />
                        Fecha de compra:
                        <asp:Label ID="fecha_compraLabel" runat="server" Text='<%# Eval("fecha_compra") %>' />
                        <br />
                        Medio de pago:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                        <br />
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">Imagen:
                        <asp:Label ID="ImagenLabel" runat="server" Text='<%# Eval("Imagen") %>' />
                        <br />
                        Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Cod_Usuario:
                        <asp:Label ID="Cod_UsuarioLabel" runat="server" Text='<%# Eval("Cod_Usuario") %>' />
                        <br />
                        fecha_compra:
                        <asp:Label ID="fecha_compraLabel" runat="server" Text='<%# Eval("fecha_compra") %>' />
                        <br />
                        Cod_MPago:
                        <asp:Label ID="Cod_MPagoLabel" runat="server" Text='<%# Eval("Cod_MPago") %>' />
                        <br />
                        Descripcion:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OmegaConnectionString %>" SelectCommand="SELECT Juego.Imagen, Juego.Nombre, juegoXusuario.Cod_Usuario, DetallesCompra.fecha_compra, MedioPago.Cod_MPago, MedioPago.Descripcion FROM Juego INNER JOIN juegoXusuario ON Juego.Id_juego = juegoXusuario.Id_juego 
INNER JOIN DetallesCompra ON juegoXusuario.Cod_Compra = DetallesCompra.cod_compra INNER JOIN MedioPago ON DetallesCompra.cod_medio = MedioPago.Cod_MPago "></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
