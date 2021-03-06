/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cosca;

import Utilities.Year;
import dbdao.NotificationDAO;
import dbdao.ProjectCharterDAO;
import dbdao.StudentOrgDAO;
import dbentities.NotificationEntity;
import dbentities.ProjectCharterEntity;
import dbentities.StudentOrgEntity;
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
public class FinalizeInitialProjectCharter extends HttpServlet {

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

                ProjectCharterEntity initialCharter = (ProjectCharterEntity) session.getAttribute("initialCharter");
                String communityDetail = (String) session.getAttribute("CommunityDetail");
                String[] communityName = communityDetail.split("-");

                request.setAttribute("communityName", communityName[1]);
                request.setAttribute("initialCharter", initialCharter);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/sysCOSCA/FinalizeInitialProjectCharter.jsp");
                dispatcher.forward(request, response);
            } else if (request.getMethod().equals("POST")) {
                HttpSession session = request.getSession();

                ProjectCharterEntity initialCharter = (ProjectCharterEntity) session.getAttribute("initialCharter");

                ProjectCharterDAO initialCharterDAO = new ProjectCharterDAO();
                boolean addDB = initialCharterDAO.createNewProject(initialCharter);

                StudentOrgDAO sorgDAO = new StudentOrgDAO();
                List<StudentOrgEntity> sorg = sorgDAO.getUserDetails();

                for (int x = 1; x < sorg.size(); x++) {
                    if (addDB) {
                        initialCharterDAO = new ProjectCharterDAO();
                        int project_id_last = initialCharterDAO.getLastId();

                        NotificationEntity notif = new NotificationEntity();
                        notif.setOrg_id(sorg.get(x).getId());
                        notif.setNotificationtext("Org_NewProject");
                        notif.setViewed(1);
                        notif.setProject_id(project_id_last);
                        notif.setComments("");
                        notif.setDate(Year.getCurrentDateinCalendar().getTime());

                        NotificationDAO notifDAO = new NotificationDAO();
                        addDB = notifDAO.insertNotif(notif);
                    }
                }

                if (addDB) {
                    session.removeAttribute("projectType");
                    session.removeAttribute("initialCharter");
                    session.removeAttribute("CommunityDetail");
                    response.sendRedirect("ProjectsAvailable");
                } else {
                    response.sendRedirect("ErrorInDB.jsp");
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
