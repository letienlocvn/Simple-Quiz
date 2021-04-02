/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.subject;

import java.io.Serializable;

/**
 *
 * @author WIN
 */
public class SubjectDTO implements Serializable {

    private String subjectID;
    private String subjectName;
    private boolean status;

    public SubjectDTO(String subjectID, String subjectName, boolean status) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.status = status;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
