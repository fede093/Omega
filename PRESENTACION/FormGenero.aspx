﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormGenero.aspx.cs" Inherits="PRESENTACION.FormGenero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 26px;
        }

        .auto-style3 {
            height: 26px;
            width: 60px;
        }

        .auto-style4 {
            width: 60px;
        }

        .auto-style5 {
            margin-right: 4px;
        }

        .auto-style6 {
            height: 26px;
            width: 250px;
        }

        .auto-style7 {
            width: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Administrar Generos" Font-Size="X-Large" Font-Underline="True"></asp:Label>
    </div>
    <div class="Label">
        <asp:Label ID="Label4" runat="server" Text="Agregar Genero" Font-Bold="True"></asp:Label>
    </div>
    <div class="tabla">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Genero"></asp:Label>
                    :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtNombre" runat="server" Width="211px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="Red"  ValidationGroup="addValidation"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Height="29px" Width="139px" OnClick="btnAgregar_Click"  ValidationGroup="addValidation"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Label ID="lblExito" runat="server" ForeColor="#00CC00"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="Label">
        <asp:Label ID="Label3" runat="server" Text="Listado de Generos" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvGeneros" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" OnPageIndexChanging="gvGeneros_PageIndexChanging" OnRowCancelingEdit="gvGeneros_RowCancelingEdit" OnRowEditing="gvGeneros_RowEditing" PageSize="5" CssClass="auto-style5" OnRowDeleting="gvGeneros_RowDeleting" OnRowUpdating="gvGeneros_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Genero">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEdit_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Codigo de Genero">
                    <EditItemTemplate>
                        <asp:Label ID="lblEdit_Cod" runat="server" Text='<%# Bind("Cod_Genero") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_Codigo" runat="server" Text='<%# Bind("Cod_Genero") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
        </asp:GridView>
    </div>
</asp:Content>
