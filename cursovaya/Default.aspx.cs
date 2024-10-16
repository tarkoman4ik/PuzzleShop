using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cursovaya
{
    public partial class _Default : Page
    {
        public string searchquery = string.Empty;
        public bool searched = false;
        public int puzzleaddid;
        public void Page_Load(object sender, EventArgs e)
        {
            searched = false;
        }
        public void search_Click1(object sender, EventArgs e)
        {
            searchquery = Request.Form["SearchBox"].ToLower();
            searched = true;
        }
    }
}