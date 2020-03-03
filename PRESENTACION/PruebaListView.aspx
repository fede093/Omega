<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PruebaListView.aspx.cs" Inherits="PRESENTACION.PruebaListView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="lvReview" runat="server" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <li style="">
                        <asp:Label ID="DetalleLabel" runat="server" Text='<%# Bind("Detalle") %>' />
                        <br />
                        <asp:Label ID="Fecha_reviewLabel" runat="server" Text='<%# Bind("Fecha_review", "{0:dd/MM/yyyy}") %>' />
                        <br />
                        <asp:Label ID="Cod_UsuarioLabel" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                        <br />
                    </li>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <li style="">Detalle:
                        <asp:TextBox ID="DetalleTextBox" runat="server" Text='<%# Bind("Detalle") %>' />
                        <br />
                        Fecha_review:
                        <asp:TextBox ID="Fecha_reviewTextBox" runat="server" Text='<%# Bind("Fecha_review") %>' />
                        <br />
                        Cod_Usuario:
                        <asp:TextBox ID="Cod_UsuarioTextBox" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    </li>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    No se han devuelto datos.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">Detalle:
                        <asp:TextBox ID="DetalleTextBox" runat="server" Text='<%# Bind("Detalle") %>' />
                        <br />Fecha_review:
                        <asp:TextBox ID="Fecha_reviewTextBox" runat="server" Text='<%# Bind("Fecha_review", "{0:dd/MM/yyyy}") %>' />
                        <br />Cod_Usuario:
                        <asp:TextBox ID="Cod_UsuarioTextBox" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    </li>
                </InsertItemTemplate>
                <ItemSeparatorTemplate>
<br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li style="">
                        <asp:Label ID="DetalleLabel" runat="server" Text='<%# Bind("Detalle") %>' />
                        <br />
                        <asp:Label ID="Fecha_reviewLabel" runat="server" Text='<%# Bind("Fecha_review") %>' />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                        <br />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <li style="">Detalle:
                        <asp:Label ID="DetalleLabel" runat="server" Text='<%# Eval("Detalle") %>' />
                        <br />
                        Fecha_review:
                        <asp:Label ID="Fecha_reviewLabel" runat="server" Text='<%# Eval("Fecha_review") %>' />
                        <br />
                        Cod_Usuario:
                        <asp:Label ID="Cod_UsuarioLabel" runat="server" Text='<%# Eval("Cod_Usuario") %>' />
                        <br />
                    </li>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Omega %>" SelectCommand="select Review.Detalle, Review.Fecha_review,  RevXJue.Cod_Usuario from Review inner join RevXJue on Review.Cod_review=RevXJue.Cod_Review"></asp:SqlDataSource>
    </form>
</body>
</html>
