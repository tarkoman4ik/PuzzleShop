<%@ Page Title="АдминПанель" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="cursovaya.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	 <div style="display: flex;
				height:60px; 
				width: 100%; 
				background-color:lightgray; 
				align-items: center;
				justify-content: center;
				text-align: center;">
			<h2>
				Панель Администратора
			</h2>
	</div>
	<div style="font-size:14px;min-height:600px;display:flex;flex-direction:column;align-content:center;align-items:center">
		<%Response.Write(String.Format(@"<h4>Изменение: {0}</h4>",change)); %>
		<h3>Таблица всех головоломок</h3>
		<h4>id_puzzle | Name | Description | difficulty | CompanyName | amount | cost | Type</h4>
		<div style="font-size:16px">
		<%
            var db = new cursovaya.Database1Entities1();
			foreach(var p in db.Puzzle)
            {
				Response.Write(String.Format(@"<p>{0} | {1} | {2} | {3} | {4} | {5} | {6} | {7}</p> ",p.id_puzzle,p.name,p.description,p.id_difficulty,p.Company_List.name,p.amount,p.cost,p.Types.type));
            }
		%>
		</div>
		<div style="display:flex;flex-direction:row">
			<div style="display:flex;flex-direction:column;margin:10px">
				<h3 style="text-align:center">Добавление головоломок</h3>
				<input type="text" name="Insname" placeholder="Введите название" Height="30px" Width="320px"/>
				<input type="text" name="Insdesc" placeholder="Введите описание" Height="30px" Width="320px"/>
				<input type="text" name="Insdiff"  placeholder="Введите сложность" Height="30px" Width="320px"/>
				<input type="text" name="Inscomp" placeholder="Введите компанию" Height="30px" Width="320px"/>
				<input type="text" name="Insamount"  placeholder="Введите кол-во" Height="30px" Width="320px"/>
				<input type="text" name="Inscost" placeholder="Введите цену" Height="30px" Width="320px"/>
				<input type="text" name="Instype" placeholder="Введите тип" Height="30px" Width="320px"/>
				<asp:Button ID="InsertBtn" runat="server" Text="Добавить" OnClick="InsertBtn_Click" Height="30px"/>
			</div>
			<div style="display:flex;flex-direction:column;margin:10px">
				<h3 style="text-align:center">Обновление головоломок</h3>
				<input type="text" name="Updid" placeholder="Введите id" Height="30px" Width="320px"/>
				<input type="text" name="Updname" placeholder="Введите название" Height="30px" Width="320px"/>
				<input type="text" name="Upddesc" placeholder="Введите описание" Height="30px" Width="320px"/>
				<input type="text" name="Upddiff" placeholder="Введите сложность" Height="30px" Width="320px"/>
				<input type="text" name="Updcomp" placeholder="Введите компанию" Height="30px" Width="320px"/>
				<input type="text" name="Updamount" placeholder="Введите кол-во" Height="30px" Width="320px"/>
				<input type="text" name="Updcost" placeholder="Введите цену" Height="30px" Width="320px"/>
				<input type="text" name="Updtype" placeholder="Введите тип" Height="30px" Width="320px"/>
				<asp:Button ID="UpdateBtn" runat="server" Text="Обновить" OnClick="UpdateBtn_Click" Height="30px"/>
			</div>
			<div style="display:flex;flex-direction:column;margin:10px">
				<h3 style="text-align:center">Удаление головоломок</h3>
				<input name="delet" type="text" placeholder="Введите id" Height="30px" Width="320px" />
				<asp:Button ID="DeleteBtn" runat="server" Text="Удалить" OnClick="DeleteBtn_Click" Height="30px"/>
			</div>
		</div>
		<div style="font-size:14px; display:flex; flex-direction:row" >
			<div>
			<h4>Таблица компаний</h4>
			<%
				foreach(var c in db.Company_List)
				{
					Response.Write(String.Format(@"<p>id_company = {0} | name = {1}</p>",c.id_company,c.name));
				}
			%>
			</div>
			<div>
			<h4>Таблица типов</h4>
			<%
				foreach(var t in db.Types)
				{
					Response.Write(String.Format(@"<p>id_type = {0} | type = {1}</p>",t.id_type,t.type));
				}
			%>
			</div>
		</div>
	</div>
</asp:Content>
