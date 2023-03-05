package dal;

import helper.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import org.apache.commons.codec.digest.DigestUtils;

public class AccountDAO extends DBContext {

    private String sql;
    private PreparedStatement st;
    private ResultSet rs;

    // Get all accounts
    public List<Account> getAccounts() {
        List<Account> accounts = new ArrayList<>();

        try {
            sql = "select * from accounts where status = 1 and (role = 1 or role = 2)";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                accounts.add(new Account(
                        rs.getInt("accountID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("avatar"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getDate("dob"),
                        rs.getInt("role"),
                        rs.getInt("status")));
            }
        } catch (SQLException e) {

        }
        return accounts;
    }

    public List<Account> getAccountsByRole(int role) {
        List<Account> accounts = new ArrayList<>();

        try {
            sql = "select * from accounts where status = 1 and role = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, role);
            rs = st.executeQuery();

            while (rs.next()) {
                accounts.add(new Account(
                        rs.getInt("accountID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("avatar"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getDate("dob"),
                        rs.getInt("role"),
                        rs.getInt("status")));
            }
        } catch (SQLException e) {

        }
        return accounts;
    }

    public boolean isExist(String username) {
        boolean flag = false;
        try {
            sql = "select * from accounts where username = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();

            while (rs.next()) {
                return !flag;
            }
        } catch (SQLException e) {
            System.out.println("Error in AccountDAO.isExist()");
        }
        return flag;
    }

    // Get single account
    public Account getAccount(String username) {
        try {
            sql = "select * from accounts where username = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();

            while (rs.next()) {
                return new Account(
                        rs.getInt("accountID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("avatar"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getDate("dob"),
                        rs.getInt("role"),
                        rs.getInt("status"));
            }
        } catch (SQLException e) {
            System.out.println("Error in AccountDAO.getAccount()");
        }
        return null;
    }
    
    // Get single account
    public Account getAccount(String username, String password) {
        try {
            sql = "select * from accounts where username = ? and password = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            rs = st.executeQuery();

            while (rs.next()) {
                return new Account(
                        rs.getInt("accountID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("avatar"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getDate("dob"),
                        rs.getInt("role"),
                        rs.getInt("status"));
            }
        } catch (SQLException e) {
            System.out.println("Error in AccountDAO.getAccount()");
        }
        return null;
    }

    public void register(String username, String password, int role, int status) {
        try {
            sql = "insert into accounts(username, password, role, status) values(?, ?, ?, ?)";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, role);
            st.setInt(4, status);
            st.execute();
        } catch (SQLException e) {
            System.out.println("Error in AccountDAO.insertAccount()");
        }
    }

    public void changePassword(String username, String password) {
        password = DigestUtils.md5Hex(password).toUpperCase();

        try {
            sql = "update accounts set password = ? where username = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.execute();
        } catch (SQLException e) {
            System.out.println("Error in AccountDAO.changePassword()");
        }
    }

    public boolean editAccount(String username, String email, String avatar, String name, String phone, int gender, String address, Date dob) {
        try {
            sql = "update accounts set email = ?,"
                    + "avatar = ?,"
                    + "name = ?,"
                    + "phone = ?,"
                    + "gender = ?,"
                    + "address = ?,"
                    + "dob = ? WHERE username = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, avatar);
            st.setString(3, name);
            st.setString(4, phone);
            st.setInt(5, gender);
            st.setString(6, address);
            st.setDate(7, dob);
            st.setString(8, username);
            st.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Error in AccountDAO.editAccount()");
            return false;
        }
    }

    public boolean deleteAccount(String username) {
        try {
            sql = "update accounts set status = 0 where username = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Error in AccountDAO.deleteAccount()");
            return false;
        }
    }
}
