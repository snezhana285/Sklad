﻿<%--flexberryautogenerated="true"--%>
<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="SkladE.aspx.cs" Inherits="Sneg.АСУ_Склад.СкладE" %>
<%@ Import namespace="NewPlatform.Flexberry.Web.Page" %>
<%-- Autogenerated section start [Register] --%>
<%-- Autogenerated section end [Register] --%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="<%= Constants.FormCssClass + " " +  Constants.EditFormCssClass %>">
        <h2 class="<%= Constants.FormHeaderCssClass + " " + Constants.EditFormHeaderCssClass %>">Склад</h2>
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
  <asp:Label CssClass="descLbl" ID="ctrlНазваниеLabel" runat="server" Text="Название" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlНазвание" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlНазваниеRequiredFieldValidator" runat="server" ControlToValidate="ctrlНазвание"
                            ErrorMessage="Не указано: Название" Text="*" 
                            EnableClientScript="true" ValidationGroup="savedoc" />

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlВместимостьLabel" runat="server" Text="Вместимость (в тоннах)" EnableViewState="False">
</asp:Label>
<ac:DecimalTextBox CssClass="descTxt" ID="ctrlВместимость" runat="server">
</ac:DecimalTextBox>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlВладелецСкладаLabel" runat="server" Text="ВладелецСклада" EnableViewState="False">
</asp:Label>
<ac:MasterEditorAjaxLookUp ID="ctrlВладелецСклада" CssClass="descTxt" runat="server" ShowInThickBox="True" Autocomplete="true" />

<asp:RequiredFieldValidator ID="ctrlВладелецСкладаRequiredFieldValidator" runat="server" ControlToValidate="ctrlВладелецСклада"
                            ErrorMessage="Не указано: ВладелецСклада" Text="*" 
                            EnableClientScript="true" ValidationGroup="savedoc" />

</div>


</div>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" LoadScriptsBeforeUI="true">
</asp:ScriptManager>

<fieldset ID="ctrl_fsВладелец_склада" style="clear: left">
	<legend>Владелец склада</legend>
	<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlВладелецСклада_ФамилияLabel" runat="server" Text="Фамилия" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlВладелецСклада_Фамилия" runat="server" ReadOnly="true">
</asp:TextBox>


</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlВладелецСклада_ИмяLabel" runat="server" Text="Имя" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlВладелецСклада_Имя" runat="server" ReadOnly="true">
</asp:TextBox>


</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlВладелецСклада_ОтчествоLabel" runat="server" Text="Отчество" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlВладелецСклада_Отчество" runat="server" ReadOnly="true">
</asp:TextBox>


</div>

</fieldset><fieldset ID="ctrl_fsТовар_на_складе" style="clear: left">
	<legend>Товар_на_складе</legend>
	<div style="clear: left">
	<ac:AjaxGroupEdit ID="ctrlТоварНаСкладе" runat="server" ReadOnly="false" />
</div>

</fieldset>
</div>
<!-- autogenerated end -->
            <%-- Autogenerated section end [Controls] --%>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderId="ContentPlaceHolder0">
    <script type="text/javascript">                        
        $(function () {
            $('#<%=ctrlНазвание.ClientID%>').on('change', function () {    
                var isNameWh = isNameWarehouse();                
                if (!isNameWh)
                    alert("Склад с таким названеим уже существует");                
            });
            function isNameWarehouse() {
                var nameWh = $('#<%=ctrlНазвание.ClientID%>').val();
                var isName = "";
                $.ajax({
                    type: "POST",
                    url: window.location.pathname + "/IsNameWarehouse",
                    datatype: "json",
                    contentType: "application/json; charset-utf-8",
                    data: JSON.stringify({ whName: nameWh }),
                    async: false,
                    success: function (data) {
                        isName = data.d
                    },
                    error: function (data) {
                        isName = "Ошибка при выполнении запроса";
                    }                    
                });
                return isName;
            }
        });
    </script>
</asp:Content>