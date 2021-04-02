/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.question;

import java.io.Serializable;
import java.util.Date;
import loclt.subject.SubjectDTO;

/**
 *
 * @author WIN
 */
public class QuestionDTO implements Serializable {

    private String questionID, questionContent;
    private String answerCorrect, answerOption1, answerOption2, answerOption3, answerOption4;
    private Date dateOfCreate;
    private SubjectDTO subjectDTO;
    private boolean status;

    public QuestionDTO() {
    }

    public QuestionDTO(String questionID, String questionContent, String answerCorrect, String answerOption1, String answerOption2, String answerOption3, String answerOption4, Date dateOfCreate, SubjectDTO subjectDTO, boolean status) {
        this.questionID = questionID;
        this.questionContent = questionContent;
        this.answerCorrect = answerCorrect;
        this.answerOption1 = answerOption1;
        this.answerOption2 = answerOption2;
        this.answerOption3 = answerOption3;
        this.answerOption4 = answerOption4;
        this.dateOfCreate = dateOfCreate;
        this.subjectDTO = subjectDTO;
        this.status = status;
    }

    public String getQuestionID() {
        return questionID;
    }

    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getAnswerCorrect() {
        return answerCorrect;
    }

    public void setAnswerCorrect(String answerCorrect) {
        this.answerCorrect = answerCorrect;
    }

    public String getAnswerOption1() {
        return answerOption1;
    }

    public void setAnswerOption1(String answerOption1) {
        this.answerOption1 = answerOption1;
    }

    public String getAnswerOption2() {
        return answerOption2;
    }

    public void setAnswerOption2(String answerOption2) {
        this.answerOption2 = answerOption2;
    }

    public String getAnswerOption3() {
        return answerOption3;
    }

    public void setAnswerOption3(String answerOption3) {
        this.answerOption3 = answerOption3;
    }

    public String getAnswerOption4() {
        return answerOption4;
    }

    public void setAnswerOption4(String answerOption4) {
        this.answerOption4 = answerOption4;
    }

    public Date getDateOfCreate() {
        return dateOfCreate;
    }

    public void setDateOfCreate(Date dateOfCreate) {
        this.dateOfCreate = dateOfCreate;
    }

    public SubjectDTO getSubjectDTO() {
        return subjectDTO;
    }

    public void setSubjectDTO(SubjectDTO subjectDTO) {
        this.subjectDTO = subjectDTO;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "QuestionDTO{" + "questionID=" + questionID + ", questionContent=" + questionContent + ", answerCorrect=" + answerCorrect + ", answerOption1=" + answerOption1 + ", answerOption2=" + answerOption2 + ", answerOption3=" + answerOption3 + ", answerOption4=" + answerOption4 + ", dateOfCreate=" + dateOfCreate + ", subjectDTO=" + subjectDTO + ", status=" + status + '}';
    }

}
