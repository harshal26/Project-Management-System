package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.ConnectionUtil;
import utility.MessageConstant;
import utility.MyUtility;

public class SubmitQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ConnectionUtil util=new ConnectionUtil();
		MyUtility myUtil=new MyUtility();
		 try{
			
		 Connection connection=util.beginConnection();
		 HttpSession session=request.getSession();
		
		 
		String question=request.getParameter("question");
		String userid=(String)session.getAttribute("USERNAME");
		 String date=myUtil.getCurrentDate();
		 
		 
		 String sql = "insert into tbl_forum(question,userid,creationdate) values('"+question+"','"+userid+"','"+date+"')";
		 System.out.println(sql);
		 if(util.execute(sql)==1) {
	        	MessageConstant.setStatus("SUCCESS");
	        	MessageConstant.setMessage("successfully updated!!!");
	          	response.sendRedirect("studentdash.jsp");
 	}
		 
		 
		 
		 }
		 catch(SQLException SQLE) {
	        	System.out.println("SQL Exception in processRequest() from SubmitQuestionServlet class" + SQLE);
	        	
	        } catch(Exception E) {
	        	System.out.println("Exception in processRequest() from SubmitQuestionServlet class" + E);	
	        	
	        }
	        finally{
	        	util.endConnection();
	        }
	
	
	
	}
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		
	}

}
