﻿<%--flexberryautogenerated="true"--%>
<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="PostupleniyaE.aspx.cs" Inherits="Sneg.АСУ_Склад.ПоступленияE" %>
<%@ Import namespace="NewPlatform.Flexberry.Web.Page" %>
<%-- Autogenerated section start [Register] --%>
<%-- Autogenerated section end [Register] --%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="<%= Constants.FormCssClass + " " +  Constants.EditFormCssClass %>">
        <h2 class="<%= Constants.FormHeaderCssClass + " " + Constants.EditFormHeaderCssClass %>">Поступления</h2>
        <div class="<%= Constants.FormToolbarCssClass  + " " +  Constants.EditFormToolbarCssClass + " " + Constants.StickyCssClass %>">
            <asp:ImageButton ID="SaveBtn" runat="server" SkinID="SaveBtn" OnClick="SaveBtn_Click" AlternateText="<%$ Resources: Resource, Save %>" ValidationGroup="savedoc" />
            <asp:ImageButton ID="SaveAndCloseBtn" runat="server" SkinID="SaveAndCloseBtn" OnClick="SaveAndCloseBtn_Click" AlternateText="<%$ Resources: Resource, Save_Close %>" ValidationGroup="savedoc" />
            <asp:ImageButton ID="CancelBtn" runat="server" SkinID="CancelBtn" OnClick="CancelBtn_Click" AlternateText="<%$ Resources: Resource, Cancel %>" />
        </div>
        <div class="<%= Constants.FormControlsCssClass + " " + Constants.EditFormControlsCssClass %>">
            <%-- Autogenerated section start [Controls] --%>
<!-- autogenerated start -->
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="savedoc" />
<div>
	<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlАктуальноLabel" runat="server" Text="Актуально" EnableViewState="False">
</asp:Label>
<asp:CheckBox ID="ctrlАктуально" CssClass="descTxt" runat="server" Text=""/>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlДатаLabel" runat="server" Text="Дата" EnableViewState="False">
</asp:Label>
<div class="descTxt">
    <ac:DatePicker ID="ctrlДата" runat="server"/>
</div>
<ac:DatePickerValidator ID="ctrlДатаDatePickerValidator" runat="server" ControlToValidate="ctrlДата" 
                        ErrorMessage="Введена некорректная дата: Дата." Text="*" 
                        EnableClientScript="true" ValidationGroup="savedoc" CssClass="validator-datePicker" />
<%--<asp:CompareValidator ID="ctrlДатаCompareValidator" runat="server" ControlToValidate="ctrlДата" 
                      ErrorMessage="Дата не может быть меньше текущей" Text="*"   
                      EnableClientScript="true" ValidationGroup="savedoc" CssClass="validator-datePicker" />--%>
    
</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlКоличествоLabel" runat="server" Text="Количество (в тоннах)" EnableViewState="False">
</asp:Label>
<ac:DecimalTextBox CssClass="descTxt" ID="ctrlКоличество" runat="server">
</ac:DecimalTextBox>

<asp:RequiredFieldValidator ID="ctrlКоличествоRequiredFieldValidator1" runat="server" ControlToValidate="ctrlКоличество"
                            ErrorMessage="Не указано: Количество" Text="*" 
                            EnableClientScript="true" ValidationGroup="savedoc" />

<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlКоличествоОбщееLabel" runat="server" Text="Общее количество товара" EnableViewState="False">
</asp:Label>
<ac:DecimalTextBox CssClass="descTxt" ID="ctrlКоличествоОбщее" runat="server" ReadOnly="true">
</ac:DecimalTextBox>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlСкладLabel" runat="server" Text="Склад" EnableViewState="False">
</asp:Label>
<ac:MasterEditorAjaxLookUp ID="ctrlСклад" CssClass="descTxt" runat="server" ShowInThickBox="True" Autocomplete="true" />

<asp:RequiredFieldValidator ID="ctrlСкладRequiredFieldValidator" runat="server" ControlToValidate="ctrlСклад"
                            ErrorMessage="Не указано: Склад" Text="*" 
                            EnableClientScript="true" ValidationGroup="savedoc" />

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlТоварLabel" runat="server" Text="Товар" EnableViewState="False">
</asp:Label>
<ac:MasterEditorAjaxLookUp ID="ctrlТовар" CssClass="descTxt" runat="server" ShowInThickBox="True" Autocomplete="true" />

<asp:RequiredFieldValidator ID="ctrlТоварRequiredFieldValidator" runat="server" ControlToValidate="ctrlТовар"
                            ErrorMessage="Не указано: Товар" Text="*" 
                            EnableClientScript="true" ValidationGroup="savedoc" />

</div>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" LoadScriptsBeforeUI="true"></asp:ScriptManager>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlМашинаLabel" runat="server" Text="Машина" EnableViewState="False">
</asp:Label>
<ac:MasterEditorAjaxLookUp ID="ctrlМашина" CssClass="descTxt" runat="server" ShowInThickBox="True" Autocomplete="true" />

<asp:RequiredFieldValidator ID="ctrlМашинаRequiredFieldValidator" runat="server" ControlToValidate="ctrlМашина"
                            ErrorMessage="Не указано: Машина" Text="*" 
                            EnableClientScript="true" ValidationGroup="savedoc" />

</div>
<br/>

</div>
<!-- autogenerated end -->
            <%-- Autogenerated section end [Controls] --%>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderId="ContentPlaceHolder0">
    <script type="text/javascript">  
        $(function () {
            $('#<%=ctrlСклад.ClientID%>').on('change', function () {
                var sum = setSummary() + Number($('#<%=ctrlКоличество.ClientID%>').val());
                $('#<%=ctrlКоличествоОбщее.ClientID%>').val(sum);                
            });
            function setSummary() {
                var pk = $('#<%=ctrlСклад.ClientID%>').val();
                var sum = "";
                $.ajax({
                    type: "POST",
                    url: window.location.pathname + "/SetSummaryGoods",
                    datatype: "json",
                    contentType: "application/json; charset-utf-8",
                    data: JSON.stringify({ whPk: pk }),
                    async: false,
                    success: function (data) {
                        sum = data.d
                    },
                    error: function (data) {
                        sum = "Ошибка при выполнении запроса";
                    }
                });
                return sum;
            }
        

        
            $('#<%=ctrlКоличество.ClientID%>').on('change', function () {    
                var capacity = getCapacity();                
                var countGood = $('#<%=ctrlКоличество.ClientID%>').val();
                if (capacity < Number(countGood))
                    alert("Количество товара превышает грузопадъемность машины");       

                var sum = setSummary() + Number($('#<%=ctrlКоличество.ClientID%>').val());
                $('#<%=ctrlКоличествоОбщее.ClientID%>').val(sum);

            });
            function getCapacity() {
                var pk = $('#<%=ctrlМашина.ClientID%>').val();
                var cap = "";
                $.ajax({
                    type: "POST",
                    url: window.location.pathname + "/GetCapacity",
                    datatype: "json",
                    contentType: "application/json; charset-utf-8",
                    data: JSON.stringify({ carPk: pk }),
                    async: false,
                    success: function (data) {
                        cap = data.d
                    },
                    error: function (data) {
                        cap = "Ошибка при выполнении запроса";
                    }                    
                });
                return cap;
            }            
        });
    </script>
</asp:Content>
