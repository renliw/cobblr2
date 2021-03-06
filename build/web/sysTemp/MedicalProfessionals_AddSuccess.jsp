<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Admin Simplenso - Member List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="HTML5 Admin Simplenso Template" />
        <meta name="author" content="ahoekie" />

        <!-- Bootstrap -->
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" id="main-theme-script" />
        <link href="../css/themes/default.css" rel="stylesheet" id="theme-specific-script" />
        <link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

        <!-- Chosen multiselect -->
        <link type="text/css" href="../scripts/chosen/chosen/chosen.intenso.css" rel="stylesheet" />   

        <!-- Simplenso -->
        <link href="../css/simplenso.css" rel="stylesheet" />

        <!-- Renliw -->
        <link href="../css/renliw.css" rel="stylesheet" />


        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Le fav and touch icons -->
        <link rel="shortcut icon" href="../images/ico/favicon.ico" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png" />
        <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body id="members">
        <!-- Top navigation bar -->
        <jsp:include page="Navtopbar.jsp"></jsp:include>
            <!-- Main Content Area | Side Nav | Content -->
            <div class="container-fluid">
                <div class="row-fluid">
                    <!-- Side Navigation -->
                    <div class="span2">
                        <div class="member-box round-all">
                            <a><img src="../images/member_ph.png" class="member-box-avatar" /></a>
                            <span>
                                <strong>DLSU</strong><br />
                                <a>COSCA</a><br />
                                <span class="member-box-links"><a>Logout</a></span>
                            </span>
                        </div>
                    <jsp:include page="Navsidebar.jsp"></jsp:include>

                    </div><!--/span-->

                    <div class="span10">
                    <jsp:include page="ResourcesShortcut.jsp"></jsp:include>
                    <div class="row-fluid">    
                        <div class="span12 column" id="col0">
                            <div class="box" id="box-0">
                                <h4 class="box-header round-top">Add New Medical Professional Contact</h4>
                                <div class="box-container-toggle">
                                    <div class="box-content">
                                        <form class="form-horizontal">
                                            <fieldset>
                                                <legend> Medical Professional Contact Details </legend>
                                                <div class="control-group">
                                                    <label class="control-label">Name:</label>
                                                    <div class="controls">
                                                        <label class="control">John Doe</label>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label">Specialization: </label>
                                                    <div class="controls">
                                                        <label>General Physician</label>
                                                    </div> 
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="focusedInput">Contact Number:</label>
                                                    <div class="controls">
                                                        <label>(+63)9123456789</label>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="focusedInput">Email Address:</label>
                                                    <div class="controls">
                                                        <label>cosca@dlsu.edu.ph</label>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="focusedInput">Address</label>
                                                    <div class="controls">
                                                        <label>1234 Somewhere St, Somwhere City, There</label>
                                                    </div>
                                                </div>

                                                <div class="form-actions">
                                                    <a href="MedicalProfessionals.jsp"type="submit" class="btn btn-primary">Finish</a>
                                                    <a href="MedicalProfessionals_Add.jsp"type="submit" class="btn">Back</a>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>

                            </div> 
                        </div> <!--/span-->


                    </div><!--/.fluid-container-->
                    <!-- javascript Templates
                ================================================== -->
                    <!-- Placed at the end of the document so the pages load faster -->

                    <!-- jQuery -->
                    <script src="../jquery/1.8.3/jquery.min.js"></script>

                    <!-- jQuery UI Sortable -->
                    <script src="../scripts/jquery-ui/ui/minified/jquery.ui.core.min.js"></script>
                    <script src="../scripts/jquery-ui/ui/minified/jquery.ui.widget.min.js"></script>
                    <script src="../scripts/jquery-ui/ui/minified/jquery.ui.mouse.min.js"></script>
                    <script src="../scripts/jquery-ui/ui/minified/jquery.ui.sortable.min.js"></script>
                    <script src="../scripts/jquery-ui/ui/minified/jquery.ui.widget.min.js"></script>

                    <!-- Bootstrap -->
                    <script src="../bootstrap/js/bootstrap.min.js"></script>
                    <script src="../scripts/bootbox/bootbox.min.js"></script>

                    <!-- Bootstrap Date Picker -->
                    <script src="../scripts/datepicker/js/bootstrap-datepicker.js"></script>


                    <!-- jQuery Cookie -->
                    <script src="../scripts/jquery.cookie/jquery.cookie.js"></script>

                    <!-- Full Calender -->
                    <script type='text/javascript' src="../scripts/fullcalendar/fullcalendar/fullcalendar.min.js"></script>

                    <!-- CK Editor -->
                    <script type="text/javascript" src="../scripts/ckeditor/ckeditor.js"></script>

                    <!-- Chosen multiselect -->
                    <script type="text/javascript" language="javascript" src="../scripts/chosen/chosen/chosen.jquery.min.js"></script>

                    <!-- Uniform -->
                    <script type="text/javascript" language="javascript" src="../scripts/uniform/jquery.uniform.min.js"></script>

                    <!-- Simplenso Scripts -->
                    <script src="../scripts/simplenso/simplenso.js"></script>
                    </body>
                    </html>