/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.quiz;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import loclt.question.QuestionDAO;
import loclt.question.QuestionDTO;
import loclt.utils.DBUtils;

/**
 *
 * @author WIN
 */
public class QuizDetailDAO implements Serializable {

    public List<QuizDetailDTO> getAllListQuizDetails(String scoreID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<QuizDetailDTO> listQuizDetails = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select quizDetailID,scoreID,questionID,chooseAnswer "
                        + "from tblQuizDetails "
                        + "where scoreID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, scoreID);
                QuestionDAO question = new QuestionDAO();
                rs = stm.executeQuery();
                while (rs.next()) {
                    String quizDetailID = rs.getString("quizDetailID");
                    scoreID = rs.getString("scoreID");
                    String questionID = rs.getString("questionID");
                    QuestionDTO questionDTO = question.findQuestion(questionID);
                    String chooseAnswer = rs.getString("chooseAnswer");
                    QuizDetailDTO quiz = new QuizDetailDTO(quizDetailID, scoreID, questionDTO, chooseAnswer);
                    if (listQuizDetails == null) {
                        listQuizDetails = new ArrayList<>();
                    }
                    listQuizDetails.add(quiz);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listQuizDetails;
    }

    public QuizDetailDTO getQuizDetailsByID(String scoreID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        QuizDetailDTO listQuizDetails = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select quizDetailID,scoreID,questionID,chooseAnswer "
                        + "from tblQuizDetails "
                        + "where scoreID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, scoreID);
                QuestionDAO question = new QuestionDAO();
                rs = stm.executeQuery();
                if (rs.next()) {
                    String quizDetailID = rs.getString("quizDetailID");
                    scoreID = rs.getString("scoreID");
                    String questionID = rs.getString("questionID");
                    QuestionDTO questionDTO = question.findQuestion(questionID);
                    String chooseAnswer = rs.getString("chooseAnswer");
                    listQuizDetails = new QuizDetailDTO(quizDetailID, scoreID, questionDTO, chooseAnswer);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listQuizDetails;
    }

    public void createQuizDetails(String quizID, String scoreID, String questionID, String chooseAnswer) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Insert into tblQuizDetails(quizDetailID, scoreID, questionID, chooseAnswer) "
                        + "values (?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, quizID);
                stm.setString(2, scoreID);
                stm.setString(3, questionID);
                stm.setString(4, chooseAnswer);
                stm.executeUpdate();

            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
