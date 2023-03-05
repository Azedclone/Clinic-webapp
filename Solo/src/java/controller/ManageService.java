package controller;

import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;

public class ManageService extends HttpServlet {

    ServiceDAO serviceDAO = new ServiceDAO();

    private String createService(HashMap<String, String> data) {
        String status;

        if (serviceDAO.createService(
                data.get("name"),
                Double.parseDouble(data.get("price")),
                Integer.parseInt(data.get("status"))
        )) {
            status = "ok";
        } else {
            status = "erorr";
        }

        return status;
    }

    private String updateService(HashMap<String, String> data) {
        String status;

        if (serviceDAO.updateService(
                Integer.parseInt(data.get("serviceID")),
                data.get("name"),
                Double.parseDouble(data.get("price")),
                Integer.parseInt(data.get("status"))
        )) {
            status = "ok";
        } else {
            status = "erorr";
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
                Enumeration enumeration = request.getParameterNames();
                HashMap<String, String> data = new HashMap<>();

                while (enumeration.hasMoreElements()) {
                    String parameterName = (String) enumeration.nextElement();
                    data.put(parameterName, request.getParameter(parameterName));
                }
                out.println(createService(data));
            }
            break;
            case "edit": {
                Enumeration enumeration = request.getParameterNames();
                HashMap<String, String> data = new HashMap<>();

                while (enumeration.hasMoreElements()) {
                    String parameterName = (String) enumeration.nextElement();
                    data.put(parameterName, request.getParameter(parameterName));
                }
                out.println(updateService(data));
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
