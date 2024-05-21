/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author tanng
 */
public class ListOrderInfo {
    private int oredrID;
    private int userID;
    private String productName;
    private int quantity;
    private double total;
    private String date;
    private int status;

    public ListOrderInfo() {
    }

    public ListOrderInfo(int oredrID, int userID, String productName, int quantity, double total, String date, int status) {
        this.oredrID = oredrID;
        this.userID = userID;
        this.productName = productName;
        this.quantity = quantity;
        this.total = total;
        this.date = date;
        this.status = status;
    }

    public int getOredrID() {
        return oredrID;
    }

    public void setOredrID(int oredrID) {
        this.oredrID = oredrID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
