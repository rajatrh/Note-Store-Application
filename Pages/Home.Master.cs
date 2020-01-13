using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebsiteCollegeLatest.classes;
using WebsiteCollegeLatest.Database;

namespace WebsiteCollegeLatest.Pages
{
    public partial class Home : System.Web.UI.MasterPage
    {
        dataAccess da = new dataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            List<string> userInfo = (List<string>)(Session["uInfo"]);

            
            if (userInfo == null)
            Response.Redirect("Login.aspx");
            aInbox.Text = "Inbox(";
            aInbox.Text += da.countmessages(Convert.ToInt64(userInfo[0]));
            aInbox.Text += ")";
            List<messages> m= da.load_messages(Convert.ToInt64(userInfo[0]));
            rptSender.DataSource=m;
            rptSender.DataBind();

        }

        protected void aInbox_Click(object sender, EventArgs e)
        {
            divinbox.Visible = true;
        }

        protected void lnkbtnLogout_Click(object sender, EventArgs e)
        {
            List<string> userinfo= (List<string>)Session["uinfo"];
            for(int i=0;i<userinfo.Count;i++)
            userinfo.Remove(userinfo[i]);
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void lnkinbox_Command(object sender, CommandEventArgs e)
        {
            List<string> userinfo= (List<string>)Session["uinfo"];
            Int64 fromid = Convert.ToInt64(e.CommandArgument);
            List<messages> m = da.load_conversation(Convert.ToInt64(userinfo[0]), fromid);
            rptConversation.DataSource = m;
            rptConversation.DataBind();

        }

        protected void lnkcloseinbox_Click(object o, EventArgs e)
        {
            divinbox.Visible = false;
        }
    }
}