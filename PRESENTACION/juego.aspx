<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="juego.aspx.cs" Inherits="PRESENTACION.juego" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_principal">
        <div id="imagen_juego">
            <asp:DataList ID="dlImagen" runat="server" Height="300px" Width="200px" HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Imagen") %>' Height="300px" Width="200px" />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="detalles_juego">
            <asp:DataList ID="dlDetalles" runat="server" Font-Bold="False">
                <ItemTemplate>
                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Nombre:"></asp:Label>
                    &nbsp;<asp:Label ID="Label8" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Fecha de lanzamiento:"></asp:Label>
                    &nbsp;<asp:Label ID="Label9" runat="server" Text='<%# Bind("Fecha_Lanzamiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Desarrollador:"></asp:Label>
                    &nbsp;<asp:Label ID="Label10" runat="server" Text='<%# Bind("Desarrollador") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Distribuidor:"></asp:Label>
                    &nbsp;<asp:Label ID="Label11" runat="server" Text='<%# Bind("Distribuidor") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Genero:"></asp:Label>
                    &nbsp;<asp:Label ID="Label12" runat="server" Text='<%# Bind("NombreGenero") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Idioma:"></asp:Label>
                    &nbsp;<asp:Label ID="Label13" runat="server" Text='<%# Bind("Idioma") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label23" runat="server" Font-Bold="True" Text="Precio:"></asp:Label>
                    &nbsp;$<asp:Label ID="Label14" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Clasificación:"></asp:Label>
                    &nbsp;<asp:Label ID="Label15" runat="server" Text='<%# Bind("Clasificacion") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Pagina oficial:"></asp:Label>
                    &nbsp;<asp:Label ID="Label16" runat="server" Text='<%# Bind("Pagina_oficial") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="descripcion_juego">
            <asp:Label ID="Label2" runat="server" Text="Descripción" Font-Bold="True" Font-Size="Large"></asp:Label>
            <br />
            <br />
            <asp:DataList ID="dlDescripcion" runat="server">
                <ItemTemplate>
                    <asp:Label ID="Label856" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>

            <div id="controles_compra" runat="server" class="panel panel-default">
                <div id="compra">
                    <asp:Button ID="btnAgregarCarrito" runat="server" Text="Agregar al carrito" CssClass="btn btn-success" OnClick="btnAgregarCarrito_Click" />
                    <asp:Label ID="lblEstado" runat="server"></asp:Label>
                </div>
            </div>
        

        <div id="controles-review">
            <div id="EscribirReview" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Escribir review" Font-Size="Large"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine" Width="800px" Height="150px"></asp:TextBox>
                <br />
                <asp:Button ID="btnPublicar" runat="server" Text="Publicar review" OnClick="btnPublicar_Click" CssClass="btn btn-success" />
                <asp:Label ID="lblEstadoReview" runat="server"></asp:Label>
            </div>
            <br />
            <div id="lista-review">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#collapse1">Reviews</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <asp:ListView ID="lvReview" runat="server">
                                <AlternatingItemTemplate>
                                    <li style="">
                                        <b>Review publicado por:</b>
                                        <asp:Label ID="Cod_UsuarioLabel" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                                        <br />
                                        <u>Review</u>:                                        
                                        <asp:Label ID="DetalleLabel" runat="server" Text='<%# Bind("Detalle") %>' />
                                        <br />
                                        <br />
                                        Fecha del review:
                                        <asp:Label ID="Fecha_reviewLabel" runat="server" Text='<%# Bind("Fecha_review", "{0:dd/MM/yyyy}") %>' />                                                                                
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
                                        <br />
                                        Fecha_review:
                        <asp:TextBox ID="Fecha_reviewTextBox" runat="server" Text='<%# Bind("Fecha_review", "{0:dd/MM/yyyy}") %>' />
                                        <br />
                                        Cod_Usuario:
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
                                        <b>Review publicado por:</b>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cod_Usuario") %>' />
                                        <br />
                                        <u>Review</u>:
                                        <asp:Label ID="DetalleLabel" runat="server" Text='<%# Bind("Detalle") %>' />
                                        <br />
                                        <br />
                                        Fecha del review:
                                        <asp:Label ID="Fecha_reviewLabel" runat="server" Text='<%# Bind("Fecha_review", "{0:dd/MM/yyyy}") %>' />
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
                    </div>

                </div>
            </div>            
        </div>
    </div>
</asp:Content>
