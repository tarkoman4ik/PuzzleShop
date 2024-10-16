using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cursovaya
{
    public partial class FilterPuzzle : Page
    {
        public string filter_type = string.Empty;
        public string filter_str = string.Empty;
        public string filter_difficulty = string.Empty;
        public string filter_country = string.Empty;
        public int difficulty_lvl = 0;
        public string searchquerry;
        public bool searched = false;
        public string filter_company = string.Empty;
        public void Page_Load(object sender, EventArgs e)
        {
            searched = false;
            filter_type = Request.QueryString["filter_type"];
            filter_difficulty = Request.QueryString["filter_difficulty"];
            filter_company = Request.QueryString["filter_company"];
            filter_country = Request.QueryString["filter_country"];
            if (!string.IsNullOrEmpty(filter_type))
                filter_str = filter_type;
            else if (!string.IsNullOrEmpty(filter_difficulty))
            {
                difficulty_lvl = Int32.Parse(filter_difficulty);
                switch (filter_difficulty)
                {
                    case "1":
                        filter_str = "★☆☆☆☆☆";
                        break;
                    case "2":
                        filter_str = "★★☆☆☆☆";
                        break;
                    case "3":
                        filter_str = "★★★☆☆☆";
                        break;
                    case "4":
                        filter_str = "★★★★☆☆";
                        break;
                    case "5":
                        filter_str = "★★★★★☆";
                        break;
                    case "6":
                        filter_str = "★★★★★★";
                        break;
                }
            }
            else if (!string.IsNullOrEmpty(filter_country))
                filter_str = filter_country;
            else if (!string.IsNullOrEmpty(filter_company))
                filter_str = filter_company;

        }
        public void ButtonClicked(object sender,EventArgs e)
        {
            if (Request.Form["SearchBox"] != null)
            {
                searchquerry = Request.Form["SearchBox"].ToLower();
                searched = true;
;           }
        }
    }
}