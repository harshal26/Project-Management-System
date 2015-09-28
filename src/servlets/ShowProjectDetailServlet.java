package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.ProjectDetail;
import pojo.TeamDetail;
import utility.ConnectionUtil;
import utility.MessageConstant;


public class ShowProjectDetailServlet extends HttpServlet {
	ProjectDetail projectDetail;
	GetDetailServlet getDetail;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		projectDetail=new ProjectDetail();
		getDetail=new GetDetailServlet();
		String teamid=request.getParameter("teamid");
		TeamDetail teamDetail=null;
		
		try{
		ConnectionUtil conUtil=new ConnectionUtil();
		Connection con=conUtil.beginConnection();
		HttpSession session=request.getSession();
		String sql="select * from tbl_project where teamid='"+teamid+"'";
		PreparedStatement preparedStatement=con.prepareStatement(sql);
		
		ResultSet res=conUtil.getResult(preparedStatement);
		if(res.first())
		{
			System.out.println("in if");
			System.out.println("Project detail set");
			projectDetail.setTeamid(res.getString("teamid"));
			projectDetail.setProjecttitle(res.getString("projecttitle"));
			projectDetail.setProjecttype(res.getString("projecttype"));
			projectDetail.setProjectdesc(res.getString("projectdesc"));
			projectDetail.setProjecttechnology(res.getString("projecttechnology"));
			projectDetail.setCreationdate(res.getString("creationdate"));
			projectDetail.setCompanyname(res.getString("companyname"));
			projectDetail.setGuidename(res.getString("guidename"));
			projectDetail.setGuidecontact(res.getString("guidecontact"));
			projectDetail.setGuideemail(res.getString("guideemail"));
			projectDetail.setStatus(res.getString("status"));
			System.out.println("Project detail set");
			teamDetail=getDetail.getTeamDetail(request,teamid);
			
		}
		request.setAttribute("PROJECTDETAIL",projectDetail);
		request.setAttribute("TEAMDETAIL",teamDetail);
		request.getRequestDispatcher("projectinfo.jsp").forward(request, response);
		
		
		
	}
	catch (SQLException e) {
		System.out.println("Exception from GetStudentDetailServlet:"+e);
	}
			
}
}
