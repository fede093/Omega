﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormMedio.aspx.cs" Inherits="PRESENTACION.FormMedio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Administrar medios de pago" Font-Size="X-Large" Font-Underline="True"></asp:Label>
    </div>
    <div class="Label">
        <asp:Label ID="Label4" runat="server" Text="Agregar medios de pago" Font-Bold="True"></asp:Label>
    </div>
    <div class="tabla">
        <table class="auto-style1">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="Medio de pago"></asp:Label>
                    :</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtNombre" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="Red" ValidationGroup="addValidation"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revMedio" runat="server" ControlToValidate="txtNombre" ErrorMessage="Formato incorrecto" ForeColor="Red" ValidationExpression="^[A-Za-z ]+$" ValidationGroup="addValidation"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Height="29px" Width="139px" OnClick="btnAgregar_Click" ValidationGroup="addValidation"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Label ID="lblExito" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="Label">
        <asp:Label ID="Label3" runat="server" Text="Listado de medio de pagos" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvMedios" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" PageSize="5" CssClass="auto-style5" OnPageIndexChanging="gvMedios_PageIndexChanging" OnRowCancelingEdit="gvMedios_RowCancelingEdit" OnRowDeleting="gvMedios_RowDeleting" OnRowEditing="gvMedios_RowEditing" OnRowUpdating="gvMedios_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Descripción">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescripcion_edit" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Codigo de medio">
                    <EditItemTemplate>
                        <asp:Label ID="lblCod_edit" runat="server" Text='<%# Bind("Cod_MPago") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("Cod_MPago") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
