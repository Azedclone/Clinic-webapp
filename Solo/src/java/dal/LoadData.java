package dal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.*;

public class LoadData extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        AccountDAO accountDAO = new AccountDAO();
        BlogDAO blogDAO = new BlogDAO();
        AppointmentDAO appointmentDAO = new AppointmentDAO();
        String type = request.getParameter("type");
        String username = request.getParameter("username");
        String blogID = request.getParameter("blogID");
        String appointmentID = request.getParameter("appointmentID");

        if (type != null) {
            switch (type) {
                case "accounts": {
                    List<Account> accounts = accountDAO.getAccounts();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    response.getWriter().write(new Gson().toJson(accounts));
                    break;
                }
                case "doctors": {
                    List<Account> doctors = accountDAO.getAccountsByRole(1);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    response.getWriter().write(new Gson().toJson(doctors));
                    break;
                }
                case "patients":
                    List<Account> patients = accountDAO.getAccountsByRole(2);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    response.getWriter().write(new Gson().toJson(patients));
                    break;
                case "blogs": {
                    List<Blog> blogs = blogDAO.getBlogs();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    response.getWriter().write(new Gson().toJson(blogs));
                    break;
                }
                case "categories": {
                    List<Category> categories = blogDAO.getCategories();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    response.getWriter().write(new Gson().toJson(categories));
                    break;
                }
                case "appointments": {
                    HttpSession session = request.getSession();
                    Account currentAccount = (Account) session.getAttribute("currentAccount");
                    if (currentAccount.getRole() == 2) {
                        List<Appointment> appointments = appointmentDAO.getAppointmentsForPat(currentAccount.getAccountID());
                        response.setContentType("application/json");
                        response.setCharacterEncoding("utf-8");
                        response.getWriter().write(new Gson().toJson(appointments));
                    } else if (currentAccount.getRole() == 1) {
                        List<Appointment> appointments = appointmentDAO.getAppointmentsForDoc(currentAccount.getAccountID());
                        response.setContentType("application/json");
                        response.setCharacterEncoding("utf-8");
                        response.getWriter().write(new Gson().toJson(appointments));
                    }
                    break;
                }
                case "slots": {
                    String bookedDate_raw = request.getParameter("bookedDate");
                    String doctorID = request.getParameter("doctorID");

                    List<Integer> slots = appointmentDAO.busySlot(Date.valueOf(bookedDate_raw), Integer.parseInt(doctorID));
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    response.getWriter().write(new Gson().toJson(slots));
                }
                break;
                default:
                    break;
            }
        } else if (username != null) {
            Account account = accountDAO.getAccount(username);
            GsonBuilder gsonBuilder = new GsonBuilder();
            gsonBuilder.setDateFormat("yyyy-MM-dd");
            String accountJson = gsonBuilder.create().toJson(account);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(accountJson);
        } else if (blogID != null) {
            Blog blog = blogDAO.getBlog(Integer.parseInt(blogID));
            GsonBuilder gsonBuilder = new GsonBuilder();
            gsonBuilder.setDateFormat("yyyy-MM-dd");
            String blogJson = gsonBuilder.create().toJson(blog);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(blogJson);
        } else if (appointmentID != null) {
            Appointment appointment = appointmentDAO.getAppointment(Integer.parseInt(appointmentID));            
            GsonBuilder gsonBuilder = new GsonBuilder();
            gsonBuilder.setDateFormat("yyyy-MM-dd");
            String appointmentJson = gsonBuilder.create().toJson(appointment);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(appointmentJson);
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
