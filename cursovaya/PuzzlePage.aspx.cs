using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cursovaya
{
    public partial class PuzzlePage : Page
    {
        public string request_puzzle = string.Empty;
        public void Page_Load(object sender, EventArgs e)
        {
            request_puzzle = Request.QueryString["puzzle_num"];
        }
    }
}