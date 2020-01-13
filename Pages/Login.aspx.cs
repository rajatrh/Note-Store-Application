

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebsiteCollegeLatest.Database;

namespace WebsiteCollegeLatest.Pages
{
    public partial class Login : System.Web.UI.Page
    {
       
        
        dataAccess da = new dataAccess();
        
       
        protected void Page_Load(object sender, EventArgs e)
        {

            divLoginError.Visible = false;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (da.loginUser(tbuser.Text, tbpass.Text))
            {
                List<string> values = new List<string>();
                
                values.Add((da.id).ToString());
                values.Add(da.uname);
                values.Add(tbuser.Text);
                values.Add(da.picname);

                Session["uInfo"] = values;
                Session.Timeout = 12;
                Response.Redirect("Home.aspx");
            }
            else
            {
                divLoginError.Visible = true;
            }
        }


        /// <summary>
        /// validate() is used to validate the text boxes
        /// </summary>
        /// <param name="name"></param>
        /// <param name="pwd"></param>
        /// <param name="usn"></param>
        /// <param name="email"></param>
        /// <param name="phone"></param>
        /// <returns></returns>
       
        protected bool validate(String name, String pwd, String usn, String email, String phone)
        {
            bool error = false;
            if (name == string.Empty || pwd == string.Empty || usn == string.Empty || email == string.Empty || phone == string.Empty)
                error=true;
           
            //if (da.checkUnique(name, 1) == 1)
            //{
            //    Response.Write("<script>alert('Name is not unique.')</script>");
            //    error = true;
            //}

            if (da.checkUnique(email, 2) == 1)
            {
                Response.Write("<script>alert('Email already registered!')</script>");
                error = true;
            }
                if(error)
                return false;
            else
                return true;
        }

        protected void btnregister_click(object sender, EventArgs e)
        {
            if (validate(txtUname.Text, txtPwd.Text, txtUSN.Text, txtEmail.Text, txtPhone.Text))
            {

                int res = da.registerUser(txtUname.Text, txtPwd.Text, txtUSN.Text, txtEmail.Text, Convert.ToInt64(txtPhone.Text));
                if (res == 1)
                    Response.Write ("<script>alert('Successfully Registered')</script>");
                else
                    Response.Write("<script>alert('Something Went Wrong')</script>");
            }
            else
                Response.Write("<script>alert('something went wrong')</script>");
        }

        

       
    }
}