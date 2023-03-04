package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import org.apache.commons.codec.digest.DigestUtils;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain;charset-UTF8");

        String username = request.getParameter("username");
        HttpSession session = request.getSession();

        AccountDAO accountDAO = new AccountDAO();
        if (!accountDAO.isExist(username)) {
            out.println("not exist");
        } else {
            Account account = accountDAO.getAccount(username);
            if (account == null) {
                out.println("wrong");
            } else {
                session.setAttribute("currentAccount", account);
                out.println("ok");
            }
        }
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
