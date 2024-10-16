using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cursovaya
{
    public partial class AddToCart : Page
    {
        string puzzleid = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            puzzleid = Request.QueryString["addcart"];
            using(var db = new cursovaya.Database1Entities1())
            {
                bool in_cart = false;
                foreach(Cart cart in db.Cart)
                {
                    if (cart.in_usercart == "incart" && Convert.ToInt32(puzzleid) == cart.id_puzzle)
                    {
                        cart.amount = cart.amount + 1;
                        in_cart = true;
                    }
                }
                db.SaveChanges();
                if (!in_cart)
                {
                    var c = new Cart { id_puzzle = Convert.ToInt32(puzzleid), amount = 1, in_usercart = "incart" };
                    db.Cart.Add(c);
                    db.SaveChanges();
                }
            }
        }
    }
}