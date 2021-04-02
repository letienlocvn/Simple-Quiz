/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.users;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import loclt.utils.DBUtils;

/**
 *
 * @author WIN
 */
public class UsersDAO implements Serializable {

    public boolean createAccount(String username, String password,
            String fullName, boolean status, int role) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Insert into tblUsers (username, password, fullName, status, role)"
                        + " values (?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                String sha256hex = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
                stm.setString(1, username);
                stm.setString(2, sha256hex);
                stm.setString(3, fullName);
                stm.setBoolean(4, status);
                stm.setInt(5, role);
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

    public boolean checkLogin(String username, String password)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select status from tblUsers where username = ? and password = ? ";
                stm = con.prepareStatement(sql);
                String sha256hex = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
                stm.setString(1, username);
                stm.setString(2, sha256hex);
                rs = stm.executeQuery();
                if (rs.next()) {
                    boolean status = rs.getBoolean("Status");
                    return status;
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
        return false;
    }

    /*public int getRole(String username) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select role from tblUsers where username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int role = rs.getInt("Role");
                    return role;
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
    }*/
    public UsersDTO getInfoUser(String username) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UsersDTO dto = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select username,fullName,role,status from tblUsers where username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    username = rs.getString("username");
                    String fullName = rs.getString("fullName");
                    int role = rs.getInt("role");
                    boolean status = rs.getBoolean("Status");
                    dto = new UsersDTO(username, fullName, role, status);
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

        return dto;
    }
}
