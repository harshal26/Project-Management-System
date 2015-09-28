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

import pojo.ForumDetail;
import pojo.ProjectDetail;
import utility.ConnectionUtil;
import utility.MyUtility;

/**
 * Servlet implementation class ViewPendingDefinitionServlet
 */
public class ViewPendingDefinitionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ConnectionUtil util=new ConnectionUtil();
		MyUtility myUtil=new MyUtility();
		String flag=request.getParameter("flag");
		System.out.println("flag"+flag);
		List<ProjectDetail> pendingdefList=new ArrayList<ProjectDetail>();
		List<ProjectDetail> approveddefList=new ArrayList<ProjectDetail>();
		List<ProjectDetail> alldefList=new ArrayList<ProjectDetail>();
		 try{
		 String sql="";
		 Connection connection=util.beginConnection();
		 HttpSession session=request.getSession();
		 if(flag.equals("pending"))
		 {
			 System.out.println("in pending");
		 sql="select * from tbl_project where status='Pending' AND teamid IN(SELECT teamid from tbl_team where facultyid='"+session.getAttribute("FACULTYID")+"') ";
		
		 System.out.println(sql);
		 PreparedStatement pstmt=connection.prepareStatement(sql);
		 ResultSet res=util.getResult(pstmt);
		 res.beforeFirst();
		 while(res.next())
		 {
			 ProjectDetail projectDetail=new ProjectDetail();
			 projectDetail.setProjecttitle(res.getString("projecttitle"));
			 projectDetail.setTeamid(res.getString("teamid"));
			 pendingdefList.add(projectDetail);
		 }
		 
		 request.setAttribute("PendingDefList",pendingdefList);
			request.getRequestDispatcher("pendingdefinition.jsp").forward(request,response);
		 }
		 else if(flag.equalsIgnoreCase("approved"))
		 {
			 System.out.println("in approved");

			 sql="select * from tbl_project where status='Accept' AND teamid IN(SELECT teamid from tbl_team where facultyid='"+session.getAttribute("FACULTYID")+"') ";
				
			 System.out.println(sql);
			 PreparedStatement pstmt=connection.prepareStatement(sql);
			 ResultSet res=util.getResult(pstmt);
			 res.beforeFirst();
			 while(res.next())
			 {
				 ProjectDetail projectDetail=new ProjectDetail();
				 projectDetail.setProjecttitle(res.getString("projecttitle"));
				 projectDetail.setTeamid(res.getString("teamid"));
				 approveddefList.add(projectDetail);
			 }
			 
			 request.setAttribute("ApprovedDefList",approveddefList);
				request.getRequestDispatcher("approveddefinition.jsp").forward(request,response);
			 
			 
		 }
		 
		 else
		 {
			 System.out.println("in all");

			 sql="select * from tbl_project where status='Accept'";
				
			 System.out.println(sql);
			 PreparedStatement pstmt=connection.prepareStatement(sql);
			 ResultSet res=util.getResult(pstmt);
			 res.beforeFirst();
			 while(res.next())
			 {
				 ProjectDetail projectDetail=new ProjectDetail();
				 projectDetail.setProjecttitle(res.getString("projecttitle"));
				 projectDetail.setTeamid(res.getString("teamid"));
				 projectDetail.setCreationdate(res.getString("creationdate"));
				 alldefList.add(projectDetail);
			 }
			 System.out.println("LIST size:"+alldefList.size());
			 request.setAttribute("AllDefList",alldefList);
				request.getRequestDispatcher("alldefinition.jsp").forward(request,response);
			 

			 
		 }
		 
		 } catch(SQLException SQLE) {
	        	System.out.println("SQL Exception in processRequest() from ViewPendingDefinitionServlet class" + SQLE);
	        	
	        } catch(Exception E) {
	        	System.out.println("Exception in processRequest() from ViewPendingDefinitionServlet class" + E);	
	        	
	        }
	        finally{
	        	util.endConnection();
	        }
	
		
	}

}
