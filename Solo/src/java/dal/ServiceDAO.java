package dal;

import helper.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Service;

public class ServiceDAO extends DBContext {

    private String sql;
    private PreparedStatement st;
    private ResultSet rs;

    // Get all services
    public List<Service> getServices() {
        List<Service> services = new ArrayList<>();
        try {
            sql = "select * from services";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                services.add(new Service(
                        rs.getInt("serviceID"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getInt("status")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in ServiceDAO.getServices()");
        }

        return services;
    }

    //Create service
    public boolean createService(String name, double price, int status) {
        try {
            sql = "insert into services (name, price, status) values(?, ?, ?)";
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, price);
            st.setInt(3, status);
            st.execute();

            return true;
        } catch (SQLException e) {
            System.out.println("Error in ServiceDAO.createService()");
            return false;
        }
    }

    //Update service
    public boolean updateService(int serviceID, String name, double price, int status) {
        try {
            sql = "update services set name = ?, price = ?, status = ? where serviceID = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, price);
            st.setInt(3, status);
            st.setInt(4, serviceID);
            st.execute();

            return true;
        } catch (SQLException e) {
            System.out.println("Error in ServiceDAO.updateService()");
            return false;
        }
    }

    //Get single service
    public Service getService(int serviceID) {
        try {
            sql = "select * from services where serviceID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, serviceID);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Service(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4)
                );
            }
        } catch (SQLException e) {
            System.out.println("Error in ServiceDAO.getService()");
        }

        return null;
    }

}
