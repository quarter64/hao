package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Register
{
  String test = "";
  String name = ""; String password = ""; String sex = ""; String age = ""; String email = ""; String phone = ""; String address = "";
  String backNews;
  Connection con;
  Statement sql;
  ResultSet rs;

  public Register()
  {
    try
    {
      Class.forName("org.gjt.mm.mysql.Driver");
    }
    catch (ClassNotFoundException localClassNotFoundException) {
    }
  }

  public void setLogname(String paramString) {
    this.name = paramString;
  }

  public String getLogname() {
    return this.name;
  }

  public void setAge(String paramString) {
    this.age = paramString;
  }

  public String getAge() {
    return this.age;
  }

  public void setSex(String paramString) {
    this.sex = paramString;
  }

  public String getSex() {
    return this.sex;
  }

  public void setPassword(String paramString) {
    this.password = paramString;
  }

  public String getPassword() {
    return this.password;
  }

  public void setEmail(String paramString) {
    this.email = paramString;
  }

  public String getEmail() {
    return this.email;
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

  public String getBackNews() {
    return this.backNews;
  }

  public void setBackNews(String paramString) {
    this.backNews = paramString;
  }

  public void addItem()
  {
    try
    {
      Connection localConnection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");

      if (this.phone.length() == 0)
      {
        this.phone = "无";
      }
      if (this.email.length() == 0)
      {
        this.email = "无";
      }
      if (this.address.length() == 0)
      {
        this.address = "无";
      }

      String str1 = "INSERT INTO usermessage VALUES(?,?,?,?,?,?)";
      String str2 = "INSERT INTO user VALUES(?,?,?)";

      PreparedStatement localPreparedStatement1 = localConnection.prepareStatement(str1);
      localPreparedStatement1.setString(1, this.sex);
      localPreparedStatement1.setString(2, this.age);
      localPreparedStatement1.setString(3, this.phone);
      localPreparedStatement1.setString(4, this.email);
      localPreparedStatement1.setString(5, this.name);
      localPreparedStatement1.setString(6, this.address);
      localPreparedStatement1.executeUpdate();

      PreparedStatement localPreparedStatement2 = localConnection.prepareStatement(str2);
      localPreparedStatement2.setString(1, this.email);
      localPreparedStatement2.setString(2, this.password);
      localPreparedStatement2.setString(3, this.name);
      localPreparedStatement2.executeUpdate();

      this.backNews = "注册成功!";
      localConnection.close();
    }
    catch (SQLException localSQLException)
    {
      this.backNews = "你的javascript脚本尚未打开或该用户名已存在，请你更换一个名字!";
    }
  }
}