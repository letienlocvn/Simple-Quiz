/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import loclt.question.QuestionDAO;
import loclt.question.QuestionDTO;
import loclt.quiz.QuizDetailDAO;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

/**
 *
 * @author WIN
 */
public class StudentCompleteQuizServlet extends HttpServlet {

    static final Logger LOGGER = Logger.getLogger(StudentCompleteQuizServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc = request.getServletContext();
        Map<String, String> file = (Map<String, String>) sc.getAttribute("FILE");
        String url = file.get("score");
        try {
            HttpSession session = request.getSession();
            List<QuestionDTO> listCheckQuestion = (List<QuestionDTO>) session.getAttribute("TAKEQUIZLIST");
            int score = 0;
            QuestionDAO question = new QuestionDAO();
            String uniqueID = UUID.randomUUID().toString();
            String username = request.getParameter("txtUsername");
            String subject = request.getParameter("txtSubject");
            String scoreID = username + "-" + uniqueID;

            QuizDetailDAO quiz = new QuizDetailDAO();

            boolean result = question.insertInfor(username, scoreID, new Date(), score, subject);
            int count = 0;
            if (result) {
                for (QuestionDTO questionDTO : listCheckQuestion) {
                    String quizID = uniqueID + "-details-" + count++;
                    String questionID = questionDTO.getQuestionID();
                    String answer = questionDTO.getAnswerCorrect();
                    String chooseAnswer = request.getParameter("radioCorrectAnswer_" + questionID);
                    quiz.createQuizDetails(quizID, scoreID, questionID, chooseAnswer);
                    if (answer.equals(chooseAnswer)) {
                        score += 1;
                        request.setAttribute("SCORE", score);
                        question.updateScore(score, scoreID);
                    }
                }
            }

        } catch (SQLException | NamingException e) {
            BasicConfigurator.configure();
            LOGGER.error("ERROR at StudentCompleteQuizServlet: " + e.getMessage());
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
