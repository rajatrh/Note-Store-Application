//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace WebsiteCollegeLatest.Pages
//{
//    public partial class profileEdit : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using WebsiteCollegeLatest.Database;
using System.Web.UI.HtmlControls;

namespace WebsiteCollegeLatest.Pages
{
    public partial class profileEdit : System.Web.UI.Page
    {
        String oldpicpath = null;
        string uploadFileName;
        string uploadFilePath;

        dataAccess da = new dataAccess();
        Int64 id = new Int64();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> userInfo = (List<string>)(Session["uInfo"]);
         
            if (userInfo == null)
                Response.Redirect("Login.aspx");
            
            if (!IsPostBack)
            {
                id = Convert.ToInt64(userInfo[0]);
                lblMsg.Text = "";
                oldpicpath = userInfo[3];
                imgpropic.Attributes.Add("src", "/profilePics/" + oldpicpath);
                tbName.Text = userInfo[1];
               
            }
        }
        
        protected void btnSavechanges_click(object sender, EventArgs e)
        {
            List<string> userInfo = (List<string>)(Session["uInfo"]);
            oldpicpath = userInfo[3];
            id = Convert.ToInt64(userInfo[0]);

            if (oldpicpath != "noprofilepic.jpg" && userInfo.Count == 5)
            {
                string path = Server.MapPath("~/profilePics/") + oldpicpath;
                File.Delete(path);
            }

            if (userInfo.Count == 5)
            {
                int res = da.uploadprofile(userInfo[4], id);
                userInfo[3] = userInfo[4];
                userInfo.Remove(userInfo[4]);
                Session["uInfo"] = userInfo;
            }
            
            Response.Redirect("Home.aspx");
        }



        protected void btnUpload_click(object sender, EventArgs e)
        {


            if (fuProfile.HasFile)
            {
                string ext = Path.GetExtension(fuProfile.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
                {

                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/profilePics"), uploadFileName);
                    try
                    {
                        fuProfile.SaveAs(uploadFilePath);
                        // imgpropic.ImageUrl = "~/profilePics/" + uploadFileName;
                        imgpropic.Attributes.Add("src", "/profilePics/" + uploadFileName);
                        List<string> userInfo = (List<string>)(Session["uInfo"]);

                        if (userInfo.Count == 4)
                            userInfo.Add(uploadFileName);
                        else
                        {
                            string path = Server.MapPath("~/profilePics/") + userInfo[4];
                            File.Delete(path);
                            userInfo[4] = uploadFileName;
                        }
                        Session["uInfo"] = userInfo;

                    }
                    catch (Exception ex)
                    {
                        lblMsg.Text = "Error! Please Try Again.";
                    }
                }
                else
                {
                    lblMsg.Text = "Selected File Type Not Allowed!";
                }
            }
            else
            {
                lblMsg.Text = "Please Select File First!";
            }
        }

       
    }
}