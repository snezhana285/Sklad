<%@ Page AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ICSSoft.STORMNET.Web.Default" Language="C#" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1><asp:Localize Text="<%$ Resources: Resource, Home_Page %>" runat="server"></asp:Localize></h1><br />
    </div>
    <div ID="defConteiner">
        <div id="defBlockLine">
        <div id="defBlock">
            <div id="defLine">
                <img src="./Images/personBig.png" />
            </div>
            <div id="defLine">
                <h2>Личности</h2>
            </div>
            <div id="defMenu">
                <ul>
                    <li><a href="./forms/Lichnost/LichnostE.aspx">Добавить</a></li>
                    <li><a href="./forms/Lichnost/LichnostL.aspx">Посмотреть список</a></li>
                </ul>
            </div>
        </div>
        <div id="defBlock">
            <div id="defLine">
                <img src="./Images/carBig.png" />
            </div>
            <div id="defLine">
                <h2>Машины</h2>
            </div>
            <div id="defMenu">
                <ul>
                    <li><a href="./forms/Mashina/MashinaE.aspx">Добавить</a></li>
                    <li><a href="./forms/Mashina/MashinaL.aspx">Посмотреть список</a></li>
                </ul>
            </div>
        </div>                
        <div id="defBlock">
            <div id="defLine">
                <img src="./Images/goodBig.png" />
            </div>
            <div id="defLine">
                <h2>Товар</h2>
            </div>
            <div id="defMenu">
                <ul>
                    <li><a href="./forms/Tovar/TovarE.aspx">Добавить</a></li>
                    <li><a href="./forms/Tovar/TovarL.aspx">Посмотреть список</a></li>
                </ul>
            </div>
        </div>
        </div>

        <div id="defBlockLine">
        <div id="defBlock">
            <div id="defLine">
                <img src="./Images/warehouseBig.png" />
            </div>
            <div id="defLine">
                <h2>Склад</h2>
            </div>
            <div id="defMenu">
                <ul>
                    <li><a href="./forms/Sklad/SkladE.aspx">Добавить</a></li>
                    <li><a href="./forms/Sklad/SkladL.aspx">Посмотреть список</a></li>
                </ul>
            </div>
        </div>
        <div id="defBlock">
            <div id="defLine">
                <img src="./Images/supplyBig.png" />
            </div>
            <div id="defLine">
                <h2>Поступления</h2>
            </div>
            <div id="defMenu">
                <ul>
                    <li><a href="./forms/Postuplenya/PostuplenyaE.aspx">Добавить</a></li>
                    <li><a href="./forms/Postuplenya/PostuplenyaL.aspx">Посмотреть список</a></li>
                </ul>
            </div>
        </div>                
        <div id="defBlock">
            <div id="defLine">
                <img src="./Images/requestBig.png" />
            </div>
            <div id="defLine">
                <h2>Запрос</h2>
            </div>
            <div id="defMenu">
                <ul>
                    <li><a href="./forms/Zapros.aspx">Посмотреть</a></li>  
                    <li id="invis"><a href="./forms/Zapros.aspx">Посмотреть</a></li>
                </ul>
            </div>
        </div>
        </div>
    </div>
</asp:Content>