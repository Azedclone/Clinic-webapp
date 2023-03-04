package model;

import java.sql.Date;

public class Account {

    private int accountID;
    private String username;
    private String password;
    private String email;
    private String avatar;
    private String name;
    private String phone;
    private int gender;
    private String address;
    private Date dob;
    private int role;
    private int status;

    public Account() {
    }

    public Account(int accountID, String username, String password, String email, String avatar, String name, String phone, int gender, String address, Date dob, int role, int status) {
        this.accountID = accountID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.avatar = avatar;
        this.name = name;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.dob = dob;
        this.role = role;
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
