using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cursovaya
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clear_Click(object sender, EventArgs e)
        {
            using(var db = new Database1Entities1())
            {
                foreach (Cart c in db.Cart)
                    if (c.in_usercart == "incart")
                        c.in_usercart = "deleted";
                db.SaveChanges();
            }   
        }

        public void purchase_Click(object sender, EventArgs e)
        {
            string fname = Request.Form["fname"];
            string lname = Request.Form["lname"];
            string mail = Request.Form["email"];
            string number = Request.Form["number"];

            using (var db = new Database1Entities1())
            {
                var pur = new Purchase { date_purchase = System.DateTime.Now, firstName = fname, lastName = lname, mail_address = mail, phone_number = number };
                db.Purchase.Add(pur);
                db.SaveChanges();
                int purnum = pur.id_purchase;
                foreach (Cart c in db.Cart)
                    if (c.in_usercart == "incart")
                    {
                        c.in_usercart = "paided";
                        c.id_purchase = purnum;
                    }
                db.SaveChanges();
            }
        }
    }
}