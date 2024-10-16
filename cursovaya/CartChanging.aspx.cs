using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cursovaya
{
    public partial class CartChanging : Page
    {
        public int act;
        public int id_puzl;
        protected void Page_Load(object sender, EventArgs e)
        {
            act = Convert.ToInt32(Request.QueryString["act"]);
            id_puzl = Convert.ToInt32(Request.QueryString["id_puzl"]);
            if (act == -1)
            {
                using(var db = new cursovaya.Database1Entities1())
                {
                    foreach (Cart c in db.Cart)
                        if (c.id_puzzle == id_puzl && c.amount != 1 && c.in_usercart == "incart")
                        {
                            c.amount = c.amount - 1;
                        }
                        else if (c.amount == 1 && c.in_usercart == "incart")
                        {
                            c.in_usercart = "deleted";
                        }
                    db.SaveChanges();
                }
            }
            else if (act == 1)
            {
                using (var db = new cursovaya.Database1Entities1())
                {
                    foreach (Cart c in db.Cart)
                        if (c.id_puzzle == id_puzl && c.in_usercart == "incart")
                        {
                            c.amount = c.amount + 1;
                        }
                    db.SaveChanges();
                }
            }
            else if (act == 0)
            {
                using (var db = new cursovaya.Database1Entities1())
                {
                    foreach (Cart c in db.Cart)
                        if (c.id_puzzle == id_puzl&&c.in_usercart=="incart")
                        {
                            c.amount = 0;
                            c.in_usercart = "deleted";
                        }
                    db.SaveChanges();
                }
            }
        }
    }
}