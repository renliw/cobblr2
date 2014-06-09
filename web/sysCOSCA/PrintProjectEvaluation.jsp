
<%@page import="Utilities.GetPercentage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utilities.Converter"%>
<%@page import="ReportProjectEval.ProjectEvalReport"%>

<%@taglib uri="http://pd4ml.com/tlds/pd4ml/2.5" prefix="pd4ml" %>
<%@page contentType="text/html; charset=utf-8" %>
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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" />

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

    <pd4ml:transform screenWidth="1000" pageFormat="LETTER" pageOrientation="landscape" pageInsets="15,50,25,25,points" enableImageSplit="false" >
        <body id="members">
            <!-- Main Content Area | Side Nav | Content -->
            <div class="container-fluid">
                <div class="row-fluid">  
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="box" id="box-3">         
                                <div class="box-container-toggle">
                                    <div class="box-content">
                                        <%
                                            ProjectEvalReport project = (ProjectEvalReport) request.getAttribute("project");
                                        %>

                                        <h1 align="center">Center for Social Concern and Action </h1>
                                        <h2 align="center">Project Evaluation Summary</h2>
                                        <h2 align="center">Project: "<%=project.getProjectTitle()%>"</h2>
                                        <h3 align="center">Evaluated on: <%=Converter.toStringFullMdy(project.getDateEvaluated())%></h3>


                                        <br>
                                        <div class="row">
                                            <div class="col-md-10 col-md-offset-1">

                                                <br><br>
                                                <div style="margin-left: 80px">
                                                    <b>Evaluation From Student Organization</b> <br>
                                                    Sponsoring Student:  <%=project.getStudentOrg()%> <br>
                                                    Evaluated by: <%=project.getStudentName()%> <br><br>
                                                </div>
                                                <br>
                                                <table align="center" class="table table-striped table-bordered">

                                                    <thead>
                                                        <tr>
                                                            <th>Overall Project Objectives</th>
                                                            <th align="right">Evaluation</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1.	The activity was well-organized and flowed smoothly.</td>
                                                            <td align="right"><%=Converter.toSurveyAnswer(project.getStudentEvalAnswers().get(51))%></td>
                                                        </tr> 
                                                        <tr>
                                                            <td>2.	Registration procedures were conducted smoothly and effectively.</td>
                                                            <td align="right"><%=Converter.toSurveyAnswer(project.getStudentEvalAnswers().get(52))%></td>
                                                        </tr> 
                                                        <tr>
                                                            <td>3.	I was able aid and assist the medical practitioners properly and utilized my ability.</td>
                                                            <td align="right"><%=Converter.toSurveyAnswer(project.getStudentEvalAnswers().get(53))%></td>
                                                        </tr> 
                                                        <tr>
                                                            <td>4.	The resources (medicines, freebies, volunteers, etc.) were properly distributed in the activity were sufficient.</td>
                                                            <td align="right"><%=Converter.toSurveyAnswer(project.getStudentEvalAnswers().get(54))%></td>
                                                        </tr> 
                                                        <tr>
                                                            <td>5.	The activity provided quality services to the community. </td>
                                                            <td align="right"><%=Converter.toSurveyAnswer(project.getStudentEvalAnswers().get(55))%></td>
                                                        </tr>
                                                        <tr>
                                                            <td>6.	The time allotted to the activity was sufficient to attend to the needs of the community.</td>
                                                            <td align="right"><%=Converter.toSurveyAnswer(project.getStudentEvalAnswers().get(56))%></td>
                                                        </tr> 
                                                        <tr>
                                                            <td>7.	I was able to serve the community and attend to the patients</td>
                                                            <td align="right"><%=Converter.toSurveyAnswer(project.getStudentEvalAnswers().get(57))%></td>
                                                        </tr> 
                                                    </tbody>
                                                </table>

                                                <pd4ml:page.break/>
                                                <br><br><br>
                                                <div style="vertical-align: middle ">
                                                    <b>Evaluation From Partner Community</b> <br>
                                                    Partner Community: <%=project.getCommunityName()%><br>
                                                    No. of Participants: <%=project.getNumSurveyed()%><br>
                                                </div>
                                                <br>

                                                <%
                                                    ArrayList<Integer> answerindex = new ArrayList();
                                                    ArrayList<Integer> value = new ArrayList();
                                                    for (int x = 61; x < 69; x++) {
                                                        int answer = 0;
                                                        int num = 0;
                                                        for (int y = 201; y < 206; y++) {
                                                            if (project.getBeneficiaryEvalTally().get(x).getAnswerset().get(y) != null) {
                                                                int current = project.getBeneficiaryEvalTally().get(x).getAnswerset().get(y);
                                                                if (current > num) {
                                                                    answer = y;
                                                                    num = current;
                                                                }
                                                            }
                                                        }
                                                        answerindex.add(answer);
                                                        value.add(num);
                                                    }
                                                %>


                                                <table align="center" class="table table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Overall Project Objectives</th>
                                                            <th>Evaluation</th>
                                                            <th>Percentage of Beneficiaries</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1.	The activity was well-organized and flowed smoothly.</td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(0))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(0), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                        <tr>
                                                            <td>2.	Registration procedures were conducted smoothly and effectively.</td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(1))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(1), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                        <tr>
                                                            <td>3.	The activity was relevant and catered to my health needs.</td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(2))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(2), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                        <tr>
                                                            <td>4.	The resources (medicines, freebies, volunteers, etc.) provided in the activity were sufficient and were properly distributed.</td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(3))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(3), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                        <tr>
                                                            <td>5.	The activity provided quality services to the community. </td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(4))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(4), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                        <tr>
                                                            <td>6.	The time allotted to the activity was sufficient to attend to my needs.</td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(5))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(5), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                        <tr>
                                                            <td>7.	The medical practitioners, health workers and volunteers were fully engaged in the activity and my needs.</td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(6))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(6), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                        <tr>
                                                            <td>8.	The activity met my expectations.</td>
                                                            <td align="center"><%=Converter.toSurveyAnswer(answerindex.get(7))%></td>
                                                            <td align="left"><%=GetPercentage.getPercent(value.get(7), project.getNumSurveyed())%>%</td>
                                                        </tr> 
                                                    </tbody>
                                                </table>

                                                        <br><br><br><br>
                                                <div class="container">
                                                    <p align="center">Date Printed: <%=Converter.toString(project.getDatePrinted())%> </p>
                                                </div>

                                            </div>
                                        </div><!--/span-->
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/.fluid-container-->
            <!-- javascript Templates
        ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->

            <!-- jQuery -->
            <script src="../jquery/1.8.3/jquery.min.js"></script>

            <!-- Bootstrap -->
            <script src="../bootstrap/js/bootstrap.min.js"></script>
            <script src="../scripts/bootbox/bootbox.min.js"></script>

            <!-- Simplenso Scripts -->
            <script src="../scripts/simplenso/simplenso.js"></script>
        </body>
        <pd4ml:footer

            pageNumberTemplate="Page $[page] of $[total]"
            titleTemplate="Pro-Health Case-Project Management System"
            titleAlignment="left"
            pageNumberAlignment="right"
            color="#00000"
            initialPageNumber="1"
            pagesToSkip="0"
            fontSize="12"
            fontFace="Arial"
            areaHeight="16"/>
    </pd4ml:transform>
</html>