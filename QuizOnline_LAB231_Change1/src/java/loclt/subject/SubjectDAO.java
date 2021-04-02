/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.subject;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import loclt.utils.DBUtils;

/**
 *
 * @author WIN
 */
public class SubjectDAO implements Serializable {

    List<SubjectDTO> listSubject;

    public List<SubjectDTO> getListSubject() {
        return listSubject;
    }

    public List<SubjectDTO> getAllSubject() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select subjectID, subjectName, status from tblSubjects where status = 1";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String subjectID = rs.getString("subjectID");
                    String subjectName = rs.getString("subjectName");
                    boolean status = rs.getBoolean("status");
                    SubjectDTO dto = new SubjectDTO(subjectID, subjectName, status);
                    if (this.listSubject == null) {
                        listSubject = new ArrayList<>();
                    }
                    this.listSubject.add(dto);
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
        return listSubject;
    }

    public SubjectDTO findSubject(String subjectID) throws SQLException, NamingException {
        int i = findSubjectID(subjectID);
        return i < 0 ? null : this.listSubject.get(i);
    }

    public int findSubjectID(String subjectID) throws SQLException, NamingException {
        getAllSubject();
        for (int i = 0; i < this.listSubject.size(); i++) {
            String idInList = this.listSubject.get(i).getSubjectID();
            if (subjectID.equals(idInList)) {
                return i;
            }
        }
        return -1;
    }

}
