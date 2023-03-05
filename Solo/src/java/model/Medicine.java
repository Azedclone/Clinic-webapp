package model;

public class Medicine {

    private int medicineID;
    private String name;
    private String brand;
    private String description;

    public Medicine() {
    }

    public Medicine(int medicineID, String name, String brand, String description) {
        this.medicineID = medicineID;
        this.name = name;
        this.brand = brand;
        this.description = description;
    }

    public int getMedicineID() {
        return medicineID;
    }

    public void setMedicineID(int medicineID) {
        this.medicineID = medicineID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
