<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="PRESENTACION.usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenedor">
        <div id="izquierda">
            <br />
            <asp:Label ID="Label1" runat="server" Text="Paises" Font-Size="Large"></asp:Label>
            <asp:DataList ID="dlPaises" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="lbPais" runat="server" CommandArgument='<%# Bind("Cod_Pais") %>' CommandName="comando" OnCommand="lbPais_Command" Text='<%# Bind("Nombre") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OmegaConnectionString %>" SelectCommand="SELECT [Usuario], [Nombre], [Email] FROM [Usuario]"></asp:SqlDataSource>
        </div>
        <div id="derecha">
            <div class="search">
                <asp:TextBox ID="txtBuscar" runat="server" Width="50%" Height="36px" type="text" placeholder="Usuario"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Buscar" Width="10%" CssClass="btn btn-default" OnClick="Button1_Click" />
                <button runat="server" onserverclick="ButtonRefresh_Click" class="btn btn-default">
                    <span class="glyphicon glyphicon-refresh"></span>
                </button>
            </div>
            <asp:ListView ID="lvUsuarios" runat="server" DataKeyNames="Usuario" GroupItemCount="3">
                <AlternatingItemTemplate>
                    <td runat="server" style="">
                        <asp:LinkButton ID="lb" runat="server" CommandArgument='<%# Bind("Usuario") %>' CommandName="LB" OnCommand="lb_Command" Text='<%# Bind("Usuario") %>'></asp:LinkButton>
                        <br />
                        Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Email:
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">Usuario:
                        <asp:Label ID="UsuarioLabel1" runat="server" Text='<%# Eval("Usuario") %>' />
                        <br />
                        Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
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
                    <td runat="server" style="">Usuario:
                        <asp:TextBox ID="UsuarioTextBox" runat="server" Text='<%# Bind("Usuario") %>' />
                        <br />
                        Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <asp:LinkButton ID="lb" runat="server" CommandArgument='<%# Bind("Usuario") %>' CommandName="LB" OnCommand="lb_Command" Text='<%# Bind("Usuario") %>'></asp:LinkButton>
                        <br />
                        Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Email:
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
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
                    <td runat="server" style="">Usuario:
                        <asp:Label ID="UsuarioLabel" runat="server" Text='<%# Eval("Usuario") %>' />
                        <br />
                        Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Email:
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
