﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormPais.aspx.cs" Inherits="PRESENTACION.FormPais" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 61px;
        }

        .auto-style3 {
            width: 251px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Administrar Paises" Font-Size="X-Large" Font-Italic="False" Font-Overline="False" Font-Underline="True"></asp:Label>
    </div>
    <div class="Label">
        <asp:Label ID="Label1" runat="server" Text="Agregar Pais" Font-Bold="True"></asp:Label>
    </div>
    <div class="tabla">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Pais:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPais" runat="server" Height="24px" Width="211px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Campo Obligatorio" ForeColor="Red" ControlToValidate="txtPais" ValidationGroup="addValidation"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPais" runat="server" ControlToValidate="txtPais" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="addValidation"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnAgregar" runat="server" Height="29px" Text="Agregar" Width="139px" ValidationGroup="addValidation" OnClick="btnAgregar_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblExito" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="Label">
        <asp:Label ID="Label4" runat="server" Text="Listado Paises" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvPaises" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AllowPaging="True" OnPageIndexChanging="gvPaises_PageIndexChanging" OnRowCancelingEdit="gvPaises_RowCancelingEdit" OnRowEditing="gvPaises_RowEditing" PageSize="5" OnRowUpdating="gvPaises_RowUpdating" OnRowDeleting="gvPaises_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="Pais">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPais_edit" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Codigo del pais">
                    <EditItemTemplate>
                        <asp:Label ID="lblCod_edit" runat="server" Text='<%# Bind("Cod_Pais") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCod" runat="server" Text='<%# Bind("Cod_Pais") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
