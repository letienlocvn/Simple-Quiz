/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.score;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import loclt.utils.DBUtils;

/**
 *
 * @author WIN
 */
public class ScoreDAO implements Serializable {

    public int countScore() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select count(ScoreID) as x from tblScores";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt("x");
                    return count;
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

    public List<ScoreDTO> getAllScorePaging(String username, int index, int inforInPage) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<ScoreDTO> listSearch = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select username, totalScore, scoreID, DateOfCreate, subjectName from "
                        + "(select ROW_NUMBER() over (Order by DateOfCreate DESC) as row ,"
                        + "username,totalScore, scoreID, DateOfCreate, subjectName from tblScores where username = ?) as x "
                        + "where row between (?-1)*?+1 and ?*?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setInt(2, index);
                stm.setInt(3, inforInPage);
                stm.setInt(4, index);
                stm.setInt(5, inforInPage);
                rs = stm.executeQuery();
                while (rs.next()) {
                    username = rs.getString("username");
                    int totalScore = rs.getInt("totalScore");
                    String scoreID = rs.getString("scoreID");
                    Date dateOfCreate = rs.getDate("DateOfCreate");
                    String subjectName = rs.getString("subjectName");
                    ScoreDTO dto = new ScoreDTO(username, totalScore, scoreID, dateOfCreate, subjectName);
                    if (listSearch == null) {
                        listSearch = new ArrayList<>();
                    }
                    listSearch.add(dto);
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
        return listSearch;
    }

    public int countSearchScore(String txtSearch) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select COUNT(subjectName) as ValueSearch from tblScores where subjectName like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                rs = stm.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt("ValueSearch");
                    return count;
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
        return 0;
    }

    public List<ScoreDTO> searchValueScore(String txtSearch, int index, int inforInPage) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<ScoreDTO> listSearch = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select username, totalScore, scoreID, DateOfCreate, subjectName from "
                        + "(select ROW_NUMBER() over (Order by DateOfCreate) as row ,"
                        + "username,totalScore, scoreID, DateOfCreate, subjectName from tblScores where subjectName like ?) as x "
                        + " where row between (?-1)*?+1 and ?*?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                stm.setInt(2, index);
                stm.setInt(3, inforInPage);
                stm.setInt(4, index);
                stm.setInt(5, inforInPage);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    int totalScore = rs.getInt("totalScore");
                    String scoreID = rs.getString("scoreID");
                    Date dateOfCreate = rs.getDate("DateOfCreate");
                    String subjectName = rs.getString("subjectName");
                    ScoreDTO dto = new ScoreDTO(username, totalScore, scoreID, dateOfCreate, subjectName);
                    if (listSearch == null) {
                        listSearch = new ArrayList<>();
                    }
                    listSearch.add(dto);
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
        return listSearch;
    }

}
