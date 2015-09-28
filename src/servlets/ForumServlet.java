package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.ConnectionUtil;
import utility.MessageConstant;
import utility.MyUtility;
import pojo.*;


public class ForumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ConnectionUtil util=new ConnectionUtil();
		MyUtility myUtil=new MyUtility();
		List<ForumDetail> forumDetailList=new ArrayList<ForumDetail>();
		 try{
			
		 Connection connection=util.beginConnection();
		 HttpSession session=request.getSession();
		 String sql="SELECT * from tbl_forum";
		 PreparedStatement pstmt=connection.prepareStatement(sql);
		 ResultSet res=util.getResult(pstmt);
		 res.beforeFirst();
		 while(res.next())
		 {
			 ForumDetail forumDetail=new ForumDetail();
			 forumDetail.setForamId(res.getString("forumid"));
			 forumDetail.setQuestion(res.getString("question"));
			 forumDetail.setUserId(res.getString("userid"));
			 forumDetail.setCreationDate(res.getString("creationDate"));
			 forumDetailList.add(forumDetail);
		 }
		 request.setAttribute("ForumDetailList",forumDetailList);
		request.getRequestDispatcher("forum.jsp").forward(request,response);
		
		 
		
		 
		 
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
