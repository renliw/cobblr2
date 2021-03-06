/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cosca;

import Utilities.Year;
import classes.PersonalSurveyResults;
import classes.SurveyResults;
import dbdao.ProjectTypesDAO;
import dbentities.ProjectTypesEntity;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Renliw
 */
public class CommunitySurvey extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getMethod().equals("GET")) {
                HttpSession session = request.getSession();
                session.removeAttribute("initialCharter");
                String communityDetail = (String) session.getAttribute("CommunityDetail");
                String[] communityName = communityDetail.split("-");

                ProjectTypesDAO typesDAO = new ProjectTypesDAO();
                List<ProjectTypesEntity> types = typesDAO.getAllTypes();

                SurveyResults currentResult = new SurveyResults(Integer.parseInt(communityName[0]), Year.getCurrentYear());
                SurveyResults pastResult = new SurveyResults(Integer.parseInt(communityName[0]), Year.getPreviousYear());
                PersonalSurveyResults currentPerResult = new PersonalSurveyResults(Integer.parseInt(communityName[0]), Year.getCurrentYear());
                PersonalSurveyResults pastPerResult = new PersonalSurveyResults(Integer.parseInt(communityName[0]), Year.getPreviousYear());

                request.setAttribute("types", types);
                request.setAttribute("currentResult", currentResult);
                request.setAttribute("pastResult", pastResult);
                request.setAttribute("currentPerResult", currentPerResult);
                request.setAttribute("pastPerResult", pastPerResult);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/sysCOSCA/CommunitySurvey.jsp");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("/sysCOSCA/newjsp.jsp");
                dispatcher.forward(request, response);
            } else if (request.getMethod().equals("POST")) {
                HttpSession session = request.getSession();

                String communityDetail = (String) session.getAttribute("CommunityDetail");
                String[] communityName = communityDetail.split("-");

                String action = request.getParameter("action");
                String projectType = request.getParameter("typeOfProjects");
                switch (action) {
                    case "EncodeCommunitySurvey":

                        session.setAttribute("community_id", communityName[0]);
                        session.setAttribute("community_name", communityName[1]);

                        response.sendRedirect("EncodeCommunitySurvey");
                        break;
                    case "CreateInitialProjectCharter":

                        session.setAttribute("projectType", projectType);
                        response.sendRedirect("CreateInitialProjectCharter");
                        break;
                }

            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
