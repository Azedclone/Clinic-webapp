package model;

public class Service {
    private int serviceID;
    private String name;
    private double price;
    private int status;

    public Service() {
    }

    public Service(int serviceID, String name, double price, int status) {
        this.serviceID = serviceID;
        this.name = name;
        this.price = price;
        this.status = status;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
