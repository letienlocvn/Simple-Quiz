/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import loclt.question.QuestionDAO;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

/**
 *
 * @author WIN
 */
public class TeacherUpdateServlet extends HttpServlet {
    static final Logger LOGGER = Logger.getLogger(TeacherUpdateServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc = request.getServletContext();
        Map<String, String> file = (Map<String, String>) sc.getAttribute("FILE");
        String url = file.get("teacherUpdateJSP");
        try {
            String questionID = request.getParameter("txtQuestionID");
            String subjectID = request.getParameter("cbbox");
            String questionContent = request.getParameter("txtQuestionContent");
            String answerOption1 = request.getParameter("txtAnswerOne");
            String answerOption2 = request.getParameter("txtAnswerTwo");
            String answerOption3 = request.getParameter("txtAnswerThree");
            String answerOption4 = request.getParameter("txtAnswerFour");
            String answerCorrect = request.getParameter("radioCorrectAnswer");
            String status = request.getParameter("cbboxStatus");
            boolean changeStatus = false;
            if (status.equals("true")) {
                changeStatus = true;
            }
            String optionCorrect = null;
            if (answerCorrect.equals("option1")) {
                optionCorrect = String.valueOf(answerOption1);
            } else if (answerCorrect.equals("option2")) {
                optionCorrect = String.valueOf(answerOption2);
            } else if (answerCorrect.equals("option3")) {
                optionCorrect = String.valueOf(answerOption3);
            } else if (answerCorrect.equals("option4")) {
                optionCorrect = String.valueOf(answerOption4);
            }
            QuestionDAO question = new QuestionDAO();
            boolean result = question.updateQuestion(questionID, subjectID, changeStatus, questionContent, answerOption1, answerOption2, answerOption3, answerOption4, optionCorrect);
            if (result) {
                url = file.get("teacher");
            }
        } catch (NamingException | SQLException ex) {
            BasicConfigurator.configure();
            LOGGER.error("ERROR at TeacherUpdateServlet: " + ex.getMessage());
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
