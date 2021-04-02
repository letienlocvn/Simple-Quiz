/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import loclt.users.UsersCreateError;
import loclt.users.UsersDAO;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

/**
 *
 * @author WIN
 */
public class CreateNewAccountServlet extends HttpServlet {
    static final Logger LOGGER = Logger.getLogger(CreateNewAccountServlet.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc = request.getServletContext();
        Map<String, String> file = (Map<String, String>) sc.getAttribute("FILE");
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String comfirm = request.getParameter("txtComfirm");
        String fullName = request.getParameter("txtFullname");
        String url = file.get("createNewAccountErr");
        
        UsersCreateError errors = new UsersCreateError();
        try {
            boolean foundErr = false; 
            if (username.trim().length() < 6 || username.trim().length() > 20) {
                foundErr = true;
                errors.setUsernameLengthErr("Username requires typing from 6 - 30");
            }
            if (password.trim().length() < 6 || password.trim().length() > 30) {
                foundErr = true;
                errors.setPasswordLengthErr("Password requires typing from 6 - 30");
            } else if (!password.trim().equals(comfirm.trim())) {
                foundErr = true;
                errors.setConfirmNotMatched("Comfirm must match password");
            }
            if (fullName.trim().length() < 2 || fullName.trim().length() > 50) {
                foundErr = true;
                errors.setFullnameLengthErr("Full name requires typing from 6 - 30");
            }
            if (foundErr){
                // 2.1 Store Erros into Scope 
                request.setAttribute("CREATERACCOUNT", errors);                
            } else {
                //2.2 call DAO to insert to DB
                
                UsersDAO dao = new UsersDAO();
                boolean result = dao.createAccount(username, password, fullName, true, 2);
                if (result){
                    url = file.get("");
                }
            }
            
        } catch (SQLException e){
            BasicConfigurator.configure();
            LOGGER.error("ERROR at CreateNewAccountServlet: " + e.getMessage());            
            errors.setUsernameIsExisted(username + " is exited in system");
            
            request.setAttribute("CREATERACCOUNT", errors);
        } catch (NamingException e){
            
        }
        finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
