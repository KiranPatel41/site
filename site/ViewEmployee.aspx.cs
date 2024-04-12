using DataAccess;
using DataAccess.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Remoting;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace site
{
    public partial class ViewEmployee : System.Web.UI.Page
    {
       
        Service s = new Service();
        protected void Page_Load(object sender, EventArgs e)
        {
            bindData();
        }



        void bindData()
        {
            AdminMaster al = s.AdminMaster.Get(Convert.ToInt32((Request.Cookies["EI"].Value.ToString())));
            if (al.IsAdmin == true)
            {
                List<Employee> CL = s.Employee.Get().Where(c => c.IsActive == true).OrderByDescending(c => c.EmployeId).ToList();
                rptrAllAccess.DataSource = CL;
                rptrAllAccess.DataBind();
            }
            else
            {
                List<Employee> CL = s.Employee.Get().Where(c => c.UserId == al.AdminLoginId && c.IsActive== true).OrderByDescending(c => c.EmployeId).ToList();
                rptrAllAccess.DataSource = CL;
                rptrAllAccess.DataBind();
            }
        }

    

    


        private DataTable Import_To_Grid(string FilePath, string Extension, string isHDR)

        {
            
            string conStr = "";

            switch (Extension)

            {

                case ".xls":   

                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]

                    .ConnectionString;

                    break;

                case ".xlsx": 

                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]

                    .ConnectionString;

                    break;

            }

            conStr = String.Format(conStr, FilePath, isHDR);

            OleDbConnection connExcel = new OleDbConnection(conStr);

            OleDbCommand cmdExcel = new OleDbCommand();

            OleDbDataAdapter oda = new OleDbDataAdapter();


            DataTable dt = new DataTable();

            cmdExcel.Connection = connExcel;


          

            connExcel.Open();

            DataTable dtCsvSchema;

            dtCsvSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            string SheetName = dtCsvSchema.Rows[0]["TABLE_NAME"].ToString();

            connExcel.Close();

          

            connExcel.Open();

            cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";



            oda.SelectCommand = cmdExcel;

            oda.Fill(dt);

            connExcel.Close();

           

            return dt;



        }
        protected void rptr_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "Delete")
            {
                Employee objC = s.Employee.Get(Convert.ToInt32(e.CommandArgument));
                objC.IsActive = false;
              
                s.Employee.Update(objC);
                MsgThenRedirectTo("Data Deleted Successfully", "ViewEmployee");
            }

        }


       

        protected void btnsub_Click(object sender, EventArgs e)
        {
            try
            {
                if (FUexcel.HasFile)

                {
                   
                    string FileName = Path.GetFileName(FUexcel.PostedFile.FileName);

                    string Extension = Path.GetExtension(FUexcel.PostedFile.FileName);

                    string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

                    string FilePath = Server.MapPath(FolderPath + FileName);

                    FUexcel.SaveAs(FilePath);

                    DataTable Dt = Import_To_Grid(FilePath, Extension, "No");
                    DataRow row = Dt.Rows[0];
                    Dt.Rows.Remove(row);



                    DataTable dt = ViewState["CurrentEmp"] as DataTable;

                    List<Employee> emp = new List<Employee>();

                    emp = (from DataRow row1 in Dt.Rows

                           select new Employee
                           {

                               EmployeeName = row1["F1"].ToString(),
                               DOB = (Convert.ToString(row1["F2"].ToString())),
                               DOJ = (Convert.ToString(row1["F3"].ToString())),
                               FullName = row1["F4"].ToString(),

                           }).ToList();


                    foreach (var time in emp)
                    {

                        

                        if(time.EmployeeName == "Name")
                        {

                        }
                        else
                        { Employee objEM = new Employee();
                            objEM.EmployeeName = time.EmployeeName;
                            objEM.FullName = time.FullName;
                            objEM.DOB = time.DOB;
                            objEM.DOJ = time.DOJ;
                            objEM.UserId = Convert.ToInt32(Request.Cookies["EI"].Value.ToString());
                            objEM.IsDisplay = true;
                            objEM.IsActive = true;
                            objEM.IsAddedOn = DateTime.Now;
                           s.Employee.Add(objEM);

                        }
                    }

                    MsgThenRedirectTo("Data Imported Successfully!", "ViewEmployee");
                }
                else
                {
                    MsgBox("Please Select File in Given CSV format!");
                }

            }
            catch (Exception ex)
            {
                throw ex;
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

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}