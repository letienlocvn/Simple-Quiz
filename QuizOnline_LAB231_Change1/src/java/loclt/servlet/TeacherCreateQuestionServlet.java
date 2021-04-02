/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import loclt.question.QuestionCreateErr;
import loclt.question.QuestionDAO;
import loclt.question.QuestionDTO;
import loclt.subject.SubjectDAO;
import loclt.subject.SubjectDTO;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

/**
 *
 * @author WIN
 */
public class TeacherCreateQuestionServlet extends HttpServlet {
    static final Logger LOGGER = Logger.getLogger(TeacherCreateQuestionServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc = request.getServletContext();
        Map<String, String> file = (Map<String, String>) sc.getAttribute("FILE");
        String url = file.get("teacherCreateQuestionJSP");
        String questionID = request.getParameter("txtQuestionID");
        String answerCorrect = request.getParameter("radioCorrectAnswer");
        String questionContent = request.getParameter("txtQuestionContent");
        String answerOp1 = request.getParameter("txtAnswerOne");
        String answerOp2 = request.getParameter("txtAnswerTwo");
        String answerOp3 = request.getParameter("txtAnswerThree");
        String answerOp4 = request.getParameter("txtAnswerFour");
        QuestionCreateErr errors = new QuestionCreateErr();

        try {
            //1. Check validate of 07 users
            boolean flag = false;
            if (questionID.trim().length() < 1) {
                flag = true;
                errors.setQuestionIDErr("QuestionID requires typing than 1 character");
            }
            if (questionContent.trim().length() < 1) {
                flag = true;
                errors.setQuestionContentErr("Content question requires typing than 1 character");
            }
            if (answerOp1.trim().length() < 1) {
                flag = true;
                errors.setAnswerOption1Err("Option 1 requires typing than 1 character");
            }
            if (answerOp2.trim().length() < 1) {
                flag = true;
                errors.setAnswerOption2Err("Option 2 requires typing than 1 character");
            }
            if (answerOp3.trim().length() < 1) {
                flag = true;
                errors.setAnswerOption3Err("Option 3 requires typing than 1 character");
            }
            if (answerOp4.trim().length() < 1) {
                flag = true;
                errors.setAnswerOption4Err("Option 4 requires typing than 1 character");
            }
            if (flag) {
                //2.1 Store errors into scope
                request.setAttribute("CREATER", errors);
            } else {
                //2.2 Call DAO  to insert to DB
                QuestionDAO question = new QuestionDAO();
                String optionCorrect = null;
                if (answerCorrect.equals("option1")) {
                    optionCorrect = String.valueOf(answerOp1);
                } else if (answerCorrect.equals("option2")) {
                    optionCorrect = String.valueOf(answerOp2);
                } else if (answerCorrect.equals("option3")) {
                    optionCorrect = String.valueOf(answerOp3);
                } else if (answerCorrect.equals("option4")) {
                    optionCorrect = String.valueOf(answerOp4);
                }
                String subjectID = request.getParameter("cbbox");
                SubjectDAO subject = new SubjectDAO();
                SubjectDTO subjectDTO = subject.findSubject(subjectID);                
                QuestionDTO questionDTO = new QuestionDTO(questionID, questionContent, optionCorrect, answerOp1, answerOp2, answerOp3, answerOp4, new Date(), subjectDTO, true);

                boolean result = question.createQuestion(questionDTO);
                if (result) {
                    url = file.get("teacher");
                }
            }
        } catch (NamingException ex) {
            BasicConfigurator.configure();
            LOGGER.error("ERROR at TeacherCreateQuestionServlet: " + ex.getMessage());
        } catch (SQLException ex) {
            errors.setQuestionIDErr(questionID + " is exits in system");
            request.setAttribute("CREATER", errors);
            BasicConfigurator.configure();
            LOGGER.error("ERROR at TeacherCreateQuestionServlet: " + ex.getMessage());
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
