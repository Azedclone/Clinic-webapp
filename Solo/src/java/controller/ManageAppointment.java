package controller;

import dal.AppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import model.Account;

public class ManageAppointment extends HttpServlet {

    private final AppointmentDAO appointmentDAO = new AppointmentDAO();

    private String createAppointment(HashMap<String, String> data) {
        String status;

        try {
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(data.get("bookedDate"));
            java.sql.Date bookedDate = new java.sql.Date(utilDate.getTime());

            int patientID = Integer.parseInt(data.get("patientID"));
            int slotID = Integer.parseInt(data.get("slotID"));
            int doctorID = Integer.parseInt(data.get("doctorID"));
            String sympton = data.get("sympton");
            String message = data.get("message");

            if (appointmentDAO.createAppointment(patientID, bookedDate, slotID, doctorID, sympton, message)) {
                status = "ok";
            } else {
                status = "error";
            }
        } catch (NumberFormatException | ParseException e) {
            System.out.println("Error in ManageAppointment.createAppointment()");
            status = "error";
        }

        return status;
    }

    private String updateAppointment(int appointmentID, String sympton, String message) {
        String status;

        if (appointmentDAO.updateAppointment(appointmentID, sympton, message)) {
            status = "ok";
        } else {
            status = "error";
        }

        return status;
    }

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
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");

        switch (type) {
            case "create": {
                HttpSession session = request.getSession();
                Account currentAccount = (Account) session.getAttribute("currentAccount");
                Enumeration enumeration = request.getParameterNames();
                HashMap<String, String> data = new HashMap<>();
                data.put("patientID", Integer.toString(currentAccount.getAccountID()));

                while (enumeration.hasMoreElements()) {
                    String parameterName = (String) enumeration.nextElement();
                    data.put(parameterName, request.getParameter(parameterName));
                }
                out.println(createAppointment(data));
            }
            break;
            case "edit":{
                String appointmentID = request.getParameter("appointmentID");
                String sympton = request.getParameter("sympton");
                String message = request.getParameter("message");
                out.println(updateAppointment(Integer.parseInt(appointmentID), sympton, message));
            }
            break;
            default:
                break;
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
