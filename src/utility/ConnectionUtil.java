package utility;



import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.sql.*;

public class ConnectionUtil {
	Connection connection = null;
	Statement s=null;
	PreparedStatement preparedStatement;
	String url="jdbc:mysql://localhost/prs";
	String username="root";
	String pw="root";
	ResultSet res=null;
	
	
	
	//method for connection
	public Connection beginConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url,username,pw);
		} catch (Exception E) {
			System.out.println("Excetion in beginConnection() : " + E);
		
		}
	
		return connection;
	}
	
	public void endConnection() 
	{
		try {
			connection.close();
			System.out.println("Connection close");
		}
		catch(Exception e)
		{
			System.out.println("Exception in close connection..");
		
		}
	}
	
	
	//method for update query
	public int execute(String sql) throws SQLException
	{
			Statement stmt=connection.createStatement();
			int result=stmt.executeUpdate(sql);
			System.out.println(result);
			return result;
	}
	
	
	
	public ResultSet getResult(PreparedStatement preparedStatement) throws SQLException
	{
			res = preparedStatement.executeQuery();
			System.out.println("getResult");
			return res;
	}
	
	
	
	
}
