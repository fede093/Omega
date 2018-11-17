<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormUsuarios.aspx.cs" Inherits="PRESENTACION.FormUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            height: 24px;
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtApellido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtContra" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContra_repit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtContra" ControlToValidate="txtContra_repit" ErrorMessage="Contraseñas distintas" ForeColor="Red"></asp:CompareValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label12" runat="server" Text="Pais:"></asp:Label>
                    </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlPais" runat="server" Height="17px" Width="211px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlPais" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Height="29px" Width="139px"/>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="lblValidacion" runat="server"></asp:Label>
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
        <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" PageSize="5" CssClass="auto-style5">
            <Columns>
                <asp:TemplateField HeaderText="Usuario">
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                <asp:TemplateField HeaderText="Email"></asp:TemplateField>
                <asp:TemplateField HeaderText="Contraseña"></asp:TemplateField>
                <asp:TemplateField HeaderText="Telefono"></asp:TemplateField>
                <asp:TemplateField HeaderText="Pais"></asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
        </asp:GridView>
    </div>
</asp:Content>
