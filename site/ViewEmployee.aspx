<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEmployee.aspx.cs" Inherits="site.ViewEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link rel="icon" type="image/jpg" href="images/1.png">

    <title>Welcome</title>
    <link rel="stylesheet" href="css/vendors_css.css" />

    <link rel="stylesheet" href="css/horizontal-menu.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/skin_color.css" />
    <style>
        .search-box {
            z-index: 50000;
            position: absolute;
            width: 17.6rem;
        }

        .search-filter {
            background-color: #efefef;
            margin-top: 2px;
            border-radius: 5px;
            overflow-y: auto;
            max-height: 280px;
        }

            .search-filter a {
                padding-top: 8px;
                padding-bottom: 8px;
            }

        .aTag {
            display: block;
           
            padding-top: 8px;
            padding-bottom: 8px;
            text-transform: capitalize;
        }

        #color-overlay {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 9;
            width: 100%;
            height: 100%;
            background-color: #f9f9f9f2;
            opacity: 10;
        }

        .overlay-btn {
            position: absolute;
            top: 50%;
            left: 30%;
            text-align: center;
            z-index: 9;
        }

        .overlay-btn {
            font-size: 30px;
        }

        .pinactive {
            background-color: #000024;
        }

            .pinactive a {
                color: white;
                cursor: pointer;
            }

        .pin a {
            cursor: pointer;
        }

        .loader1 {
            top: 0;
            left: 0;
            position: fixed;
            opacity: 0.8;
            z-index: 10000000;
            background: #000000c9;
            height: 100%;
            width: 100%;
            margin: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content-header">
            <div class="d-flex align-items-center">

                <div class="me-auto">

                    <h3 class="page-title">View Employee</h3>
                </div>

                <div>
                    <asp:Button ID="btnlogout" runat="server" class="btn btn-danger" Text="LogOut"  OnClick="btnlogout_Click"/>
                </div>
            </div>
        </div>

        <section class="content">

            <div class="row">
                <div class="col-12">
                    <div>
                        <div class="box">
                            <div class="box-body">







                                <div class="row">
                                    <div class="col-md-12 mb-4">

                                        <div>
                                            <div class="row">
                                                <div class="col-lg-2 col-md-4 col-sm-12 ">
                                                    <label>Import <span style="color: red">*</span></label>
                                                    <div class="form-group fg-line">
                                                        <span class="btn btn-primary btn-file m-r-10">
                                                            <span class="fileinput-new">Import </span>
                                                            <asp:FileUpload ID="FUexcel" runat="server" type="file" ClientIDMode="Static" accept="..xls,.xlsx,.XLS,.XLSX" />
                                                         
                                    </span>
                                                        <asp:Button ID="btnsub" class="btn btn-primary   " ValidationGroup="CP" runat="server" Text="Save" OnClick="btnsub_Click" />

                                                        <asp:Label ID="btnid" runat="server" Visible="false"></asp:Label>
                                                    </div>

                                                    <span class="fileinput-filename"></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Import  Excel" ControlToValidate="FUexcel"
                                                        Style="color: red" Display="Dynamic" ValidationGroup="CP"></asp:RequiredFieldValidator>



                                                </div>




                                            </div>
                                        </div>

                                        <div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="form-group mt-4 float-end">
                                                        <a id="AnchorAdd" runat="server" href="AddEmployee.aspx" class="btn btn-primary"><i></i>Add Employee</a>


                                                    </div>



                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                    <div id="DivAllAccess" runat="server" class="col-md-12">

                                        <div class="table-responsive">
                                            <asp:Repeater ID="rptrAllAccess" runat="server" OnItemCommand="rptr_ItemCommand">

                                                <HeaderTemplate>


                                                    <table id="example" class="table table-bordered table-hover display nowrap margin-top-10 w-p100">
                                                        <thead>
                                                            <tr>
                                                                <th>Sr.No</th>
                                                                <th>Name</th>
                                                                <th>Date Of Birth</th>
                                                                <th>Date Of Join</th>
                                                             
                                                                <th>Action</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%#  Container.ItemIndex + 1 %></td>


                                                        <td><%#Eval("EmployeeName")%></td>
                                                        <td><%#Eval("DOB","{0:dd/MM/yyyy}")%></td>
                                                        <td><%#Eval("DOJ","{0:dd/MM/yyyy}")%></td>


                                                      

                                                            <a href='<%#"AddEmployee.aspx?II="+Eval("EmployeId")%>' class="btn btn-sm btn-outline-primary"><span class="fa fa-pencil"></span></a>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" ToolTip="Delete" CommandArgument='<%#Eval("EmployeId")%>' class="btn btn-sm btn-outline-danger" datatoggle="modal" datatarget="#Delete" OnClientClick="javascript:return window.confirm('Are You Sure You Want To Delete?')"><i class="zmdi zmdi-delete"></i>
                                               <i class="tab-icon-trash ti-trash"></i>
                                                            </asp:LinkButton>

                                                        </td>
                                                    </tr>

                                                </ItemTemplate>

                                            </asp:Repeater>

                                        </div>

                                    </div>


                                </div>
                              
                            </div>




                        </div>


                    </div>

                </div>
              
            </div>
      
        </section>

        <script src="js/vendors.min.js"></script>
        <script src="js/pages/chat-popup.js"></script>
        <script src="assets/icons/feather-icons/feather.min.js"></script>

       
        <script src="js/ckeditor/ckeditor.js"></script>
        <script src="assets/vendor_components/datatable/datatables.min.js"></script>


        <script src="assets/vendor_components/sweetalert/sweetalert.min.js"></script>
        <script src="assets/vendor_components/sweetalert/jquery.sweet-alert.custom.js"></script>


        <script src="assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
        <script src="assets/vendor_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.js"></script>
        <script src="assets/vendor_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

        <script src="assets/vendor_components/select2/dist/js/select2.full.js"></script>
        <script src="assets/vendor_plugins/input-mask/jquery.inputmask.js"></script>
        <script src="assets/vendor_plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="assets/vendor_plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <script src="assets/vendor_components/moment/min/moment.min.js"></script>
        <script src="assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <script src="assets/vendor_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/vendor_plugins/timepicker/bootstrap-timepicker.min.js"></script>
        <script src="assets/vendor_plugins/iCheck/icheck.min.js"></script>
       
        <script src="js/jquery.smartmenus.js"></script>
        <script src="js/menus.js"></script>
        <script src="js/template.js"></script>

        <script src="js/pages/advanced-form-element.js"></script>

        <script src="js/pages/data-table.js"></script>
        <script>
            $(".textlimit").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && !(e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $(".numlimit").keypress(function (e) {
                if (e.which != 8 && e.which != 46 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
        </script>

      
        

        
     
    </form>


</body>
</html>
