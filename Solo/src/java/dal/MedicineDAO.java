package dal;

import helper.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Medicine;

public class MedicineDAO extends DBContext {

    private String sql;
    private PreparedStatement st;
    private ResultSet rs;

    // Get all medicine
    public List<Medicine> getMedicines() {
        List<Medicine> medicines = new ArrayList<>();
        try {
            sql = "select * from medicines";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                medicines.add(new Medicine(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in MedicineDAO.getMedicines()");
        }

        return medicines;
    }

    //Create medicine
    public boolean createMedicine(String name, String brand, String description) {
        try {
            sql = "insert into medicines (name, brand, description) values(?, ?, ?)";
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, brand);
            st.setString(3, description);
            st.execute();

            return true;
        } catch (SQLException e) {
            System.out.println("Error in MedicineDAO.createMedicine()");
            return false;
        }
    }

    //Update medicine
    public boolean updateMedicine(int medicineID, String name, String brand, String description) {
        try {
            sql = "update medicines set name = ?, brand = ?, description = ? where medicineID = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, brand);
            st.setString(3, description);
            st.setInt(4, medicineID);
            st.execute();

            return true;
        } catch (SQLException e) {
            System.out.println("Error in MedicineDAO.updateMedicine()");
            return false;
        }
    }

    //Get single service
    public Medicine getMedicine(int medicineID) {
        try {
            sql = "select * from medicines where medicineID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, medicineID);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Medicine(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );
            }
        } catch (SQLException e) {
            System.out.println("Error in MedicineDAO.getMedicine()");
        }

        return null;
    }

}
