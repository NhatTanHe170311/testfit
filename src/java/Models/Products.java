
package Models;

public class Products {
    private int productID;
    private String productName;
    private double price;
    private String img;
    private String describe;
    private int categoryID;
    private boolean status;

    public Products() {
    }

    public Products(int productID, String productName, double price, String img, String describe, int categoryID, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.img = img;
        this.describe = describe;
        this.categoryID = categoryID;
        this.status = status;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", productName=" + productName + ", price=" + price + ", img=" + img + ", describe=" + describe + ", categoryID=" + categoryID + ", status=" + status + '}';
    }
    
    
}
