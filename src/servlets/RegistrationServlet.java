package servlets;




import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

import utility.ConnectionUtil;
import utility.MessageConstant;



/**
 *
 * @author harshal
 */
public class RegistrationServlet extends HttpServlet {

    
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        ConnectionUtil util=new ConnectionUtil();
        try {
    		String enrollment=request.getParameter("enrollment");
    		String password=request.getParameter("password");
    		String email=request.getParameter("email");
    		String branch=request.getParameter("branch");
    		String passout=request.getParameter("passout");
    		util.beginConnection();
        	String sql = "insert into tbl_user(Enrollment,Password,Email,branchcode,passout) values('"+enrollment+"','"+password+"','"+email+"','"+branch+"','"+passout+"')";
        	if(util.execute(sql)==1) {
	        	MessageConstant.setStatus("SUCCESS");
	        	MessageConstant.setMessage("Successfully Registered.\n You can login now.");
	           	response.sendRedirect("user.jsp");
        	}
        } catch (MySQLIntegrityConstraintViolationException e) {
			System.out.println("Error in insert query:"+e);
			MessageConstant.setStatus("ERROR");
			MessageConstant.setMessage("Enrollment already Exists.");
			response.sendRedirect("register.jsp");
		}	
        catch(SQLException SQLE) {
        	System.out.println("SQL Exception in processRequest() from RegistrationServlet class" + SQLE);
        	MessageConstant.setStatus("ERROR");
        	response.sendRedirect("register.jsp");
        } catch(Exception E) {
        	System.out.println("Exception in processRequest() from RegistrationServlet class" + E);	
        	MessageConstant.setStatus("ERROR");
        	response.sendRedirect("register.jsp");
        }
        finally{
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
