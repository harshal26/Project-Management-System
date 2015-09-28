package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

import utility.ConnectionUtil;
import utility.MessageConstant;
import utility.MyUtility;

import java.util.*;

/**
 * Servlet implementation class MakeTeam
 */
@WebServlet("/MakeTeam")
public class RegisterTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 ConnectionUtil util=new ConnectionUtil();
	 MyUtility myUtil=new MyUtility();
	 Connection con;
	 
	int assignFaculty(String createdBy)
	{
		int teamcounter=0,facultycounter=0,facultyid=-1;
		String sql="select * from tbl_user where enrollment="+createdBy;
		PreparedStatement pstmt;
		ResultSet res=null;
		try {
			pstmt = con.prepareStatement(sql);
		
		res=util.getResult(pstmt);
		res.first();
		String branch=res.getString("branchcode");
		System.out.println("Branch:"+branch);
		
		//get teamcounter
	
		sql="select * from tbl_team where teamid LIKE '"+branch+"%'";
		pstmt=con.prepareStatement(sql);
		res=util.getResult(pstmt);
		res.beforeFirst();
		while(res.next())
		{
			teamcounter++;
		}
		System.out.println("Teamcounter"+teamcounter);
		
			
		//get facultycounter 
		sql="select * from tbl_faculty where branchcode='"+branch+"'";
		
		pstmt=con.prepareStatement(sql);
		res=util.getResult(pstmt);
		res.beforeFirst();
		while(res.next())
		{
			facultycounter++;
		}
		
		
		System.out.println("Facultycounter"+facultycounter);
			
			int temp=0;
			//int i=teamcounter%facultycounter;
			List facultyList=new ArrayList();
			res.beforeFirst();
			while(res.next())
			{
				{
					facultyList.add(res.getInt("Id"));
				}
			}
			System.out.println("harshal");
			System.out.println("List size:"+facultyList.size());
					
			facultyid=(int)facultyList.get(teamcounter%facultycounter);
			System.out.println("faculty id:"+facultyid);
			
		} catch (SQLException e) {
			System.out.println("Error in assignFaculty() from registerteam servlet. "+ e);
		}
		
		return facultyid;
		
		
	}
	
	
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		
	}
	
	
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 HttpSession session=request.getSession();
		 con=util.beginConnection();
		 
		 try{
			 boolean flag=false;
	         String member1, member2, member3, createdBy, teamId, date=null, sql=null;
	         int facultyid;
			
			 member1 = request.getParameter("member1");
	         member2 = request.getParameter("member2");
	         member3 = request.getParameter("member3");
	         createdBy = session.getAttribute("USERNAME").toString();
	         facultyid=this.assignFaculty(createdBy);
	         teamId = myUtil.createTeamID(con,createdBy,member1,member2,member3);//will be null if something goes wrong...
	         System.out.println("teamId: " + teamId);
	         if(teamId != null) {
	        	date = myUtil.getCurrentDate();
				sql="update tbl_user SET teamid='"+teamId+"' WHERE enrollment IN ('"+createdBy+ "','"+member1+ "','"+member2+ "','"+member3+ "')";
				System.out.println(sql);
				util.execute(sql);
				sql="insert into tbl_project(teamid) values ('"+teamId+"')";
				util.execute(sql);//entry into project table
				sql = "insert into tbl_team(teamid,facultyid,member1,member2,member3,createdBy,creationdate) values('"+teamId+"','"+facultyid+"','"+member1+"','"+member2+"','"+member3+"','"+createdBy+"','"+date+"')";
				System.out.println(sql);	
				if(util.execute(sql)==1)
				{
					session.setAttribute("TEAMID",teamId);
		        	MessageConstant.setStatus("SUCCESS");
		        	MessageConstant.setMessage("Your team has been registered Successfully with ID:"+teamId);
		           	response.sendRedirect("studentdash.jsp");
	        	}
	         } else {
	        	 // Error should be sent to JSP page with message "Team is not generated due to some reason."
	        	 MessageConstant.setStatus("ERROR");
	        	response.sendRedirect("registerteam.jsp");
	         }
		 }
		
		 catch (SQLException e) {
				System.out.println("Exception in TeamServlet:"+e);
				response.sendRedirect("registerteam.jsp");
			} finally {  
				System.out.println("Connection close from RegisterTeam");
				util.endConnection();
	        }
		
	}

}
