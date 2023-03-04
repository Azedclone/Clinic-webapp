package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import org.apache.commons.codec.digest.DigestUtils;

@MultipartConfig
public class ManageDoctor extends HttpServlet {

    private final AccountDAO accountDAO = new AccountDAO();

    private String createDoctor(String[] params) {
        String status;

        String username = params[0].split("=")[1];
        String password = params[1].split("=")[1];
        password = DigestUtils.md5Hex(password).toUpperCase();

        // Check exist
        if (accountDAO.isExist(username)) {
            status = "existed";
        } else {
            accountDAO.register(username, password, 1, 1);
            status = "ok";
        }

        return status;
    }

    private String editDoctor(HashMap<String, String> dataMap) {
        String status;

        try {
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dataMap.get("dob"));
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            String username = dataMap.get("username");
            String email = dataMap.get("email");
            String avatar = (dataMap.get("avatar").isEmpty() ? "defautlt.png" : dataMap.get("avatar"));
            String name = dataMap.get("name");
            String phone = dataMap.get("phone");
            int gender = Integer.parseInt(dataMap.get("gender"));
            String address = dataMap.get("address");

            if (accountDAO.editAccount(username, email, avatar, name, phone, gender, address, sqlDate)) {
                status = "ok";
            } else {
                status = "error";
            }
        } catch (NumberFormatException | ParseException e) {
            System.out.println("Error in ManageDoctor.editDoctor()");
            status = "error";
        }

        System.out.println(status);
        return status;
    }

    private String deleteDoctor(String username) {
        String status;

        if (accountDAO.deleteAccount(username)) {
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
            case "delete": {
                String username = request.getParameter("username");
                out.println(deleteDoctor(username));
            }
            break;
            case "create": {
                String[] params = request.getParameter("data").replaceAll("\"", "").split("&");
                out.println(createDoctor(params));
            }
            break;
            case "edit": {
                Part part = request.getPart("avatar");
                String fileName = part.getSubmittedFileName();

                Enumeration enumeration = request.getParameterNames();
                HashMap<String, String> dataMap = new HashMap<>();
                dataMap.put("avatar", fileName);
                while (enumeration.hasMoreElements()) {
                    String parameterName = (String) enumeration.nextElement();
                    dataMap.put(parameterName, request.getParameter(parameterName));
                    System.out.println(parameterName + " : " + request.getParameter(parameterName));
                }
                out.println(editDoctor(dataMap));
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
