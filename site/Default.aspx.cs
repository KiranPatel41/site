using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.Logic;
using DataAccess.Entities;

namespace site
{
    public partial class Default : System.Web.UI.Page
    {
        Service s = new Service();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


     

        protected void lnkLogin_Click(object sender, EventArgs e)

        {
            try
            {

                AdminMaster al = s.AdminMaster.Get().Where(c => c.UserName == txtUsername.Text && c.Password == txtPassword.Text && c.IsActive == true).FirstOrDefault();

                if (al != null)
                {
                    
                    HttpCookie EI = new HttpCookie("EI");

                 
                    string EUI = al.AdminLoginId.ToString();

                    
                  
                    EI.Value = EUI;
                    
                    HttpContext.Current.Response.Cookies.Add(EI);


                    Response.Redirect("ViewEmployee.aspx", false);

                }
                else
                {
                    MsgBox("Username is Incorrect");
                }
            }
            catch (Exception ex)
            {
                
            }
        }
        public void MsgBox(string message)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                message = message.Replace("'", "'");
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Message", "alert('" + message + "')", true);
            }
        }
        public void MsgThenRedirectTo(string message, string pageName)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                message = message.Replace("'", "\'");
                ScriptManager.RegisterStartupScript(page, page.GetType(),
                    "MessageThenRedirect", "alert('" + message +
                    "');window.location='" + pageName + ".aspx';", true);
            }
        }
    }
}