package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BuyGoods
{
  String id;
  String order_number;
  String book_name;
  String email;
  Connection con;
  Statement sql;
  Statement sql1;
  ResultSet rs;

  public BuyGoods()
  {
    try
    {
      Class.forName("org.gjt.mm.mysql.Driver");
    }
    catch (ClassNotFoundException localClassNotFoundException) {
    }
  }

  public void setId(String paramString) {
    this.id = paramString;
  }

  public String getId() {
    return this.id;
  }

  public void setEmail(String paramString) {
    this.email = paramString;
  }

  public String getEmail() {
    return this.email;
  }

  public void setOrder_number(String paramString) {
    this.order_number = paramString;
  }

  public String getOrder_number() {
    return this.order_number;
  }

  public String insertOrderForm()
  {
    String str1 = this.id;
    String str2 = "'" + this.email + "'";
    try
    {
      Connection localConnection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
      this.sql = localConnection.createStatement();
      String str3 = "SELECT email FROM buygoods WHERE id=" + str1;

      this.rs = this.sql.executeQuery(str3);
      if (!this.rs.next())
      {
        String str4 = "INSERT INTO buygoods(id,email,history) VALUES (?,?,1)";
        PreparedStatement localPreparedStatement = localConnection.prepareStatement(str4);

        int i = Integer.parseInt(str1);
        localPreparedStatement.setInt(1, i);
        localPreparedStatement.setString(2, str2);

        localPreparedStatement.executeUpdate();
      }
      else
      {
        return "该物品已经被订购了,但是并不代表已经出售!";
      }
      localConnection.close();
    }
    catch (SQLException localSQLException)
    {
      return "不允许直接进入该网页!错误信息BUYGOODS 78";
    }
    return "订购成功!";
  }
}