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

import pojo.ProjectDetail;
import pojo.TeamDetail;
import utility.ConnectionUtil;
import utility.MyUtility;

/**
 * Servlet implementation class ViewTeamServlet
 */
public class ViewTeamServlet extends HttpServlet {
	
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ConnectionUtil util=new ConnectionUtil();
		MyUtility myUtil=new MyUtility();
		List<TeamDetail> teamList=new ArrayList<TeamDetail>();
		try{
		 String sql="";
		 Connection connection=util.beginConnection();
		 HttpSession session=request.getSession();
		 
		 sql="select * from tbl_team where facultyid='"+session.getAttribute("FACULTYID")+"' ";
		
		 System.out.println(sql);
		 PreparedStatement pstmt=connection.prepareStatement(sql);
		 ResultSet res=util.getResult(pstmt);
		 res.beforeFirst();
		 while(res.next())
		 {
			 TeamDetail teamDetail=new TeamDetail();
			 teamDetail.setTeamid(res.getString("teamid"));  
			 teamDetail.setCreatedby(res.getString("createdby"));
			 teamDetail.setCreationdate(res.getString("creationdate"));  
			 teamList.add(teamDetail);
		 }
		 
		 request.setAttribute("TeamList",teamList);
			request.getRequestDispatcher("viewteam.jsp").forward(request,response);
		 
	}
		catch(SQLException SQLE) {
        	System.out.println("SQL Exception in processRequest() from ViewPendingDefinitionServlet class" + SQLE);
        	
        } catch(Exception E) {
        	System.out.println("Exception in processRequest() from ViewPendingDefinitionServlet class" + E);	
        	
        }
        finally{
        	util.endConnection();
        }

	}	
}
	
