<%@ Page Title="" Language="C#" MasterPageFile="~/Visual.Master" AutoEventWireup="true" CodeBehind="reportes.aspx.cs" Inherits="PRESENTACION.reportes" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Omega - Reportes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="izquierda_superior">
            <asp:Chart ID="cReporte1" runat="server" BackColor="204, 204, 204" Width="450px">
                <Series>
                    <asp:Series Name="SerieUsuarios" ChartType="Pie" YValuesPerPoint="2" Legend="Legend1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="204, 204, 204"></asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend BackColor="41, 44, 51" DockedToChartArea="ChartArea1" ForeColor="204, 204, 204" Name="Legend1">
                    </asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Font="Microsoft Sans Serif, 12pt" ForeColor="41, 44, 51" Name="titulo" Text="Cantidad de usuarios por pais">
                    </asp:Title>
                </Titles>
            </asp:Chart>
        </div>
        <div id="derecha_superior"></div>
    </div>
</asp:Content>
