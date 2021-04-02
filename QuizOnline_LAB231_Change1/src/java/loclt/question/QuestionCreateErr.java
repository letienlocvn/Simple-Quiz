/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.question;

import java.io.Serializable;

/**
 *
 * @author WIN
 */
public class QuestionCreateErr implements Serializable {

    private String isExitedQuestionID;
    private String questionIDErr;
    private String questionContentErr;
    private String 
            answerOption1Err,
            answerOption2Err,
            answerOption3Err,
            answerOption4Err;

    public QuestionCreateErr(String isExitedQuestionID, String questionIDErr, String questionContentErr, String answerOption1Err, String answerOption2Err, String answerOption3Err, String answerOption4Err) {
        this.isExitedQuestionID = isExitedQuestionID;
        this.questionIDErr = questionIDErr;
        this.questionContentErr = questionContentErr;
        this.answerOption1Err = answerOption1Err;
        this.answerOption2Err = answerOption2Err;
        this.answerOption3Err = answerOption3Err;
        this.answerOption4Err = answerOption4Err;
    }

    public QuestionCreateErr() {
    }
    

    public String getIsExitedQuestionID() {
        return isExitedQuestionID;
    }

    public void setIsExitedQuestionID(String isExitedQuestionID) {
        this.isExitedQuestionID = isExitedQuestionID;
    }

    public String getQuestionIDErr() {
        return questionIDErr;
    }

    public void setQuestionIDErr(String questionIDErr) {
        this.questionIDErr = questionIDErr;
    }

    public String getQuestionContentErr() {
        return questionContentErr;
    }

    public void setQuestionContentErr(String questionContentErr) {
        this.questionContentErr = questionContentErr;
    }

    public String getAnswerOption1Err() {
        return answerOption1Err;
    }

    public void setAnswerOption1Err(String answerOption1Err) {
        this.answerOption1Err = answerOption1Err;
    }

    public String getAnswerOption2Err() {
        return answerOption2Err;
    }

    public void setAnswerOption2Err(String answerOption2Err) {
        this.answerOption2Err = answerOption2Err;
    }

    public String getAnswerOption3Err() {
        return answerOption3Err;
    }

    public void setAnswerOption3Err(String answerOption3Err) {
        this.answerOption3Err = answerOption3Err;
    }

    public String getAnswerOption4Err() {
        return answerOption4Err;
    }

    public void setAnswerOption4Err(String answerOption4Err) {
        this.answerOption4Err = answerOption4Err;
    }

}
