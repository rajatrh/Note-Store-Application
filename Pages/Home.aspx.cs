
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Drawing;
using WebsiteCollegeLatest.Database;
using WebsiteCollegeLatest.classes;
namespace WebsiteCollegeLatest.Pages
{
    public partial class Home1 : System.Web.UI.Page
    {
        dataAccess da = new dataAccess();
        public string profilepic = null;
       

        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> userInfo = (List<string>)(Session["uInfo"]);
            rptSearchRes.Visible = false;
           
            if (userInfo == null)
            Response.Redirect("Login.aspx");
            

            if (!IsPostBack)
            {
                lblName.Text = userInfo[1];
                profilepic = userInfo[3];
                divSendMessage.Visible = false;
                divResults.Visible = false;
                ddlBranch.DataSource = da.load_dept();
                ddlBranch.DataTextField = "dname";
                ddlBranch.DataValueField = "did";
                ddlBranch.DataBind();
                string[] sub = userInfo[1].Split('-', '@');
                ddlBranch.Items.FindByText(sub[2].ToUpper()).Selected = true;
              
                ddlSem.Items.FindByValue(sub[1]).Selected = true;
                ddlSubjects.DataSource = da.load_subjects(Convert.ToInt64(ddlBranch.SelectedValue), Convert.ToInt16(ddlSem.SelectedValue));
                ddlSubjects.DataTextField = "subname";
                ddlSubjects.DataValueField = "subid";
                ddlSubjects.DataBind();

                imgProfile.Attributes.Add("src", "/profilePics/" + profilepic);

            }
        }
        protected void ddlbranch_selectedindexchanged(object sender, EventArgs e)
        {

            ddlSubjects.DataSource = da.load_subjects(Convert.ToInt64(ddlBranch.SelectedValue), Convert.ToInt16(ddlSem.SelectedValue));
            ddlSubjects.DataTextField = "subname";
            ddlSubjects.DataValueField = "subid";
            ddlSubjects.DataBind();
        }

        protected void ddlsem_selectedindexchanged(object sender, EventArgs e)
        {

            ddlSubjects.DataSource = da.load_subjects(Convert.ToInt64(ddlBranch.SelectedValue), Convert.ToInt16(ddlSem.SelectedValue));
            ddlSubjects.DataTextField = "subname";
            ddlSubjects.DataValueField = "subid";
            ddlSubjects.DataBind();
        }

        protected void btnSearch_onclick(object sender, EventArgs e)
        {
            divResults.Visible = true;
          //  lblInfo.Text = "Search Result for Sem: <b>" + ddlSem.SelectedItem + "</b> Branch: <b>" + ddlBranch.SelectedItem + "</b> and Subject: <b>" + ddlSubjects.SelectedItem + "</b>";
            if (Convert.ToInt64(ddlBranch.SelectedValue) != -1 && Convert.ToInt32(ddlSem.SelectedValue) != -1)
            {
                List<dataAccess> lda = da.search_results(Convert.ToInt64(ddlBranch.SelectedValue), Convert.ToInt32(ddlSem.SelectedValue), Convert.ToInt64(ddlSubjects.SelectedValue), tbKeyWord.Text);

                if (lda.Count > 0)
                {
                    rptSearchRes.Visible = true;
                    rptSearchRes.DataSource = lda;
                    rptSearchRes.DataBind();
                }
         //  else
          //       lblInfo.Text = "Sorry..! No Results Found. Please Try with other keywords";
            }
       //   else
        //    lblInfo.Text = "Please select Branch and Semester";

        }

        protected void rptUpdateDownloads(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "dwnLink")
            {
                string[] notesid = e.CommandArgument.ToString().Split(',');
                //Label l= (Label) e.CommandArgument.FindControl("lblNotesid");

                da.updatedownload(Convert.ToInt64(notesid[0]));

                Response.Redirect(notesid[1]);

            }
            rptSearchRes.Visible = true;
        }

        protected void lnksearchpro_Click(object sender, EventArgs e)
        {
            divprofileresults.Visible = true;
            rptProfileResult.Visible = true;
            List<profile> p = da.load_profiles(tbsearchpro.Text);
            rptProfileResult.DataSource = p;
            rptProfileResult.DataBind();
        }

        protected void lnkmessage_Command(object sender, CommandEventArgs e)
        {
            List<string> userInfo = (List<string>)(Session["uInfo"]);
            if(userInfo.Count==4)
                userInfo.Add(e.CommandArgument.ToString());
            else
            userInfo[4]=e.CommandArgument.ToString();
            Session["uInfo"] = userInfo;
            divSendMessage.Visible = true;
        }

        protected void lnkSendMessage_Click(object sender, EventArgs e)
        {
            List<string> userInfo = (List<string>)(Session["uInfo"]);
            Int64 fromid = Convert.ToInt64(userInfo[0]);
            divSendMessage.Visible = false;
            rptProfileResult.Visible = false;
            divprofileresults.Visible = false;
            da.sendmessage(Convert.ToInt64(userInfo[4]),tbmessage.Text, fromid);
            userInfo.RemoveAt(4);
            Session["uinfo"] = userInfo;
        }
    }

}


