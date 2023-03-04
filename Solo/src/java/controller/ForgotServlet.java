package controller;

import dal.AccountDAO;
import helper.MailConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class ForgotServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {} 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain;charset=UTF-8");
        String username = request.getParameter("username");
        String emailRecover = request.getParameter("email");

        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccount(username);
        String newPassword = MailConfig.generatePassword();
        
        if (account == null) {
            out.println("!exist");
        } else {
            if (account.getEmail() == null) {
                out.println("!linked");
            } else {
                //Change password in DB
                accountDAO.changePassword(username, newPassword);

                //Create email object
                Email email = new SimpleEmail();

                //Config email server
                email.setHostName(MailConfig.HOST_NAME);
                email.setSmtpPort(MailConfig.TSL_PORT);
                email.setAuthenticator(new DefaultAuthenticator(MailConfig.FROM_EMAIL, MailConfig.FROM_PASSWORD));
                email.setTLS(true);

                try {
                    //Set sender and receiver
                    email.setFrom(MailConfig.FROM_EMAIL);
                    email.addTo(emailRecover);
                    email.setSubject(MailConfig.SUBJECT);
                    email.setMsg(newPassword);
                    email.send();
                } catch (EmailException e) {
                    System.out.println("Error when send email!");
                }
            }
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
