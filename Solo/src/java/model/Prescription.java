package model;

import java.sql.Date;

public class Prescription {

    private int prescriptionID;
    private int patientID;
    private String patientName;
    private int medicineID;
    private String medicineName;
    private String instruction;
    private int doctorID;
    private String doctorName;
    private Date createdDate;

    public Prescription() {
    }

    public Prescription(int prescriptionID, int patientID, int medicineID, String instruction, int doctorID, Date createdDate) {
        this.prescriptionID = prescriptionID;
        this.patientID = patientID;
        this.medicineID = medicineID;
        this.instruction = instruction;
        this.doctorID = doctorID;
        this.createdDate = createdDate;
    }

    public Prescription(int prescriptionID, int patientID, String patientName, int medicineID, String medicineName, String instruction, int doctorID, String doctorName, Date createdDate) {
        this.prescriptionID = prescriptionID;
        this.patientID = patientID;
        this.patientName = patientName;
        this.medicineID = medicineID;
        this.medicineName = medicineName;
        this.instruction = instruction;
        this.doctorID = doctorID;
        this.doctorName = doctorName;
        this.createdDate = createdDate;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getPrescriptionID() {
        return prescriptionID;
    }

    public void setPrescriptionID(int prescriptionID) {
        this.prescriptionID = prescriptionID;
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

    public int getMedicineID() {
        return medicineID;
    }

    public void setMedicineID(int medicineID) {
        this.medicineID = medicineID;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
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

}
