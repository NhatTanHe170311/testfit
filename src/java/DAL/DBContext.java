/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Accounts;
import Models.Carts;
import Models.Categorys;
import Models.Item;
import Models.ListOrderInfo;
import Models.OrderInfo;
import Models.Products;
import Models.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tanng
 */
public class DBContext {

    Connection connection;
    public static DBContext INSTANCE = new DBContext();

    public static DBContext getInstance() {
        return INSTANCE;
    }

    public DBContext(Connection connection) {
        this.connection = connection;
    }

    public DBContext() {
        try {
            String user = "sa";
            String pass = "12345678";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_8";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Categorys> getCategory() {
        ArrayList<Categorys> cate = new ArrayList<>();
        try {
            String sql = "SELECT [categoryID]"
                    + "    ,[categoryName]\n"
                    + "FROM [Category]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Categorys ct = new Categorys();
                ct.setCategoryID(rs.getInt("categoryID"));
                ct.setCategoryName(rs.getString("categoryName"));
                cate.add(ct);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return cate;
    }

    public ArrayList<Products> getAllProduct() {
        ArrayList<Products> pro = new ArrayList<>();
        try {
            String sql = "Select productID,productName,price,img,describe,categoryID, status \n"
                    + "from\n"
                    + "Product where hidend=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, 1);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getDouble("price"));
                p.setImg(rs.getString("img"));
                p.setDescribe(rs.getString("describe"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setStatus(rs.getBoolean("status"));
                pro.add(p);
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return pro;
    }

    public ArrayList<Products> getProductByCategory(int id) {
        ArrayList<Products> pro = new ArrayList<>();
        try {
            String sql = "Select productID,productName,price,img,describe,categoryID, status \n"
                    + "from\n"
                    + "Product\n"
                    + " where categoryID = ? and hidend=1;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getDouble("price"));
                p.setImg(rs.getString("img"));
                p.setDescribe(rs.getString("describe"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setStatus(rs.getBoolean("status"));
                pro.add(p);
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return pro;
    }

    public Products getProductByID(int id) {
        try {
            String sql = "Select productID,productName,price,img,describe,categoryID, status \n"
                    + "from\n"
                    + "Product\n"
                    + " where productID = ? and hidend=1;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getString("img"),
                        rs.getString("describe"),
                        rs.getInt("categoryID"),
                        rs.getBoolean("status"));
                return p;
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public ArrayList<Products> getProductByName(String name) {
        ArrayList<Products> pro = new ArrayList<>();
        try {
            String sql = "Select productID,productName,price,img,describe,categoryID, status \n"
                    + "from\n"
                    + "Product\n"
                    + " where productName like ? and hidend=1;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getDouble("price"));
                p.setImg(rs.getString("img"));
                p.setDescribe(rs.getString("describe"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setStatus(rs.getBoolean("status"));
                pro.add(p);
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return pro;
    }

    public Accounts login(String name, String pass) {
        try {
            String sql = "Select *\n"
                    + "from\n"
                    + "Account\n"
                    + " where accountName = ? and password=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, pass);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Accounts acc = new Accounts(
                        rs.getInt("accountID"),
                        rs.getString("accountName"),
                        rs.getString("password"),
                        rs.getInt("roleID")
                );
                return acc;
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Accounts checkAccountExsit(String name) {
        try {
            String sql = "Select *\n"
                    + "from\n"
                    + "Account\n"
                    + " where accountName = ? and password=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Accounts acc = new Accounts(
                        rs.getInt("accountID"),
                        rs.getString("accountName"),
                        rs.getString("password"),
                        rs.getInt("roleID")
                );
                return acc;
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void signup(String user, String pass) {
        String sql = "insert into Account\n"
                + "values(?,?,2)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user);
            statement.setString(2, pass);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public int getAccountID(String name) {
        int id = 0;
        try {
            String sql = "Select *\n"
                    + "from\n"
                    + "Account\n"
                    + " where accountName = ?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                id = rs.getInt("accountID");
                return id;
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return id;
    }

    public void insertUser(String name, String phone, String address, int accountID) {
        String sql = "insert into Users\n"
                + "values(?,?,?,?);";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, phone);
            statement.setString(3, address);
            statement.setInt(4, accountID);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);

        }

    }

    public Users getUserByAccID(int id) {
        String sql = "select * from Users u\n"
                + "inner join Account a on u.accountID=a.accountID\n"
                + "where a.accountID=?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Users acc = new Users(
                        rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("accountID")
                );
                return acc;
            }
            rs.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }
    
    public void deleteProductByID(int id) {
        String sql = "update Product set hidend=? \n"
            + "where productID=?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, 0);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }
    
    public void insertProduct(String name, float price, String img, String decribe, int categoryID, int status) {
        String sql = "insert into Product\n"
                + "values(?,?,?,?,?,?,?);";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setFloat(2, price);
            statement.setString(3, img);
            statement.setString(4, decribe);
            statement.setInt(5, categoryID);
            statement.setInt(6, status);
            statement.setInt(7, 1);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);

        }

    }
    
        public void updateProduct(String name, float price, String img, String decribe, int categoryID, int status,int id) {
        String sql = "update Product\n"
                +"set productName=?,\n"
                +"price=?,\n"
                +"img=?,\n"
                +"describe=?,\n"
                +"categoryID=?,\n"
                +"status=?\n"
                + "where productID=?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setFloat(2, price);
            statement.setString(3, img);
            statement.setString(4, decribe);
            statement.setInt(5, categoryID);
            statement.setInt(6, status);
            statement.setInt(7, id);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);

        }

    }
    
        
    // them yeu cau vao database
    public void addOrder(Users u, Carts c){
        DateFormat dateFormat =  new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        String date=dateFormat.format(cal.getTime());
        try{
            String sql="insert into Orders values(?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,u.getUserID());
            statement.setFloat(2, c.totalMoney());
            statement.setString(3, date);
            statement.executeUpdate();
            
            String sql1="select top 1 orderID from Orders order by orderID DESC";
            PreparedStatement statement1 = connection.prepareStatement(sql1);
            ResultSet rs = statement1.executeQuery();
            if(rs.next()){
                int orderID=rs.getInt(1);
                for(Item i : c.getItems()){
                    String sql2="insert into OrderDetail values(?,?,?,?)";
                    PreparedStatement statement2 = connection.prepareStatement(sql2);
                    statement2.setInt(1,i.getProduct().getProductID());
                    statement2.setInt(2, orderID);
                    statement2.setInt(3,i.getQuantity());
                    statement2.setFloat(4,i.getPrice());
                    statement2.executeUpdate();
                    
                    String sql3="insert into OrderStatus values(?,?)";
                    PreparedStatement statement3 = connection.prepareStatement(sql3);
                    statement3.setInt(1,orderID);
                    statement3.setInt(2, 0);
                    statement3.executeUpdate();
                    
                }
            }
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    public ArrayList<OrderInfo> getOrderInfo(int userID){
        String sql = """
                     select distinct o.orderID, p.productName, od.quantity,o.total,o.date, os.status from
                     Orders o inner join OrderDetail od on o.orderID=od.orderID
                     inner join OrderStatus os on o.orderID=os.orderID
                     inner join Product p on p.productID=od.productID
                     where o.userID=?;""";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,userID);
            ResultSet rs = statement.executeQuery();
            ArrayList<OrderInfo> lod=new ArrayList<>();
            while (rs.next()) {
                OrderInfo od = new OrderInfo(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
                lod.add(od);
                
            }
            rs.close();
            return lod;
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<ListOrderInfo> getAllOrderInfo(){
        String sql = """
                     select o.orderID,o.userID, p.productName, od.quantity,o.total,o.date, os.status from
                     Orders o inner join OrderDetail od on o.orderID=od.orderID
                     inner join OrderStatus os on o.orderID=os.orderID
                     inner join Product p on p.productID=od.productID;
                     """;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            ArrayList<ListOrderInfo> lod=new ArrayList<>();
            while (rs.next()) {
                ListOrderInfo od = new ListOrderInfo(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
                lod.add(od);
                
            }
            
            rs.close();
            return lod;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void updateOrder(String id) {
        String sql = "update OrderStatus set status = 1 where orderID = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }
    

    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        ArrayList<Categorys> cate = dbContext.getCategory();
        ArrayList<Products> pro = dbContext.getAllProduct();
        
        
        ArrayList<ListOrderInfo> o=dbContext.getAllOrderInfo();

            System.out.println(o.size());


    }
}
