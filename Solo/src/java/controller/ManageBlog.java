package controller;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import java.util.Enumeration;
import java.util.HashMap;
import model.*;

@MultipartConfig
public class ManageBlog extends HttpServlet {

    private final BlogDAO blogDAO = new BlogDAO();

    private String createBlog(HashMap<String, String> data) {
        String status;

        try {
            if (blogDAO.createBlog(data.get("title"),
                    data.get("thumbnails").isEmpty() ? "default_thumbnails.jpg" : data.get("thumbnails"),
                    data.get("content"),
                    Integer.parseInt(data.get("categoryID")),
                    Integer.parseInt(data.get("authorID"))
            )) {
                status = "ok";
            } else {
                status = "error";
            }
        } catch (NumberFormatException e) {
            System.out.println("Error in ManageBlog.createBlog()");
            status = "error";
        }
        return status;
    }

    private String editBlog(HashMap<String, String> data) {
        String status;

        Date publishedDate = null;
        if (Integer.parseInt(data.get("status")) == 1) {
            long millis = System.currentTimeMillis();
            publishedDate = new Date(millis);
        }

        try {
            if (blogDAO.updateBlog(
                    Integer.parseInt(data.get("blogID")),
                    data.get("title"),
                    data.get("thumbnails").isEmpty() ? "default_thumbnails.jpg" : data.get("thumbnails"),
                    data.get("content"),
                    Integer.parseInt(data.get("status")),
                    Integer.parseInt(data.get("categoryID")),
                    publishedDate
            )) {
                status = "ok";
            } else {
                status = "error";
            }
        } catch (NumberFormatException e) {
            System.out.println("Error in ManageBlog.updateBlog()");
            status = "error";
        }
        return status;
    }

    private String deleteBlog(int blogID) {
        String status;

        if (blogDAO.deleteBlog(blogID)) {
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
        HttpSession session = request.getSession();
        Account currentAccount = (Account) session.getAttribute("currentAccount");
        String blogID = request.getParameter("blogID");
        System.out.println(blogID);

        String type = request.getParameter("type");

        switch (type) {
            case "create": {
                Part part = request.getPart("thumbnails");
                String fileName = part.getSubmittedFileName();
                String path = getServletContext().getRealPath("/" + "assets/img/blogs" + File.separator + fileName);

                if (!fileName.equals("default_thumbnails.jpg")) {
                    helper.HandleImage.saveImage(part.getInputStream(), path);
                }

                Enumeration enumeration = request.getParameterNames();
                HashMap<String, String> data = new HashMap<>();
                data.put("thumbnails", fileName);
                data.put("authorID", Integer.toString(currentAccount.getAccountID()));

                while (enumeration.hasMoreElements()) {
                    String parameterName = (String) enumeration.nextElement();
                    data.put(parameterName, request.getParameter(parameterName));
                }

                out.println(createBlog(data));
            }
            break;
            case "edit": {
                Part part = request.getPart("thumbnails");
                String fileName = part.getSubmittedFileName();
                Blog blog = (Blog) blogDAO.getBlog(Integer.parseInt(blogID));
                String pathOld = getServletContext().getRealPath("/" + "assets/img/blogs" + File.separator + blog.getThumbnails());
                String pathNew = getServletContext().getRealPath("/" + "assets/img/blogs" + File.separator + fileName);

                //Handle picture
                if (!blog.getThumbnails().equals("default_thumbnails.jpg")) {
                    helper.HandleImage.deleteImage(pathOld);
                }
                if (helper.HandleImage.saveImage(part.getInputStream(), pathNew)) {
                    System.out.println("save image ok");
                }

                Enumeration enumeration = request.getParameterNames();
                HashMap<String, String> data = new HashMap<>();
                data.put("thumbnails", fileName);

                while (enumeration.hasMoreElements()) {
                    String parameterName = (String) enumeration.nextElement();
                    data.put(parameterName, request.getParameter(parameterName));
                }
                out.println(editBlog(data));
            }
            break;
            case "delete":
                out.println(deleteBlog(Integer.parseInt(blogID)));
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
