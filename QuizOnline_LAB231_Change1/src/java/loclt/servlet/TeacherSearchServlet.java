/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import loclt.question.QuestionDAO;
import loclt.question.QuestionDTO;

/**
 *
 * @author WIN
 */
public class TeacherSearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc = request.getServletContext();
        Map<String, String> file = (Map<String, String>) sc.getAttribute("FILE");
        String url = file.get("teacherSearchJSP");
        try {
            QuestionDAO question = new QuestionDAO();
            String searchValue = request.getParameter("txtSearch");
            boolean changeStatus = false;
            String category = request.getParameter("cbCategory");
            String isSubject = "opSubject";
            String isQuestion = "opQuestion";
            //Paging
            String pageIndex = request.getParameter("pageIndex");
            if (pageIndex == null) {
                pageIndex = "1";
            }
            int index = Integer.parseInt(pageIndex);
            int questionInPage = 20;
            int count = question.getCountValueOfSearch(searchValue);
            int sizeOfPage = count / questionInPage;
            if (count % questionInPage != 0) {
                sizeOfPage++;
            }

            if (!searchValue.trim().isEmpty()) {
                String cbStatus = request.getParameter("cbStatus");
                if (category.contains(isQuestion)) {
                    if (cbStatus.equals("1")) {
                        changeStatus = true;
                    }
                    List<QuestionDTO> listQuestion
                            = question.searchQuestion(index, questionInPage, searchValue, changeStatus);
                    request.setAttribute("SEARCHQUESTIONRESULT", listQuestion);
                } else if (category.contains(isSubject)) {
                    if (cbStatus.equals("1")) {
                        changeStatus = true;
                    }
                    System.out.println("Hello Subject");
                    List<QuestionDTO> listSubject
                            = question.searchSubject(index, questionInPage, searchValue, changeStatus);
                    request.setAttribute("SEARCHSUBJECTRESTUL", listSubject);
                }
            }
            request.setAttribute("SIZEOFSEARCH", sizeOfPage);

        } catch (SQLException | NamingException e) {
            log("Error at TeacherSearchServlet" + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
