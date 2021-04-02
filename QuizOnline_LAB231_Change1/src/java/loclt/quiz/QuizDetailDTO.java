/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.quiz;

import java.io.Serializable;
import loclt.question.QuestionDTO;

/**
 *
 * @author WIN
 */
public class QuizDetailDTO implements Serializable {

    private String quizDetailID;
    private String scoreID;
    private QuestionDTO questionDTO;
    private String chooseAnswer;

    public QuizDetailDTO() {
    }

    public QuizDetailDTO(String quizDetailID, String scoreID, QuestionDTO questionDTO, String chooseAnswer) {
        this.quizDetailID = quizDetailID;
        this.scoreID = scoreID;
        this.questionDTO = questionDTO;
        this.chooseAnswer = chooseAnswer;
    }

    public String getQuizDetailID() {
        return quizDetailID;
    }

    public void setQuizDetailID(String quizDetailID) {
        this.quizDetailID = quizDetailID;
    }

    public String getScoreID() {
        return scoreID;
    }

    public void setScoreID(String scoreID) {
        this.scoreID = scoreID;
    }

    public String getChooseAnswer() {
        return chooseAnswer;
    }

    public void setChooseAnswer(String chooseAnswer) {
        this.chooseAnswer = chooseAnswer;
    }

    public QuestionDTO getQuestionDTO() {
        return questionDTO;
    }

    public void setQuestionDTO(QuestionDTO questionDTO) {
        this.questionDTO = questionDTO;
    }

}
