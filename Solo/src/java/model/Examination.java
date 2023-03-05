package model;

import java.sql.Date;

public class Examination {

    private int examinationID;
    private int patientID;
    private String patientName;
    private int serviceID;
    private String serviceName;
    private int doctorID;
    private String doctorName;
    private Date createdDate;
    private int status;
    private String result;

    public Examination() {
    }

    public Examination(int examinationID, int patientID, int serviceID, int doctorID, Date createdDate, int status, String result) {
        this.examinationID = examinationID;
        this.patientID = patientID;
        this.serviceID = serviceID;
        this.doctorID = doctorID;
        this.createdDate = createdDate;
        this.status = status;
        this.result = result;
    }

    public Examination(int examinationID, int patientID, String patientName, int serviceID, String serviceName, int doctorID, String doctorName, Date createdDate, int status, String result) {
        this.examinationID = examinationID;
        this.patientID = patientID;
        this.patientName = patientName;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.doctorID = doctorID;
        this.doctorName = doctorName;
        this.createdDate = createdDate;
        this.status = status;
        this.result = result;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getExaminationID() {
        return examinationID;
    }

    public void setExaminationID(int examinationID) {
        this.examinationID = examinationID;
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

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

}
