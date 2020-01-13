
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebsiteCollegeLatest.Database;
using System.IO;

namespace WebsiteCollegeLatest.Pages
{
    public partial class notesUploads : System.Web.UI.Page
    {
        string uploadFileName;
        string uploadFilePath;
        dataAccess da = new dataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> userInfo = (List<string>)(Session["uInfo"]);

            if (userInfo == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                ddlBranch.DataSource = da.load_dept();
                ddlBranch.DataTextField = "dname";
                ddlBranch.DataValueField = "did";
                ddlBranch.DataBind();

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

        protected void btnCancelUpload_click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnUpload_click(object sender, EventArgs e)
        {
             List<string> userInfo = (List<string>)(Session["uInfo"]);
                 Int64 id = Convert.ToInt64(userInfo[0]);

            if (fuNotes.HasFile)
            {
                string ext = Path.GetExtension(fuNotes.FileName).ToLower();
                if (ext == ".zip" || ext == ".pdf")
                {

                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/Notes"), uploadFileName);
                    try
                    {
                        fuNotes.SaveAs(uploadFilePath);

                        da.uploadNotes(id, uploadFileName, Convert.ToInt64(ddlBranch.SelectedValue), Convert.ToInt16(ddlSem.SelectedValue), Convert.ToInt64(ddlSubjects.SelectedValue),tbDescription.Text);
                      
                      Response.Redirect("Home.aspx");

                    }
                    catch (Exception ex)
                    {
                        lblMsg.Text = "Error! Please try again.";
                    }
                }
                else
                {
                    lblMsg.Text = "Selected file type not allowed!";
                }
            }
            else
            {
                lblMsg.Text = "Please select file first!";
            }
        }
    }
}