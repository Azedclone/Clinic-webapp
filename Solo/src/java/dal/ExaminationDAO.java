package dal;

import helper.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Examination;

public class ExaminationDAO extends DBContext {

    private String sql;
    private PreparedStatement st;
    private ResultSet rs;

    public List<Examination> getExaminationsForDoc(int doctorID) {
        List<Examination> examinations = new ArrayList<>();

        try {
            sql = "select e.*, a1.name as patientName, a2.name as doctorName, s.name as serviceName "
                    + "from examinations as e "
                    + "join accounts as a1 on e.patientID = a1.accountID "
                    + "join accounts as a2 on e.doctorID = a2.accountID "
                    + "join services as s on e.serviceID = s.serviceID "
                    + "where e.doctorID = ?";

            st = connection.prepareStatement(sql);
            st.setInt(1, doctorID);
            rs = st.executeQuery();

            while (rs.next()) {
                examinations.add(new Examination(
                        rs.getInt("examinationID"),
                        rs.getInt("patientID"),
                        rs.getString("patientName"),
                        rs.getInt("serviceID"),
                        rs.getString("serviceName"),
                        rs.getInt("doctorID"),
                        rs.getString("doctorName"),
                        rs.getDate("createdDate"),
                        rs.getInt("status"),
                        rs.getString("result")
                ));
            }
        } catch (SQLException e) {
//            System.out.println("Error in ExaminationDAO.getExaminationsForDoc()");
            e.printStackTrace();
        }

        return examinations;
    }

    public List<Examination> getExaminationsForPat(int patientID) {
        List<Examination> examinations = new ArrayList<>();

        try {
            sql = "select e.*, a1.name as patientName, a2.name as doctorName, s.name as serviceName "
                    + "from examinations as e "
                    + "join accounts as a1 on e.patientID = a1.accountID "
                    + "join accounts as a2 on e.doctorID = a2.accountID "
                    + "join services as s on e.serviceID = s.serviceID "
                    + "where e.patientID = ?";

            st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            rs = st.executeQuery();

            while (rs.next()) {
                examinations.add(new Examination(
                        rs.getInt("examinationID"),
                        rs.getInt("patientID"),
                        rs.getString("patientName"),
                        rs.getInt("serviceID"),
                        rs.getString("serviceName"),
                        rs.getInt("doctorID"),
                        rs.getString("doctorName"),
                        rs.getDate("createdDate"),
                        rs.getInt("status"),
                        rs.getString("result")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in ExaminationDAO.getExaminationsForPat()");
        }

        return examinations;
    }

    public boolean createExamination(int patientID, int serviceID, int doctorID, int status, String result) {
        try {
            sql = "insert into examinations (patientID, serviceID, doctorID, status, result) values (?, ?, ?, ?, ?)";
            st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            st.setInt(2, serviceID);
            st.setInt(3, doctorID);
            st.setInt(4, status);
            st.setString(5, result);
            st.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Error in ExaminationDAO.createExamination()");
            return false;
        }
    }

    public boolean editExamination(int examinationID, int status, String result) {
        try {
            sql = "update examinations set status = ?, result = ? where examinationID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setString(2, result);
            st.setInt(3, examinationID);
            st.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Error in ExaminationDAO.editExamination()");
            return false;
        }
    }

    public Examination getExamination(int examinationID) {
        try {
            sql = "select * from examinations where examinationID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, examinationID);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Examination(
                        rs.getInt("examinationID"),
                        rs.getInt("patientID"),
                        rs.getInt("serviceID"),
                        rs.getInt("doctorID"),
                        rs.getDate("createdDate"),
                        rs.getInt("status"),
                        rs.getString("result")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error in ExaminationDAO.getExamination()");
        }

        return null;
    }
}
