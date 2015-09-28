package servlets;




import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import utility.ConnectionUtil;
import utility.MessageConstant;


/**
 *
 * @author harshal
 */
public class LoginServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // response.setContentType("text/html;charset=UTF-8");
       // PrintWriter out = response.getWriter();
    	ConnectionUtil util = new ConnectionUtil();
        try {
           
        	PreparedStatement preparedStatement;
        	ResultSet rs;
        	Connection connection = util.beginConnection();
        	
        	String enrollment=request.getParameter("enrollment");
        	String password=request.getParameter("password");
        	String username=request.getParameter("uname");
        	System.out.println(username);
        	String flag=request.getParameter("flag");
        	if(flag.equals("student")) //if student login
        	{
        	String sql = "select * from tbl_user where enrollment=?";
        	preparedStatement = connection.prepareStatement(sql);
        	preparedStatement.setString(1, enrollment);
        	rs=util.getResult(preparedStatement);
        	//System.out.println("query executed...");
           	HttpSession session=request.getSession();
           	if(rs.isBeforeFirst() && rs.next()) {//if found enrollment in database
        		if(password.equals(rs.getString("password")))
        		{
        			System.out.println("in if");
        			session.setAttribute("ISLOGIN", true);
        			session.setAttribute("USERNAME",enrollment ); 
        			if(rs.getString("teamid")!=null)
        			session.setAttribute("TEAMID", rs.getString("teamid"));
        			else
        			session.setAttribute("TEAMID","");
        			System.out.println("team id"+rs.getString("teamid"));
        		    response.sendRedirect("studentdash.jsp");
        		} 
        		else
        		{
        			System.out.println("student1");
        			MessageConstant.setMessage("Wrong Username or Password");
            		response.sendRedirect("user.jsp");
        		}
        	}
           	else //if not found enrollment in database
    		{
           		System.out.println("student2");
           		MessageConstant.setStatus("ERROR");
           		MessageConstant.setMessage("User does not  exist");
        		response.sendRedirect("user.jsp");
    		}
        	}
        	
        	
        	
        	else //if admin login
        	{
        		String sql = "select * from tbl_faculty where username=?";
            	preparedStatement = connection.prepareStatement(sql);
            	preparedStatement.setString(1, username);
            	rs=util.getResult(preparedStatement);
            	//System.out.println("query executed...");
               	HttpSession session=request.getSession();
               	if(rs.isBeforeFirst() && rs.next()) {//if found user in database
            		if(password.equals(rs.getString("password")))
            		{
            			System.out.println("in if");
            			session.setAttribute("ISLOGIN", true);
            			session.setAttribute("USERNAME",username);
            			System.out.println("FAculty id:"+rs.getInt("Id"));
            			session.setAttribute("FACULTYID", rs.getInt("Id"));
             		    response.sendRedirect("admindash.jsp");
            		} 
            		else
            		{
            			System.out.println("admin1");
            			MessageConstant.setMessage("Wrong Username or Password");
                		response.sendRedirect("admin.jsp");
            		}
            	}
               	else //if user not found in database
        		{
               		System.out.println("admin2");
               		MessageConstant.setMessage("User does not exist");
            		response.sendRedirect("admin.jsp");
        		}
        		
        		
        		
        	}
        	 
        
          
        } catch (SQLException e) {
			System.out.println("Exception in LoginServlet:"+e);
		} finally {            
			util.endConnection();
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
}
