package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Login
{
  String email;
  String realname;
  String password;
  String phone;
  String address;
  String name;
  String success = "false"; String message = "";
  Connection con = null;
  Statement sql = null;
  ResultSet rs = null;

  public Login()
  {
    try
    {
      Class.forName("org.gjt.mm.mysql.Driver");
    }
    catch (ClassNotFoundException localClassNotFoundException) {
    }
  }

  public void setLogname(String paramString) {
    this.email = paramString;
  }

  public String getLogname() {
    return this.email;
  }

  public void setPassword(String paramString) {
    this.password = paramString;
  }

  public String getPassword() {
    return this.password;
  }

  public void setRealname(String paramString) {
    this.realname = paramString;
  }

  public String getRealname() {
    return this.realname;
  }

  public void setPhone(String paramString) {
    this.phone = paramString;
  }

  public String getPhone() {
    return this.phone;
  }

  public void setAddress(String paramString) {
    this.address = paramString;
  }

  public String getAddress() {
    return this.address;
  }

  public String getSuccess() {
    return this.success;
  }

  public String getMessage()
  {
    Object localObject1;
    Object localObject2;
    if (this.con == null)
    {
      try
      {
        this.con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
        String str1 = "SELECT password,name FROM user WHERE email = ?";

        localObject1 = this.con.prepareStatement(str1);
        ((PreparedStatement)localObject1).setString(1, this.email);
        this.rs = ((PreparedStatement)localObject1).executeQuery();
        localObject2 = null;
        while (this.rs.next())
        {
          localObject2 = this.rs.getString("password");
          this.name = this.rs.getString("name");
        }
        if (this.password.equals(localObject2))
        {
          this.message = "ok";
          this.success = this.name;
        }
        else
        {
          this.message = "输入的密码不正确";
          this.success = "false";
        }
        return this.message;
      }
      catch (SQLException localSQLException1)
      {
        this.message = "输入的邮箱或密码不正确";
        this.success = "false";
        return this.message;
      }

    }

    synchronized (this.con)
    {
      try
      {
        localObject1 = "SELECT password,name FROM user WHERE email = ?";

        localObject2 = this.con.prepareStatement((String)localObject1);
        ((PreparedStatement)localObject2).setString(1, this.email);
        this.rs = ((PreparedStatement)localObject2).executeQuery();
        String str2 = null;
        while (this.rs.next())
        {
          str2 = this.rs.getString("password");
          this.name = this.rs.getString("name");
        }
        if (this.password.equals(str2))
        {
          this.message = "ok";
          this.success = this.name;
        }
        else
        {
          this.message = "输入的密码不正确";
          this.success = "false";
        }
        return this.message;
      }
      catch (SQLException localSQLException2)
      {
        this.message = "输入的邮箱或密码不正确";
        this.success = "false";
        return this.message;
      }
    }
  }
}