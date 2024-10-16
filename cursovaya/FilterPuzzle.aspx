<%@ Page Title="Интернет-магазин PuzzleStore" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="FilterPuzzle.aspx.cs" Inherits="cursovaya.FilterPuzzle" %>

<asp:Content ID="BodyContent"  ContentPlaceHolderID="MainContent" runat="server">
    <%
        var db = new cursovaya.Database1Entities1();
    %>
	<div style="display: flex;
				height:50px; 
				width: 100%; 
				background-color:lightgray; 
				align-items: center;
				justify-content: center;
				text-align: center;">
    	<form style="display:block" method="POST" action=>
			<input type="text" name="SearchBox" style="width:720px; height:35px" placeholder="Что найти?">
            <asp:Button ID="search" runat="server" Text="Найти" Height="35px" OnClick="ButtonClicked" />
		</form>
	</div>
	<div style="display:flex">
		<div style="width:300px; min-height:700px;margin:10px">
			<h3 >Типы головоломок:</h3>
            <ul style="list-style-type: none">
                <%
                    foreach(cursovaya.Types x in db.Types)
                    {
                        Response.Write(String.Format(@"<li style='color: gray'><a href='\FilterPuzzle?filter_type={0}'>{0}</a></li>",x.type));
                    }
                %>
            </ul>
            <h3>Уровни сложности:</h3>
            <ul style="list-style-type: none">
                <%
                    foreach(cursovaya.Difficulty x in db.Difficulty)
                    {
                        string zvezdi = "";
                        switch (x.id_difficulty)
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
                        Response.Write(String.Format(@"<li style='color: gray'><a href='\FilterPuzzle?filter_difficulty={1}'>{0}</a></li>",zvezdi,x.difficulty_lvl));
                    }
                %>
            </ul>
            <h3>Производитель:</h3>
            <ul style="list-style-type: none">
                <%
                    foreach(cursovaya.Company_List x in db.Company_List)
                    {
                        Response.Write(String.Format(@"<li style='color: gray'><a href='\FilterPuzzle?filter_company={0}'>{0}</a></li>",x.name));
                    }
                %>
            </ul>
            <h3>Страна:</h3>
            <ul style="list-style-type: none">
                <%
                    foreach(cursovaya.Countries x in db.Countries)
                    {
                        Response.Write(String.Format(@"<li style='color: gray'><a href='\FilterPuzzle?filter_country={0}'>{0}</a></li>",x.name));
                    }
                %>
            </ul>
		</div>
		<div style="max-width:1066px;min-height:700px">
			<h3 style="font-size:2.5em;margin:20px; font-weight: bold"><a style="text-decoration: none; color:black" href="\Default.aspx">Каталог <%Response.Write(String.Format(" - фильтр: "+filter_str)); %></a> </h3>
            <%
                if (searched!=false)
                        Response.Write(String.Format(@"<h3 style='margin-left:20px'>Результаты поиска: '{0}'</h3>", searchquerry)); 
              %>
			<div style="display:flex;flex-wrap:wrap; font-family: sans-serif;font-size:14px;font-weight:bold">
				<%
                    foreach (cursovaya.Puzzle puzzle in db.Puzzle)
                    {
                        string zvezdi = "";
                        switch (puzzle.id_difficulty)
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
                        if (searched==true)
                        {
                            string containedstring = puzzle.name.ToLower();
                            if (containedstring.Contains(searchquerry))
                            {
                                if (!string.IsNullOrEmpty(filter_type))
                                    if (puzzle.Types.type == filter_type)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                                if (!string.IsNullOrEmpty(filter_company))
                                    if (puzzle.Company_List.name == filter_company)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                                if (!string.IsNullOrEmpty(filter_difficulty))
                                    if (puzzle.Difficulty.difficulty_lvl == difficulty_lvl)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                                if (!string.IsNullOrEmpty(filter_country))
                                    if (puzzle.Company_List.Countries.name == filter_country)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                            }
                           
                        }
                        else
                            {
                                if (!string.IsNullOrEmpty(filter_type))
                                    if (puzzle.Types.type == filter_type)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                                if (!string.IsNullOrEmpty(filter_company))
                                    if (puzzle.Company_List.name == filter_company)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                                if (!string.IsNullOrEmpty(filter_difficulty))
                                    if (puzzle.Difficulty.difficulty_lvl == difficulty_lvl)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                                if (!string.IsNullOrEmpty(filter_country))
                                    if (puzzle.Company_List.Countries.name == filter_country)
                                        Response.Write(String.Format(@"<span style='display: inline-flex; margin:20px;justify-content: flex-start; width:300px; height: 400px; align-items:center; flex-direction: column;padding: 25px;border: 1px solid black; border-radius:12px;text-align:center'>
													           <a href='\PuzzlePage?puzzle_num={0}'><img src='Images\\puzzle_id{0}.png' alt='puzzlepicture' width='200px' height='200px'></a>
													           <p style='margin-top:15px'><a style='text-decoration: none; color:black'>{1}</a></p>
													           Сложность: {2}<br></br> Стоимость: {3} рублей <a style='margin:10px;padding:5px; border: 3px solid black; background-color:green;color:white; text-decoration:none' href='\AddToCart?addcart={0}'>Добавить в корзину</a>
													           </span>", puzzle.id_puzzle, puzzle.name, zvezdi, puzzle.cost));
                            }
                    }
				%>
			</div>
		</div>
	</div>
</asp:Content>
