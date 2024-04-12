<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="site.AddEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link rel="icon" type="image/jpg" href="images/1.png">

    <title>: Welcome</title>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-full">
          
            <div class="content-header">
                <div class="d-flex align-items-center">
                    <div class="me-auto">

                        <h3 class="page-title">Add Employee</h3>
                        <div class="d-inline-block align-items-center">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
                                   
                                    <li class="breadcrumb-item active" aria-current="page">Employee</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <asp:UpdatePanel ID="UpClients" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                <ContentTemplate>

                    <div class="card" id="DivAdd" runat="server">



                        <div class="card-body card-padding">
                            <div class="row">
                                <div class="col-lg-2 col-md-4 col-sm-6">
                                    <label>Employee Name <span style="color: red">*</span></label>
                                    <div class="form-group fg-line textlimit">
                                        <asp:TextBox ID="txtEName" runat="server" type="text" class="form-control input-sm" placeholder="Ex.Emp"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Employee Name" ControlToValidate="txtEName"
                                            Style="color: red" Display="Dynamic" ValidationGroup="CP"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-6">
                                    <label>Full Name<span style="color: red">*</span></label>
                                    <div class="form-group fg-line textlimit">
                                        <asp:TextBox ID="txtFullName" ClientIDMode="Static" runat="server" type="text" class="form-control input-sm ckeditor" placeholder="Ex.Abc"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Full Name " ControlToValidate="txtFullName"
                                            Style="color: red" Display="Dynamic" ValidationGroup="CP"></asp:RequiredFieldValidator>

                                    </div>
                                </div>


                                <div class="col-lg-2 col-md-4 col-sm-12">
                                    <div class="form-group">

                                        <label>Date Of Birth  <span class="start-label" style="color: red">*</span></label>
                                        <asp:TextBox ID="txtDob" class="form-control" TextMode="Date" runat="server"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Select Date" ControlToValidate="txtDob" Style="color: red" Display="Dynamic" ValidationGroup="CP"></asp:RequiredFieldValidator>
                                      
                                    </div>
                                </div>


                                <div class="col-lg-2 col-md-4 col-sm-12">
                                    <div class="form-group">

                                        <label>Date Of Join <span class="start-label" style="color: red">*</span></label>
                                        <asp:TextBox ID="txtDoj" class="form-control" TextMode="Date" runat="server"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Select Date" ControlToValidate="txtDoj" Style="color: red" Display="Dynamic" ValidationGroup="CP"></asp:RequiredFieldValidator>
                                      
                                    </div>
                                </div>




                                <div class="col-lg-2 col-md-6 col-sm-12 ">
                                    <div class="form-group">
                                        <label>
                                            Select Manager
                                                               
                                        </label>
                                        <asp:DropDownList ID="drpMaager" runat="server" class="form-control select2">
                                            <asp:ListItem Value="0"> Select Manager</asp:ListItem>
                                            <asp:ListItem Value="1">A</asp:ListItem>
                                            <asp:ListItem Value="2">B</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>

                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-4">
                                    <label>Upload Image<span style="color: red">*</span></label>
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <span class="btn btn-primary btn-file m-r-10">
                                            <span class="fileinput-new">Upload  Image </span>

                                            <asp:FileUpload ID="FileUpload1" runat="server" type="file" ClientIDMode="Static" accept="..jpg,.png,.PNG,.JPG,.jpeg,.JPEG" />
                                     
                                            </span>
                                        <span class="fileinput-filename"></span>

                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Upload Image " ControlToValidate="FileUpload1"
                                        Style="color: red" Display="Dynamic" ValidationGroup="CP"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-4">

                                    <div class="form-group without-lable-checkbox ">
                                        <asp:CheckBox ID="chkDisplay" runat="server" Text="Is Display" class="filled-in" />
                                    </div>
                                </div>
                                <div class="col-lg-10 col-md-4 col-sm-4">
                                    <div class="form-group pull-right without-lable-checkbox">
                                        <asp:Button ID="btnsubmit" class="btn btn-primary" ValidationGroup="CP" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                                        <asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-6">
                                    <asp:Image ID="img" runat="server" Visible="false" CssClass="img-responsive center-block" Style="height: 100px" />
                                </div>


                            </div>


                        </div>
                    </div>




                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnsubmit" />

                </Triggers>
            </asp:UpdatePanel>

            <script type="text/javascript">
                $('#FileUpload1').bind('change', function () {
                    var maxFileSize = 5248000; 
                    var fileUpload = $('#FileUpload1');

                    if (fileUpload.val() == '') {
                        return false;
                    }
                    else {
                        if (fileUpload[0].files[0].size < maxFileSize) {
                            $('#btnsave').prop('disabled', false);
                        
                            return true;
                        } else {
                            $('#btnsave').prop('disabled', true);

                            alert('File too Large.. 5 MB Size Allowed.. !');

                            return false;
                        }
                    }
                });
            </script>
            <script>
                var file = document.getElementById('FileUpload1');

                file.onchange = function (e) {
                    var ext = this.value.match(/\.([^\.]+)$/)[1];
                    switch (ext) {
                        case 'jpg':
                        case 'PNG':
                        case 'png':
                        case 'JPG':
                        case 'jpeg':
                        case 'JPEG':

                            break;
                        default:
                            alert('This File-Format not Allowed');
                            this.value = '';
                    }

                };
            </script>
            <script>

                $('#FileUpload1').bind('change', function () {
                    var fileUpload = $("#FileUpload1")[0];
                    var reader = new FileReader();
                
                    reader.readAsDataURL(fileUpload.files[0]);
                    reader.onload = function (e) {
                      
                        var image = new Image();
                        
                        image.src = e.target.result;
                        image.onload = function () {
                           
                            var imgheight = this.height;
                            var imgwidth = this.width;
                            $("#width").text(imgwidth);
                            $("#height").text(imgheight);
                            if (imgheight <= "610" && imgwidth <= "680") {

                              
                                return true;
                            } else {
                                alert("Height and Width must be greater than 680*610 px.");
                                $(fileUpload).val('');
                                return false;
                            }
                        };
                    }

                });
            </script>

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

       
            

        </div>
    </form>
</body>
</html>
