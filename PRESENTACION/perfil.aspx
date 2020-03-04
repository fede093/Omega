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
    <div class="container">
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
                <asp:DataList ID="dlDetalles" runat="server" CssClass="auto-style2" OnItemCommand="dlDetalles_ItemCommand" OnItemDataBound="dlDetalles_ItemDataBound" Width="50%">
                    <EditItemTemplate>
                        Nombre:
                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="edit"></asp:RegularExpressionValidator>
                        <br />
                        Apellido:
                    <asp:TextBox ID="txtApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="*" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="edit"></asp:RegularExpressionValidator>
                        <br />
                        Telefono:
                    <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="edit"></asp:RegularExpressionValidator>
                        <br />
                        Email:
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <br />
                        Pais:
                    <asp:DropDownList ID="ddlContra" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Cod_Pais">
                    </asp:DropDownList>
                        <br />
                        Contraseña:
                    <asp:TextBox ID="txtContra" runat="server" Text='<%# Bind("Contraseña") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvContra" runat="server" ControlToValidate="txtContra" ErrorMessage="*" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Button ID="Button3" runat="server" CommandName="aceptar-edit" CssClass="btn btn-success" Text="Aceptar" ValidationGroup="edit" />
                        <asp:Button ID="Button2" runat="server" CommandName="cancelar-edit" CssClass="btn btn-danger" Text="Cancelar" />
                    </EditItemTemplate>
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
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Nombre1") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" CommandName="editar" CssClass="btn btn-default" Text="Editar datos" />
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div id="juegos_comprados">
                <asp:ListView ID="lvJuegosComprados" runat="server" GroupItemCount="4">
                    <AlternatingItemTemplate>
                        <td runat="server" style="">
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Bind("Id_juego") %>' CommandName="imageClick" CssClass="auto-style2" Height="300px" ImageUrl='<%# Bind("Imagen") %>' OnCommand="ImageButton1_Command" Width="200px" />
                            <br />

                            <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' CssClass="Label_Juegos" />
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

                            <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' CssClass="Label_Juegos" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Omega %>" SelectCommand="SELECT [Cod_Pais], [Nombre] FROM [Pais]"></asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
