using DataAccess;
using DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace site
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        Service s = new Service();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["II"] != null)
                {
                    lblId.Text = Request.QueryString["II"].ToString();
                    BindData(Convert.ToInt32(Request.QueryString["II"].ToString()));

                }
            }
        }
        void BindData(int documentID)
        {


            Employee al = s.Employee.Get().Where(c => c.EmployeId == documentID).FirstOrDefault();
            if (al != null)
            {
                txtEName.Text = al.EmployeeName;
                txtFullName.Text = al.FullName;
                txtDob.Text = Convert.ToDateTime(al.DOB).Date.ToString("yyyy-MM-dd").ToString();
                txtDoj.Text = Convert.ToDateTime(al.DOJ).Date.ToString("yyyy-MM-dd").ToString();
                drpMaager.SelectedValue = al.ManageName;
                chkDisplay.Checked = Convert.ToBoolean(al.IsDisplay);
                RequiredFieldValidator1.Enabled = false;
                ViewState["FileUpload1"] = al.Image;
                img.ImageUrl = "../" + al.Image;
                img.Visible = true;

            }
        }

        protected string UploadImage(FileUpload FileUpload, string FileName, string FilePath, int size, int size1)
        {

            string img = "";

           
            Bitmap newImage = default(Bitmap);
            System.Drawing.Image FrontImage = default(System.Drawing.Image);
            FrontImage = System.Drawing.Image.FromStream(FileUpload.PostedFile.InputStream);
           
            double UploadedImageWidth = FrontImage.PhysicalDimension.Width;
            double UploadedImageHeight = FrontImage.PhysicalDimension.Height;
            double isoscalar = 0;
            double newWidth = 0;
            double newHeight = 0;

            isoscalar = Math.Min((size / UploadedImageWidth), (size1 / UploadedImageHeight));
            newWidth = isoscalar * UploadedImageWidth;
            newHeight = isoscalar * UploadedImageHeight;


            int nwidth = 0;
            int wheight = 0;
            nwidth = Convert.ToInt32(newWidth);
            wheight = Convert.ToInt32(newHeight);

            int x = 0;
            int y = 0;
            x = (size - nwidth) / 2;
            y = (size1 - wheight) / 2;

           
            newImage = new Bitmap(size, size1);
            newImage.SetResolution(72, 72);
            
            Graphics gr = default(Graphics);
            gr = Graphics.FromImage(newImage);
           
            SolidBrush sb = default(SolidBrush);
            sb = new SolidBrush(System.Drawing.Color.Transparent);
           
            gr.FillRectangle(sb, 0, 0, newImage.Width, newImage.Height);
          
            gr.DrawImage(FrontImage, x, y, nwidth, wheight);
          

            img = FilePath + FileName;
            newImage.Save(Server.MapPath("~/" + FilePath) + FileName);

            return img;

        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Employee EL = new Employee();
            if (FileUpload1.HasFile)
            {
                
                string filetype = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName);
                string filename = Guid.NewGuid().ToString().Replace("-", "") + filetype;
                string ext = System.IO.Path.GetExtension(this.FileUpload1.PostedFile.FileName);

                EL.Image = UploadImage(FileUpload1, filename, "Upload/Image/", 1280, 610);
            }
            else
            {
                if (ViewState["FileUpload1"] != null)
                {
                    EL.Image = ViewState["FileUpload1"].ToString();
                }
                else
                {
                    EL.Image = "";
                }
            }
            EL.IsDisplay = chkDisplay.Checked;
      
            EL.EmployeeName = txtEName.Text;
            EL.FullName = txtFullName.Text;
            EL.DOB = Convert.ToString(txtDob.Text);
            EL.DOJ = Convert.ToString(txtDoj.Text);
            EL.ManageName = drpMaager.SelectedValue;
            EL.IsActive = true;
            if (lblId.Text != null && lblId.Text != "")
            {
                Employee EEM = s.Employee.Get().Where(c => c.EmployeeName == txtEName.Text && c.EmployeId != Convert.ToInt32(lblId.Text) && c.IsActive == true).FirstOrDefault();
                if (EEM != null)
                {
                    MsgBox("Record already exist !");
                }
                else
                {
                    EL.IsUpdatedOn = DateTime.Now;
                    EL.EmployeId = Convert.ToInt32(lblId.Text);
                    s.Employee.Update(EL);
                    MsgThenRedirectTo("Data Updated Successfully", "ViewEmployee");

                }

            }

            else
            {
                Employee EEM = s.Employee.Get().Where(c => c.EmployeeName == txtEName.Text && c.IsActive == true).FirstOrDefault();
                if (EEM != null)
                {
                    MsgBox("Record already exist !");
                }
                else
                {
                    EL.IsAddedOn = DateTime.Now;
                    s.Employee.Add(EL);
                    MsgThenRedirectTo("Data Inserted Successfully", "ViewEmployee");
                }

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

        public void MsgBox(string message)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                message = message.Replace("'", "'");
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Message", "alert('" + message + "')", true);
            }
        }
    }
}