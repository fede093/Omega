<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormJuegos.aspx.cs" Inherits="PRESENTACION.FormJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 24px;
            width: 269px;
        }

        .auto-style3 {
            height: 22px;
            width: 367px;
        }

        .auto-style5 {
            width: 97px;
        }

        .auto-style6 {
            height: 22px;
            width: 123px;
        }

        .auto-style7 {
            width: 123px;
        }

        .auto-style8 {
            height: 22px;
            width: 269px;
        }

        .auto-style9 {
            width: 269px;
        }

        .auto-style10 {
            height: 22px;
            width: 597px;
        }
        .auto-style11 {
            height: 41px;
            width: 367px;
        }
        .auto-style12 {
            height: 41px;
            width: 123px;
        }
        .auto-style13 {
            height: 41px;
            width: 269px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Administrar juegos" Font-Size="X-Large" Font-Underline="True"></asp:Label>
    </div>
    <div class="Label">
        <asp:Label ID="Label4" runat="server" Text="Agregar juegos" Font-Bold="True"></asp:Label>
    </div>
    <div class="tabla">
        <table class="auto-style10">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Nombre del juego"></asp:Label>
                    :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtNombre" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Text="Descripcion:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtDescripcion" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label6" runat="server" Text="Fecha de lanzamiento:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtFecha" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtFecha" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="revFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="(^(((0[1-9]|1[0-9]|2[0-8])[\/](0[1-9]|1[012]))|((29|30|31)[\/](0[13578]|1[02]))|((29|30)[\/](0[4,6,9]|11)))[\/](19|[2-9][0-9])\d\d$)|(^29[\/]02[\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)" Font-Size="Small" ValidationGroup="add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label7" runat="server" Text="Desarrollador:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtDesarrollador" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtDesarrollador" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label8" runat="server" Text="Distribuidor:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtDistribuidor" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txtDistribuidor" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label9" runat="server" Text="Genero:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddlGenero" runat="server" Height="24px" Width="211px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style13">
                    <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="ddlGenero" ErrorMessage="*" ForeColor="Red" ValidationGroup="add" InitialValue="---Nada selecionado---"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label10" runat="server" Text="Idioma:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtIdioma" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv7" runat="server" ControlToValidate="txtIdioma" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label11" runat="server" Text="Precio:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPrecio" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv8" runat="server" ControlToValidate="txtPrecio" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="revPrecio" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Formato incorrecto" Font-Size="Small" ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label12" runat="server" Text="Imagen:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:FileUpload ID="fileImagen" runat="server" Width="185px" />
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv9" runat="server" ControlToValidate="fileImagen" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label13" runat="server" Text="Clasificación:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtClasificacion" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv10" runat="server" ControlToValidate="txtClasificacion" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label14" runat="server" Text="Pagina oficial:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPagina" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv11" runat="server" ControlToValidate="txtPagina" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Height="29px" Width="139px" ValidationGroup="add" OnClick="btnAgregar_Click" />
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lblValidacion" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblExito" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
        </table>
        <br />
        <div>
            <asp:TextBox ID="txtBuscar" runat="server" Width="50%" Height="36px" type="text" placeholder="Nombre del juego"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="10%" CssClass="btn btn-default" Height="36px" style="margin-top: 0px"/>
            <%--<button runat="server" onServerClick="ButtonRefresh_Click">
                    <span class="glyphicon glyphicon-refresh"></span>
            </button>--%>
        </div>
    </div>
    <div class="Label">
        <br />
        <asp:Label ID="Label3" runat="server" Text="Listado de juegos" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvJuegos" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" PageSize="5" CssClass="auto-style5" OnPageIndexChanging="gvMedios_PageIndexChanging" OnRowEditing="gvJuegos_RowEditing" OnRowCancelingEdit="gvJuegos_RowCancelingEdit" OnRowUpdating="gvJuegos_RowUpdating" OnRowDeleting="gvJuegos_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="Codigo del juego">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditCod" runat="server" Text='<%# Bind("Id_juego") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCod" runat="server" Text='<%# Bind("Id_juego") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre_edit" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripcion">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescrip_edit" runat="server" Text='<%# Bind("Descripcion") %>' Height="52px" TextMode="MultiLine" Width="211px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de lanzamiento">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFecha_edit" runat="server" Text='<%# Bind("Fecha_Lanzamiento") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("Fecha_Lanzamiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Desarrollador">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDesarrollador_edit" runat="server" Text='<%# Bind("Desarrollador") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDesarrollador" runat="server" Text='<%# Bind("Desarrollador") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Distribuidor">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDestribuidor_edit" runat="server" Text='<%# Bind("Distribuidor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDistribuidor" runat="server" Text='<%# Bind("Distribuidor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Genero">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLGeneros" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreGenero" DataValueField="Cod_Genero">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGenero" runat="server" Text='<%# Bind("NombreGenero") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Idioma">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIdioma_edit" runat="server" Text='<%# Bind("Idioma") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblIdioma" runat="server" Text='<%# Bind("Idioma") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrecio_edit" runat="server" Text='<%# Bind("Precio") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a>$</a>
                        <asp:Label ID="lblPrecio" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ruta Imagen">
                    <EditItemTemplate>
                        <asp:Label ID="lblRutaEdit" runat="server" Text='<%# Bind("Imagen") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblRuta" runat="server" Text='<%# Bind("Imagen") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Imagen">
                    <EditItemTemplate>
                        <asp:FileUpload ID="fuImagen_Edit" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="img" runat="server" ImageUrl='<%# Bind("Imagen") %>' Width="100px" Height="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Clasificacion">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtClasificacion_edit" runat="server" Text='<%# Bind("Clasificacion") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblClasificacion" runat="server" Text='<%# Bind("Clasificacion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pagina oficial">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPagina_edit" runat="server" Text='<%# Bind("Pagina_Oficial") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPagina" runat="server" Text='<%# Bind("Pagina_oficial") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TablaGeneros %>" SelectCommand="SELECT [Cod_Genero], [NombreGenero] FROM Genero where Estado=1"></asp:SqlDataSource>
</asp:Content>
