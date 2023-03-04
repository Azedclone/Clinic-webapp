package model;

import java.sql.Date;

public class Appointment {

    private int appointmentID;
    private int patientID;
    private String patientName;
    private Date bookedDate;
    private int slotID;
    private int doctorID;
    private String doctorName;
    private String sympton;
    private String message;

    public Appointment() {
    }

    public Appointment(int appointmentID, int patientID, Date bookedDate, int slotID, int doctorID, String sympton, String message) {
        this.appointmentID = appointmentID;
        this.patientID = patientID;
        this.bookedDate = bookedDate;
        this.slotID = slotID;
        this.doctorID = doctorID;
        this.sympton = sympton;
        this.message = message;
    }

    public Appointment(int appointmentID, int patientID, String patientName, Date bookedDate, int slotID, int doctorID, String doctorName, String sympton, String message) {
        this.appointmentID = appointmentID;
        this.patientID = patientID;
        this.patientName = patientName;
        this.bookedDate = bookedDate;
        this.slotID = slotID;
        this.doctorID = doctorID;
        this.doctorName = doctorName;
        this.sympton = sympton;
        this.message = message;
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public void setAppointmentID(int appointmentID) {
        this.appointmentID = appointmentID;
    }

    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public Date getBookedDate() {
        return bookedDate;
    }

    public void setBookedDate(Date bookedDate) {
        this.bookedDate = bookedDate;
    }

    public int getSlotID() {
        return slotID;
    }

    public void setSlotID(int slotID) {
        this.slotID = slotID;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getSympton() {
        return sympton;
    }

    public void setSympton(String sympton) {
        this.sympton = sympton;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
