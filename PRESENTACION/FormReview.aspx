﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admi.Master" AutoEventWireup="true" CodeBehind="FormReview.aspx.cs" Inherits="PRESENTACION.FormReview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div id="div_label">
        <asp:Label ID="Label2" runat="server" Text="Administrar Reviews" Font-Size="X-Large" Font-Underline="True"></asp:Label>
    </div>
    <div class="Label">
        <asp:Label ID="Label3" runat="server" Text="Listado de reviews" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="gvReviews" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="5" CssClass="auto-style5" OnPageIndexChanging="gvReviews_PageIndexChanging" style="margin-top: 0px" AutoGenerateEditButton="True" OnRowCancelingEdit="gvReviews_RowCancelingEdit" OnRowEditing="gvReviews_RowEditing" OnRowUpdating="gvReviews_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Codigo de review">
                    <ItemTemplate>
                        <asp:Label ID="lblCod" runat="server" Text='<%# Bind("Cod_Review") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Juego">
                    <ItemTemplate>
                        <asp:Label ID="lblJuego" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <ItemTemplate>
                        <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("Cod_Usuario") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Review">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDetalle_edit" runat="server" Height="100px" Text='<%# Bind("Detalle") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="100px" ReadOnly="True" Text='<%# Bind("Detalle") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha del review">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFecha_edit" runat="server" Text='<%# Bind("Fecha_review", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Fecha_review", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Red" />
            <PagerStyle BackColor="Red" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
