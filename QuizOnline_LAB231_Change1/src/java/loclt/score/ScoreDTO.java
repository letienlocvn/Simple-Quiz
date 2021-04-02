/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.score;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author WIN
 */
public class ScoreDTO implements Serializable {

    private String username;
    private int totalScore;
    private String scoreID;
    private Date dateOfCreate;
    private String subjectName;

    public ScoreDTO() {
    }

    public ScoreDTO(String username, int totalScore, String scoreID, Date dateOfCreate, String subjectName) {
        this.username = username;
        this.totalScore = totalScore;
        this.scoreID = scoreID;
        this.dateOfCreate = dateOfCreate;
        this.subjectName = subjectName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public String getScoreID() {
        return scoreID;
    }

    public void setScoreID(String scoreID) {
        this.scoreID = scoreID;
    }

    public Date getDateOfCreate() {
        return dateOfCreate;
    }

    public void setDateOfCreate(Date dateOfCreate) {
        this.dateOfCreate = dateOfCreate;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

}
