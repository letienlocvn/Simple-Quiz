/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.question;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import loclt.subject.SubjectDAO;
import loclt.subject.SubjectDTO;
import loclt.utils.DBUtils;

/**
 *
 * @author WIN
 */
public class QuestionDAO implements Serializable {

    List<QuestionDTO> listQuestion;

    public List<QuestionDTO> getListQuestion() {
        return listQuestion;
    }

    public boolean insertInfor(String username, String scoreID, Date dateOfCreate, int totalScore, String subject) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Insert into tblScores (username,totalScore,scoreID,DateOfCreate,subjectName) "
                        + "values(?,?,?,?,?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setInt(2, totalScore);
                stm.setString(3, scoreID);
                stm.setTimestamp(4, new Timestamp(dateOfCreate.getTime()));
                stm.setString(5, subject);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<QuestionDTO> getAllQuestion() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4, "
                        + "dateOfCreate,status "
                        + "from tblQuestion";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                SubjectDAO subjectDAO = new SubjectDAO();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("question_content");
                    String answerOption1 = rs.getString("answer_option1");
                    String answerOption2 = rs.getString("answer_option2");
                    String answerOption3 = rs.getString("answer_option3");
                    String answerOption4 = rs.getString("answer_option4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date dateOfCreate = rs.getDate("dateOfCreate");
                    String subjectID = rs.getString("subjectID");
                    SubjectDTO subjectDTO = subjectDAO.findSubject(subjectID);
                    boolean status = rs.getBoolean("status");
                    QuestionDTO dto = new QuestionDTO(questionID, questionContent,
                            answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4,
                            dateOfCreate, subjectDTO, status);
                    if (this.listQuestion == null) {
                        this.listQuestion = new ArrayList<>();
                    }
                    this.listQuestion.add(dto);
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
        return listQuestion;
    }

    public void updateScore(int score, String scoreID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Update tblScores set totalScore = ? where scoreID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, score);
                stm.setString(2, scoreID);
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

    public List<QuestionDTO> getAllQuestionPaging(int index, int questionHasInPage)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4,"
                        + "dateOfCreate,status from "
                        + "(select ROW_NUMBER() over (Order by questionID) as row ,"
                        + "questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4, "
                        + "dateOfCreate,status "
                        + "from tblQuestion) as x "
                        + "where row between (?-1)*?+1 and ?*?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, index);
                stm.setInt(2, questionHasInPage);
                stm.setInt(3, index);
                stm.setInt(4, questionHasInPage);
                rs = stm.executeQuery();
                SubjectDAO subjectDAO = new SubjectDAO();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("question_content");
                    String answerOption1 = rs.getString("answer_option1");
                    String answerOption2 = rs.getString("answer_option2");
                    String answerOption3 = rs.getString("answer_option3");
                    String answerOption4 = rs.getString("answer_option4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date dateOfCreate = rs.getDate("dateOfCreate");
                    String subjectID = rs.getString("subjectID");
                    SubjectDTO subjectDTO = subjectDAO.findSubject(subjectID);
                    boolean status = rs.getBoolean("status");
                    QuestionDTO dto = new QuestionDTO(questionID, questionContent,
                            answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4,
                            dateOfCreate, subjectDTO, status);
                    if (this.listQuestion == null) {
                        this.listQuestion = new ArrayList<>();
                    }
                    this.listQuestion.add(dto);
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
        return listQuestion;
    }

    public int getNumberOfQuestion() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select COUNT(questionID) as numberOfQuestion from tblQuestion";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int numberOfQuestion = rs.getInt("numberOfQuestion");
                    return numberOfQuestion;
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
        return -1;
    }

    public int getCountValueOfSearch(String txtSearch) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select COUNT(questionID) as numberOfQuestion from tblQuestion where question_content like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                rs = stm.executeQuery();
                if (rs.next()) {
                    int numberOfQuestion = rs.getInt("numberOfQuestion");
                    return numberOfQuestion;
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
        return -1;
    }

    public List<QuestionDTO> searchQuestion(int index, int questionHasInPage, String searchValue, boolean status) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4,"
                        + "dateOfCreate,status from "
                        + "(select ROW_NUMBER() over (Order by questionID) as row ,"
                        + "questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4, "
                        + "dateOfCreate,status "
                        + "from tblQuestion where question_content like ? and status = ?) as x "
                        + "where row between (?-1)*?+1 and ?*?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setBoolean(2, status);
                stm.setInt(3, index);
                stm.setInt(4, questionHasInPage);
                stm.setInt(5, index);
                stm.setInt(6, questionHasInPage);
                rs = stm.executeQuery();
                SubjectDAO subjectDAO = new SubjectDAO();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("question_content");
                    String answerOption1 = rs.getString("answer_option1");
                    String answerOption2 = rs.getString("answer_option2");
                    String answerOption3 = rs.getString("answer_option3");
                    String answerOption4 = rs.getString("answer_option4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date dateOfCreate = rs.getDate("dateOfCreate");
                    String subjectID = rs.getString("subjectID");
                    SubjectDTO subjectDTO = subjectDAO.findSubject(subjectID);
                    status = rs.getBoolean("status");
                    QuestionDTO dto = new QuestionDTO(questionID, questionContent,
                            answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4,
                            dateOfCreate, subjectDTO, status);
                    if (this.listQuestion == null) {
                        this.listQuestion = new ArrayList<>();
                    }
                    this.listQuestion.add(dto);
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
        return listQuestion;
    }

    public List<QuestionDTO> searchSubject(int index, int questionHasInPage, String searchValue, boolean status) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4,"
                        + "dateOfCreate,status from "
                        + "(select ROW_NUMBER() over (Order by questionID) as row ,"
                        + "questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4, "
                        + "dateOfCreate,status "
                        + "from tblQuestion where subjectID = (Select subjectID from tblSubjects where subjectName like ? and status = ? )) as x "
                        + "where row between (?-1)*?+1 and ?*?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setBoolean(2, status);
                stm.setInt(3, index);
                stm.setInt(4, questionHasInPage);
                stm.setInt(5, index);
                stm.setInt(6, questionHasInPage);
                rs = stm.executeQuery();
                SubjectDAO subjectDAO = new SubjectDAO();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("question_content");
                    String answerOption1 = rs.getString("answer_option1");
                    String answerOption2 = rs.getString("answer_option2");
                    String answerOption3 = rs.getString("answer_option3");
                    String answerOption4 = rs.getString("answer_option4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date dateOfCreate = rs.getDate("dateOfCreate");
                    String subjectID = rs.getString("subjectID");
                    SubjectDTO subjectDTO = subjectDAO.findSubject(subjectID);
                    status = rs.getBoolean("status");
                    QuestionDTO dto = new QuestionDTO(questionID, questionContent,
                            answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4,
                            dateOfCreate, subjectDTO, status);
                    if (this.listQuestion == null) {
                        this.listQuestion = new ArrayList<>();
                    }
                    this.listQuestion.add(dto);
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
        return listQuestion;
    }

    public boolean createQuestion(QuestionDTO question) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Insert into tblQuestion"
                        + "(questionID,subjectID, question_content,answer_correct,"
                        + " answer_option1,answer_option2,answer_option3,answer_option4, status,dateOfCreate) "
                        + "values (?,?,?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, question.getQuestionID());
                stm.setString(2, question.getSubjectDTO().getSubjectID());
                stm.setString(3, question.getQuestionContent());
                stm.setString(4, question.getAnswerCorrect());
                stm.setString(5, question.getAnswerOption1());
                stm.setString(6, question.getAnswerOption2());
                stm.setString(7, question.getAnswerOption3());
                stm.setString(8, question.getAnswerOption4());
                stm.setBoolean(9, true);
                stm.setTimestamp(10, new Timestamp(question.getDateOfCreate().getTime()));
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<QuestionDTO> getQuestionByID(String questionID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4,"
                        + "dateOfCreate,status from tblQuestion "
                        + "where questionID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, questionID);
                rs = stm.executeQuery();
                SubjectDAO subject = new SubjectDAO();
                if (rs.next()) {
                    questionID = rs.getString("questionID");
                    String questionContent = rs.getString("question_content");
                    String answerCorrect = rs.getString("answer_correct");
                    String subjectID = rs.getString("subjectID");
                    SubjectDTO subjectDTO = subject.findSubject(subjectID);
                    String answerOption1 = rs.getString("answer_option1");
                    String answerOption2 = rs.getString("answer_option2");
                    String answerOption3 = rs.getString("answer_option3");
                    String answerOption4 = rs.getString("answer_option4");
                    Date dateOfCreate = rs.getDate("dateOfCreate");
                    boolean status = rs.getBoolean("Status");
                    QuestionDTO dto = new QuestionDTO(questionID, questionContent, answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4, dateOfCreate, subjectDTO, status);
                    if (this.listQuestion == null) {
                        this.listQuestion = new ArrayList<>();
                    }
                    this.listQuestion.add(dto);
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
        return listQuestion;
    }

    public boolean updateQuestion(String questionID, String subjectID, boolean status,
            String questionContent, String answerOption1, String answerOption2, String answerOption3, String answerOption4,
            String answerCorrect) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Update tblQuestion set subjectID = ?, status = ?, question_content = ?, "
                        + "answer_option1=?, answer_option2=?, answer_option3=?, answer_option4=?, answer_correct = ? "
                        + "where questionID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, subjectID);
                stm.setBoolean(2, status);
                stm.setString(3, questionContent);
                stm.setString(4, answerOption1);
                stm.setString(5, answerOption2);
                stm.setString(6, answerOption3);
                stm.setString(7, answerOption4);
                stm.setString(8, answerCorrect);
                stm.setString(9, questionID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteQuestion(String questionID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Update tblQuestion set status = 0 where questionID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, questionID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<QuestionDTO> getQuestionBySubjectID(String subjectID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        QuestionDTO dto;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select Top 20 questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4, "
                        + "dateOfCreate,status "
                        + "from tblQuestion where subjectID = ? and status = 1 ORDER BY NEWID() ";
                stm = con.prepareStatement(sql);
                stm.setString(1, subjectID);
                rs = stm.executeQuery();
                SubjectDAO subjectDAO = new SubjectDAO();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("question_content");
                    String answerOption1 = rs.getString("answer_option1");
                    String answerOption2 = rs.getString("answer_option2");
                    String answerOption3 = rs.getString("answer_option3");
                    String answerOption4 = rs.getString("answer_option4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date dateOfCreate = rs.getDate("dateOfCreate");
                    subjectID = rs.getString("subjectID");
                    SubjectDTO subjectDTO = subjectDAO.findSubject(subjectID);
                    boolean status = rs.getBoolean("status");
                    dto = new QuestionDTO(questionID, questionContent,
                            answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4,
                            dateOfCreate, subjectDTO, status);
                    if (this.listQuestion == null) {
                        this.listQuestion = new ArrayList<>();
                    }
                    this.listQuestion.add(dto);
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
        return listQuestion;
    }

    public List<QuestionDTO> getAllListQuestion() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select questionID, question_content, answer_correct, subjectID, "
                        + "answer_option1, answer_option2, answer_option3, answer_option4, "
                        + "dateOfCreate,status "
                        + "from tblQuestion ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                SubjectDAO subjectDAO = new SubjectDAO();
                while (rs.next()) {
                    String questionID = rs.getString("questionID");
                    String questionContent = rs.getString("question_content");
                    String answerOption1 = rs.getString("answer_option1");
                    String answerOption2 = rs.getString("answer_option2");
                    String answerOption3 = rs.getString("answer_option3");
                    String answerOption4 = rs.getString("answer_option4");
                    String answerCorrect = rs.getString("answer_correct");
                    Date dateOfCreate = rs.getDate("dateOfCreate");
                    String subjectID = rs.getString("subjectID");
                    SubjectDTO subjectDTO = subjectDAO.findSubject(subjectID);
                    boolean status = rs.getBoolean("status");
                    QuestionDTO dto = new QuestionDTO(questionID, questionContent,
                            answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4,
                            dateOfCreate, subjectDTO, status);
                    if (this.listQuestion == null) {
                        this.listQuestion = new ArrayList<>();
                    }
                    this.listQuestion.add(dto);
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
        return listQuestion;
    }

    public int findQuestionID(String questionID) throws NamingException, SQLException {
        getAllListQuestion();
        for (int i = 0; i < listQuestion.size(); i++) {
            if (questionID.equals(this.listQuestion.get(i).getQuestionID())) {
                return i;
            }
        }
        return -1;
    }

    public QuestionDTO findQuestion(String questionID) throws NamingException, SQLException {
        int i = findQuestionID(questionID);
        return i < 0 ? null : this.listQuestion.get(i);
    }
}
