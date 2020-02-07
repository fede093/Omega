<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="PRESENTACION.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Omega</title>
    <style type="text/css">
        .auto-style2 {
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenedor">
        <div id="izquierda">
            <br />
            <asp:Label ID="Label1" runat="server" Text="Generos" Font-Size="Large"></asp:Label>
            <br />
            <asp:DataList ID="dlGeneros" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="lbGeneros" runat="server" CommandArgument='<%# Bind("Cod_Genero") %>' CommandName="comando" OnCommand="lbGeneros_Command" Text='<%# Bind("NombreGenero") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="derecha">
            <div  class="search">
                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtBuscar" ValidationGroup="add"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtBuscar" runat="server" Width="50%" Height="36px" type="text" placeholder="Nombre del juego"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Buscar" Width="10%" CssClass="btn btn-default" OnClick="Button1_Click" ValidationGroup="add"/>
                <button runat="server" onServerClick="ButtonRefresh_Click" class="btn btn-default">
                    <span class="glyphicon glyphicon-refresh"></span>
                </button>
            </div>
            <asp:ListView ID="lvJuegos" runat="server" GroupItemCount="4">
                <AlternatingItemTemplate>
                    <td runat="server" style="">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Bind("Id_juego") %>' CommandName="imageClick" CssClass="auto-style2" Height="300px" ImageUrl='<%# Bind("Imagen") %>' OnCommand="ImageButton1_Command" Width="200px" />
                        <br />
                        
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' CssClass="Label_Juegos"/>
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />
                        Imagen:
                        <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen") %>' />
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
                    <td runat="server" style="">Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />
                        Imagen:
                        <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Bind("Id_juego") %>' CommandName="imageClick" Height="300px" ImageUrl='<%# Bind("Imagen") %>' OnCommand="ImageButton1_Command" Width="200px" />
                        <br />
                        
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' CssClass="Label_Juegos" />
                        <br />
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Imagen:
                        <asp:Label ID="ImagenLabel" runat="server" Text='<%# Eval("Imagen") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Omega %>" SelectCommand="SELECT [Nombre], [Imagen] FROM [Juego]"></asp:SqlDataSource>
    </div>
</asp:Content>
