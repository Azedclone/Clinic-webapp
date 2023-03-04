package dal;

import helper.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class AppointmentDAO extends DBContext {

    private String sql;
    private PreparedStatement st;
    private ResultSet rs;

    // Get all appointments for patient
    public List<Appointment> getAppointmentsForPat(int patientID) {
        List<Appointment> appointments = new ArrayList<>();

        try {
            sql = "select app.*, a1.name as patientName, a2.name as doctorName "
                    + "from appointments as app "
                    + "join accounts as a1 on app.patientID = a1.accountID "
                    + "join accounts as a2 on app.doctorID = a2.accountID "
                    + "where app.patientID = ?";

            st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            rs = st.executeQuery();
            while (rs.next()) {
                appointments.add(new Appointment(
                        rs.getInt("appointmentID"),
                        rs.getInt("patientID"),
                        rs.getString("patientName"),
                        rs.getDate("bookedDate"),
                        rs.getInt("slotID"),
                        rs.getInt("doctorID"),
                        rs.getString("doctorName"),
                        rs.getString("sympton"),
                        rs.getString("message")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in AppointmentDAO.getAppointmentsForPat()");
        }

        return appointments;
    }
    
    // Get all appointments for doctor
    public List<Appointment> getAppointmentsForDoc(int doctorID) {
        List<Appointment> appointments = new ArrayList<>();

        try {
            sql = "select app.*, a1.name as patientName, a2.name as doctorName "
                    + "from appointments as app "
                    + "join accounts as a1 on app.patientID = a1.accountID "
                    + "join accounts as a2 on app.doctorID = a2.accountID "
                    + "where app.doctorID = ?";

            st = connection.prepareStatement(sql);
            st.setInt(1, doctorID);
            rs = st.executeQuery();
            while (rs.next()) {
                appointments.add(new Appointment(
                        rs.getInt("appointmentID"),
                        rs.getInt("patientID"),
                        rs.getString("patientName"),
                        rs.getDate("bookedDate"),
                        rs.getInt("slotID"),
                        rs.getInt("doctorID"),
                        rs.getString("doctorName"),
                        rs.getString("sympton"),
                        rs.getString("message")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error in AppointmentDAO.getAppointmentsForPat()");
        }

        return appointments;
    }
    
    // Get specificed appointment
    public Appointment getAppointment(int appointmentID) {
        try {
            sql = "select * from appointments where appointmentID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, appointmentID);
            rs = st.executeQuery();
            
            while (rs.next()) {
                return new Appointment(
                        rs.getInt("appointmentID"),
                        rs.getInt("patientID"),
                        rs.getDate("bookedDate"),
                        rs.getInt("slotID"),
                        rs.getInt("doctorID"),
                        rs.getString("sympton"),
                        rs.getString("message")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error in AppointmentDAO.getAppointment()");
        }
        
        return null;
    }
    
    public List<Integer> busySlot(Date bookedDate, int doctorID) {
        List<Integer> slots = new ArrayList<>();
        
        try {
            sql = "select slotID from oncall where doctorID = ? and bookedDate = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, doctorID);
            st.setDate(2, bookedDate);
            rs = st.executeQuery();
            
            while (rs.next()) {
                slots.add(rs.getInt("slotID"));
            }
        } catch (SQLException e) {
            System.out.println("Error in AppointmentDAO.busySlot()");
        }
        
        return slots;
    }
    
    // Create Appointment
    public boolean createAppointment(int patientID, Date bookedDate, int slotID, int doctorID, String sympton, String message) {
        try {
            sql = "insert into appointments (patientID, bookedDate, slotID, doctorID, sympton, message) "
                    + "values(?, ?, ?, ?, ?, ?)";
            st= connection.prepareStatement(sql);
            st.setInt(1, patientID);
            st.setDate(2, bookedDate);
            st.setInt(3, slotID);
            st.setInt(4, doctorID);
            st.setString(5, sympton);
            st.setString(6, message);
            st.execute();
            return true;
        } catch(SQLException e) {
            System.out.println("Error in AppointmentDAO.createAppointment()");
            return false;
        }
    }
    
    // Update Appointment
    public boolean updateAppointment(int appointmentID, String sympton, String message) {
        try {
            sql = "update appointments set sympton = ?, message = ? where appointmentID = ?";
            st= connection.prepareStatement(sql);
            st.setString(1, sympton);
            st.setString(2, message);
            st.setInt(3, appointmentID);
            st.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Error in AppointmentDAO.updateAppointment()");
            return false;
        }
    }
}
