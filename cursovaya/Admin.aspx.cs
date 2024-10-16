using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cursovaya
{
    public partial class Admin : Page
    {
        public int delete_id, update_id, create_id;
        public string Updname = string.Empty, Upddesc, Upddiff, Updcomp, Updamount, Updcost, Updtype;
        public string Insname, Insdesc, Insdiff, Inscomp, Insamount, Inscost, Instype;
        public string change = "изменений нет";
        public void Page_Load(object sender, EventArgs e)
        {

        }

        public void DeleteBtn_Click(object sender, EventArgs e)
        {
            if (Request.Form["delet"] != null)
            {
                delete_id = Convert.ToInt32(Request.Form["delet"]);
                using (var db = new cursovaya.Database1Entities1())
                {
                    foreach (Puzzle p in db.Puzzle)
                    {
                        if (p.id_puzzle == delete_id)
                        {
                            db.Puzzle.Remove(p);
                        }
                    }
                    db.SaveChanges();
                }
                change = "удалена головоломка " + delete_id.ToString();
            }
        }

        public void UpdateBtn_Click(object sender, EventArgs e)
        {
            if (Request.Form["Updid"] != null)
            {
                update_id = Convert.ToInt32(Request.Form["Updid"]);
                Updname = Request.Form["Updname"];
                Upddesc = Request.Form["Upddesc"];
                Upddiff = Request.Form["Upddiff"];
                Updcomp = Request.Form["Updcomp"];
                Updamount = Request.Form["Updamount"];
                Updcost = Request.Form["Updcost"];
                Updtype = Request.Form["Updtype"];
                using (var db = new cursovaya.Database1Entities1())
                {
                    foreach (Puzzle p in db.Puzzle)
                    {
                        if (p.id_puzzle == update_id)
                        {
                            if (Updname.Length > 0)
                                p.name = Updname;
                            else
                                p.name = p.name;

                            if (Upddesc.Length > 0)
                                p.description = Upddesc;
                            else
                                p.description = p.description;

                            if (Upddiff.Length > 0)
                                p.id_difficulty = Convert.ToInt32(Upddiff);
                            else
                                p.id_difficulty = p.id_difficulty;

                            if (Updcomp.Length > 0)
                                p.id_company = Convert.ToInt32(Updcomp);
                            else
                                p.id_company = p.id_company;

                            if (Updamount.Length > 0)
                                p.amount = Convert.ToInt32(Updamount);
                            else
                                p.amount = p.amount;

                            if (Updcost.Length > 0)
                                p.cost = Convert.ToInt32(Updcost);
                            else
                                p.cost = p.cost;

                            if (Updtype.Length > 0)
                                p.id_type = Convert.ToInt32(Updtype);
                            else
                                p.id_type = p.id_type;
                        }
                    }
                    db.SaveChanges();
                }
                change = "у головоломки " + update_id.ToString() + " были обновлены поля";
            }
        }

        public void InsertBtn_Click(object sender, EventArgs e)
        {

            if (Request.Form["Insname"]!=null&& Request.Form["Insdesc"]!=null&& Request.Form["Insdiff"]!=null&& Request.Form["Inscomp"]!=null&& Request.Form["Insamount"]!=null&& Request.Form["Inscost"]!=null&& Request.Form["Instype"]!=null)
            {
                Insname = Request.Form["Insname"];
                Insdesc = Request.Form["Insdesc"];
                Insdiff = Request.Form["Insdiff"];
                Inscomp = Request.Form["Inscomp"];
                Insamount = Request.Form["Insamount"];
                Inscost = Request.Form["Inscost"];
                Instype = Request.Form["Instype"];
                using (var db = new cursovaya.Database1Entities1())
                {
                    Puzzle k = new Puzzle { name = Insname, description = Insdesc, id_difficulty = Convert.ToInt32(Insdiff), id_company = Convert.ToInt32(Inscomp), amount = Convert.ToInt32(Insamount), cost = Convert.ToInt32(Inscost), id_type = Convert.ToInt32(Instype) };
                    db.Puzzle.Add(k);
                    db.SaveChanges();
                }
                change = "создана новая головоломка";
            }
        }
    }
}