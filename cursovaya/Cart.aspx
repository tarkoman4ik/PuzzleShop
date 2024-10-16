<%@ Page Title="Корзина" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" EnableEventValidation="false" Inherits="cursovaya.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    	<div style="display: flex;
				height:50px; 
				width: 100%; 
				background-color:lightgray; 
				align-items: center;
				justify-content: center;
				text-align: center;">
			<h2>
				Корзина
			</h2>
	</div>
    <div style="display:flex">
		<div style="width:300px; min-height:700px;margin:10px; align-items: center; display:flex; flex-direction: column;">
			<h3 >Покупка:</h3>
            <p>___________________________________</p>
            <h3 style="text-align:center">Общая стоимость покупки составляет:
            <%
                var db = new cursovaya.Database1Entities1();
                int sum = 0;
                foreach(var c in db.Cart)
                {
                    if (c.in_usercart == "incart")
                        sum += c.amount * c.Puzzle.cost;
                }
                Response.Write(String.Format(@"{0} рублей.", sum));
            %></h3>
            <p>___________________________________</p>
            <asp:Button ID="clear" runat="server" Text="Очистить корзину" Height="35px" Width="200px" OnClick="clear_Click" />
            <br />
            <h3 style="text-align:center">Форма для оформления заказа</h3>
            <input type="text" name="fname" style="width:720px; height:35px; margin: 5px" placeholder="Имя">
            <input type="text" name="lname" style="width:720px; height:35px; margin: 5px" placeholder="Фамилия">
            <input type="text" name="number" style="width:720px; height:35px; margin: 5px;" placeholder="Номер телефона">
            <input type="text" name="email" style="width:720px; height:35px; margin: 5px" placeholder="Почтовый адресс">
            <asp:Button ID="purchase" runat="server" Text="Совершить покупку" Height="35px" Width="200px" OnClick="purchase_Click" />
		</div>
		<div style="max-width:1066px;min-height:700px">
			<div style="display:flex;flex-wrap:wrap; font-family: sans-serif;font-size:14px;font-weight:bold">
				<%
                    int cnt = 0;
                    foreach (cursovaya.Cart cart in db.Cart)
                    {
                        cnt++;
						string zvezdi = "";
                        switch (cart.Puzzle.id_difficulty)
                        {
                            case 1:
                                zvezdi = "★☆☆☆☆☆";
                                break;
                            case 2:
                                zvezdi = "★★☆☆☆☆";
                                break;
                            case 3:
                                zvezdi = "★★★☆☆☆";
                                break;
                            case 4:
                                zvezdi = "★★★★☆☆";
                                break;
                            case 5:
                                zvezdi = "★★★★★☆";
                                break;
                            case 6:
                                zvezdi = "★★★★★★";
                                break;
                        }
                        int pzid = cart.id_puzzle;
                        if(cart.in_usercart=="incart")
						Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 450px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													   <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													   <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													   Количество: {4} </br>Цена за штуку: {3} рублей<br></br> <p><a style='margin:10px;padding:5px; border: 3px solid black; background-color:lightgray;color:black; text-decoration:none' href='\CartChanging?act=-1&id_puzl={0}'>-1</a><a style='margin:10px;padding:5px; border: 3px solid black; background-color:lightgray;color:black; text-decoration:none' href='\CartChanging?act=1&id_puzl={0}'>+1</a></p>
                                                       <a style='margin:10px;padding:5px; border: 3px solid black; background-color:coral;color:black; text-decoration:none' href='\CartChanging?act=0&id_puzl={0}'>Удалить все</a>
													   </span>", cart.Puzzle.id_puzzle, cart.Puzzle.name, zvezdi, cart.Puzzle.cost,cart.amount));
                    }
                    if (cnt == 0)
                        Response.Write(String.Format(@"<h2 style='margin-top:25px'>В корзине ничего нет.</h2>"));
				%>
			</div>
		</div>
	</div>
</asp:Content>
