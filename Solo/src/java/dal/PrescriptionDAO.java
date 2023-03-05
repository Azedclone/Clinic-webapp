package dal;

import helper.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Prescription;

public class PrescriptionDAO extends DBContext {

    private String sql;
    private PreparedStatement st;
    private ResultSet rs;

    public List<Prescription> getPrescriptionsForDoc(int doctorID) {
        List<Prescription> prescriptions = new ArrayList<>();

        try {
            sql = "select p.*, a1.name as patientName, a2.name as doctorName, m.name as medicineName "
                    + "from prescriptions as p "
                    + "join accounts as a1 on p.patientID = a1.accountID "
                    + "join accounts as a2 on p.doctorID = a2.accountID "
                    + "join medicines as m on p.medicineID = m.medicineID "
                    + "where p.doctorID = ?";

            st = connection.prepareStatement(sql);
            st.setInt(1, doctorID);
            rs = st.executeQuery();

            while (rs.next()) {
                prescriptions.add(new Prescription(
                        rs.getInt("prescriptionID"),
                        rs.getInt("patientID"),
                        rs.getString("patientName"),
                        rs.getInt("medicineID"),
                        rs.getString("medicineName"),
                        rs.getString("instruction"),
                        rs.getInt("doctorID"),
                        rs.getString("doctorName"),
                        rs.getDate("createdDate")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in PrescriptionDAO.getPrescriptionsForDoc()");
        }

        return prescriptions;
    }

    public List<Prescription> getPrescriptionsForPat(int patientID) {
        List<Prescription> prescriptions = new ArrayList<>();

        try {
            sql = "select p.*, a1.name as patientName, a2.name as doctorName, m.name as medicineName "
                    + "from prescriptions as p "
                    + "join accounts as a1 on p.patientID = a1.accountID "
                    + "join accounts as a2 on p.doctorID = a2.accountID "
                    + "join medicines as m on p.medicineID = m.medicineID "
                    + "where p.patientID = ?";

            st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            rs = st.executeQuery();

            while (rs.next()) {
                prescriptions.add(new Prescription(
                        rs.getInt("prescriptionID"),
                        rs.getInt("patientID"),
                        rs.getString("patientName"),
                        rs.getInt("medicineID"),
                        rs.getString("medicineName"),
                        rs.getString("instruction"),
                        rs.getInt("doctorID"),
                        rs.getString("doctorName"),
                        rs.getDate("createdDate")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in PrescriptionDAO.getPrescriptionsForPat()");
        }

        return prescriptions;
    }

    public boolean createPrescription(int patientID, int medicineID, String instruction, int doctorID) {
        try {
            sql = "insert into prescriptions (patientID, medicineID, instruction, doctorID) values(?, ?, ?, ?)";
            st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            st.setInt(2, medicineID);
            st.setString(3, instruction);
            st.setInt(4, doctorID);
            st.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in PrescriptionDAO.createPrescription()");
            return false;
        }
    }

    public boolean editPrescription(int prescriptionID, String instruction) {
        try {
            sql = "update prescriptions set instruction = ? where prescriptionID = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, instruction);
            st.setInt(2, prescriptionID);
            st.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in PrescriptionDAO.editPrescription()");
            return false;
        }
    }

    public Prescription getPrescription(int prescriptionID) {
        try {
            sql = "select * from prescriptions where prescriptionID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, prescriptionID);
            rs = st.executeQuery();

            while (rs.next()) {
                return new Prescription(
                        rs.getInt("prescriptionID"),
                        rs.getInt("patientID"),
                        rs.getInt("medicineID"),
                        rs.getString("instruction"),
                        rs.getInt("doctorID"),
                        rs.getDate("createdDate")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error in PrescriptionDAO.getPrescription()");
        }

        return null;
    }
}
