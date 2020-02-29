<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormUsuarios.aspx.cs" Inherits="PRESENTACION.FormUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            height: 35px;
        }
        .auto-style3 {
            height: 24px;
            width: 132px;
        }
        .auto-style4 {
            width: 132px;
        }
        .auto-style5 {
            height: 24px;
            width: 134px;
        }
        .auto-style6 {
            width: 134px;
        }
        .auto-style7 {
            height: 24px;
            width: 135px;
        }
        .auto-style8 {
            width: 212px;
        }
        .auto-style9 {
            height: 24px;
            width: 212px;
        }
        .auto-style10 {
            height: 35px;
            width: 212px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Administrar usuario" Font-Size="X-Large" Font-Underline="True"></asp:Label>
    </div>
    <div class="Label">
        <asp:Label ID="Label4" runat="server" Text="Agregar usuarios" Font-Bold="True"></asp:Label>
    </div>
    <div class="tabla">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                    :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtUsuario" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Text="Nombre del usuario: "></asp:Label>
                    </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtNombre" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label7" runat="server" Text="Apellido del usuario: "></asp:Label>
                    </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtApellido" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtApellido" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label8" runat="server" Text="Email:"></asp:Label>
                    </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtEmail" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label9" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtContra" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txtContra" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label10" runat="server" Text="Repita contraseña:"></asp:Label>
                    </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtContra_repit" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txtContra_repit" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="cmv1" runat="server" ControlToCompare="txtContra" ControlToValidate="txtContra_repit" ErrorMessage="Contraseñas distintas" ForeColor="Red" ValidationGroup="add"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label11" runat="server" Text="Telefono:"></asp:Label>
                    </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtTelefono" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv7" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label12" runat="server" Text="Pais:"></asp:Label>
                    </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlPais" runat="server" Height="32px" Width="211px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="rfv8" runat="server" ControlToValidate="ddlPais" ErrorMessage="*" ForeColor="Red" ValidationGroup="add" InitialValue="---Nada selecionado---"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Administrador:</td>
                <td class="auto-style7">
                    <asp:RadioButtonList ID="rblAdmi" runat="server">
                        <asp:ListItem>True</asp:ListItem>
                        <asp:ListItem>False</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv9" runat="server" ControlToValidate="rblAdmi" ErrorMessage="*" ForeColor="Red" ValidationGroup="add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Height="29px" Width="139px" ValidationGroup="add" OnClick="btnAgregar_Click"/>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lblValidacion" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Label ID="lblExito" runat="server"></asp:Label>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="Label">
        <asp:Label ID="Label3" runat="server" Text="Listado Usuarios" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" PageSize="5" CssClass="auto-style5" OnPageIndexChanging="gvUsuarios_PageIndexChanging" OnRowCancelingEdit="gvUsuarios_RowCancelingEdit" OnRowDeleting="gvUsuarios_RowDeleting" OnRowEditing="gvUsuarios_RowEditing" OnRowUpdating="gvUsuarios_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Usuario">
                    <EditItemTemplate>
                        <asp:Label ID="lblUsuario_edit" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
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
                <asp:TemplateField HeaderText="Apellido">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtApellido_edit" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail_edit" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telefono">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTelefono_edit" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pais">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLPais" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Cod_Pais">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPais" runat="server" Text='<%# Bind("Nombre1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Administrador">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAdmi_edit" runat="server" Text='<%# Bind("Administrador") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAdmi" runat="server" Text='<%# Bind("Administrador") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Omega %>" SelectCommand="SELECT [Cod_Pais], [Nombre] FROM Pais where Estado=1"></asp:SqlDataSource>
    </div>
</asp:Content>
