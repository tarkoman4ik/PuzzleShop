<%@ Page Title="Покупки" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Purchases.aspx.cs" Inherits="cursovaya.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%var db = new cursovaya.Database1Entities1(); %>
    <div style="display: flex;
				height:50px; 
				width: 100%; 
				background-color:lightgray; 
				align-items: center;
				justify-content: center;
				text-align: center;
				">
			<h2>
				Покупки
			</h2>
	</div>
	<div style="font-size:16px;min-height:600px">
	<%
        int cnt = 0;
        foreach (var p in db.Purchase)
        {
            Response.Write(String.Format(@"<h4 style='font-weight:bold'>Покупка №{0} Дата: {1}<ul style='margin-top:10px;margin-bottom:10px'></h4>", p.id_purchase, p.date_purchase));
            int sum = 0;
            foreach(var c in db.Cart)
            {
                if (c.id_purchase == p.id_purchase)
                {
                    Response.Write(String.Format(@"<li>{0}........{1}x{2}руб.={3}руб.</li>", c.Puzzle.name, c.amount, c.Puzzle.cost, c.amount * c.Puzzle.cost));
                    sum += c.amount * c.Puzzle.cost;
                }
            }
            Response.Write(String.Format(@"Итого: {0}руб.", sum));
            cnt++;
            Response.Write(String.Format("<h4 style='text-decoration:underline'>Покупатель: {0} {1}</h4></ul>",p.lastName,p.firstName));
        }
        if (cnt == 0)
            Response.Write(String.Format(@"<h3 style='text-align:center;'>Пока покупок не совершалось.</h3>"));
	%>
	</div>
</asp:Content>
