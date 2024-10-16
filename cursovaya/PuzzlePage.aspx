<%@ Page Title="Покупки" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="PuzzlePage.aspx.cs" Inherits="cursovaya.PuzzlePage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: flex;
				height:50px; 
				width: 100%; 
				background-color:lightgray; 
				align-items: center;
				justify-content: center;
				text-align: center;">
    	<h2>Описание головоломки</h2>
	</div>
	<div style="display: inline-flex;justify-content: flex-start; width:100%; align-items:center; flex-direction: column;padding: 25px;font-size:18px;">
		<%
			var db = new cursovaya.Database1Entities1();
			foreach(cursovaya.Puzzle x in db.Puzzle )
				if (x.id_puzzle == Int32.Parse(request_puzzle)) {
					string str="Нет в наличии";
					if (x.amount>0)
						str = "В наличии";
					Response.Write(String.Format(@"<h2>{0}</h2><img src='Images\puzzle_id{1}.png' alt='puzzlepicture' width='400px' height='400px'>Описание: <p style='text-align:center'>{2}</p><br>Стоимость: {4} рублей.</br><p style='text-align:center'>Товар: {3}</p><a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={1}'>Добавить в корзину</a>",x.name,x.id_puzzle,x.description,str,x.cost));
					}
		%>
	</div>
</asp:Content>
