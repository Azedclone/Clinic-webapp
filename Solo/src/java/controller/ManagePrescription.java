package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import model.Account;

public class ManagePrescription extends HttpServlet {
   
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
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");

        switch (type) {
            case "create": {
                HttpSession session = request.getSession();
                Account currentAccount = (Account) session.getAttribute("currentAccount");
                Enumeration enumeration = request.getParameterNames();
                HashMap<String, String> data = new HashMap<>();
                data.put("doctorID", Integer.toString(currentAccount.getAccountID()));

                while (enumeration.hasMoreElements()) {
                    String parameterName = (String) enumeration.nextElement();
                    data.put(parameterName, request.getParameter(parameterName));
                }
//                out.println(createPrescription(data));
            }
            break;
            case "edit": {
                String prescriptionID = request.getParameter("prescriptionID");
                String instruction = request.getParameter("instruction");
//                out.println(updatePrescription(Integer.parseInt(prescriptionID), instruction));
            }
            break;
            default:
                break;
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
