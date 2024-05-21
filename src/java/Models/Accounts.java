
package Models;

public class Accounts {
    private int id;
    private String accoutName;
    private String password;
    private int isAdmin;

    public Accounts() {
    }

    public Accounts(int id, String accoutName, String password, int isAdmin) {
        this.id = id;
        this.accoutName = accoutName;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccoutName() {
        return accoutName;
    }

    public void setAccoutName(String accoutName) {
        this.accoutName = accoutName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Accounts{" + "id=" + id + ", accoutName=" + accoutName + ", password=" + password + ", isAdmin=" + isAdmin + '}';
    }
    
    
}
