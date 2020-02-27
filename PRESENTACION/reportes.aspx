<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="reportes.aspx.cs" Inherits="PRESENTACION.reportes" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Omega - Reportes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="izquierda_superior">
            <asp:Chart ID="cReporte1" runat="server" BackColor="204, 204, 204" Width="450px" DataSourceID="SqlDataSource1">
                <Series>
                    <asp:Series Name="SerieUsuarios" ChartType="Pie" YValuesPerPoint="2" Legend="Legend1" Font="Century Gothic, 8.25pt" XValueMember="Nombre1" YValueMembers="Cod_Pais1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="204, 204, 204"></asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend BackColor="41, 44, 51" DockedToChartArea="ChartArea1" ForeColor="204, 204, 204" Name="Legend1">
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Font="Century Gothic, 12pt" ForeColor="41, 44, 51" Name="titulo" Text="Cantidad de usuarios por pais">
                    </asp:Title>
                </Titles>
            </asp:Chart>
        </div>
        <div id="derecha_superior"></div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Omega %>" SelectCommand="select * from Usuario inner join Pais on Usuario.Cod_Pais=Pais.Cod_Pais"></asp:SqlDataSource>
    </div>
</asp:Content>
