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

import pojo.FacultyDetail;
import pojo.ProjectDetail;
import pojo.StudentDetail;
import pojo.TeamDetail;
import utility.ConnectionUtil;
import utility.MessageConstant;

/**
 * Servlet implementation class GetDetailServlet
 */
public class GetDetailServlet extends HttpServlet {
	StudentDetail studentDetail;
	ProjectDetail projectDetail;
	FacultyDetail facultyDetail;
	TeamDetail teamDetail;
	
	
	
	
	public StudentDetail getStudentDetail(HttpServletRequest request)
	{
		ConnectionUtil conUtil=new ConnectionUtil();
		Connection con=conUtil.beginConnection();
		HttpSession session=request.getSession();
		studentDetail=new StudentDetail();
		String sql="select * from tbl_user where Enrollment=?";
		try {
			PreparedStatement preparedStatement=con.prepareStatement(sql);
			System.out.println(session.getAttribute("USERNAME").toString());
			preparedStatement.setString(1,session.getAttribute("USERNAME").toString());
			ResultSet res=conUtil.getResult(preparedStatement);
			if(res.first())
			{
				System.out.println("in if");
			studentDetail.setFirstname(res.getString("firstname"));
			System.out.println("firstname set");
			studentDetail.setLastname(res.getString("lastname"));
			studentDetail.setMiddlename(res.getString("middlename"));
			studentDetail.setBirthdate(res.getString("birthdate"));
			studentDetail.setBranchcode(res.getString("branchcode"));
			studentDetail.setContactno(res.getString("contactno"));
			studentDetail.setAddress(res.getString("address"));
			studentDetail.setGender(res.getString("gender"));
			studentDetail.setEmail(res.getString("email"));
			studentDetail.setPassout(res.getString("passout"));
			}
			request.setAttribute("STUDENTDETAIL",studentDetail);
		
			
		}
		catch (SQLException e) {
			System.out.println("Exception from GetDetailServlet:"+e);
		}
		
		
		return studentDetail;
		
	}
	
	public ProjectDetail getProjectDetail(HttpServletRequest request)
	{
		projectDetail=new ProjectDetail();
		try{
		ConnectionUtil conUtil=new ConnectionUtil();
		Connection con=conUtil.beginConnection();
		HttpSession session=request.getSession();
		String sql="select * from tbl_project where teamid=?";
		PreparedStatement preparedStatement=con.prepareStatement(sql);
		System.out.println(session.getAttribute("TEAMID").toString());
		preparedStatement.setString(1,session.getAttribute("TEAMID").toString());
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
			
		}
		request.setAttribute("PROJECTDETAIL",projectDetail);
		
	}
	catch (SQLException e) {
		System.out.println("Exception from GetStudentDetailServlet:"+e);
	}
		return projectDetail;
		
	}
	
	
	public FacultyDetail getFacultyDetail(HttpServletRequest request)
	{
		ConnectionUtil conUtil=new ConnectionUtil();
		Connection con=conUtil.beginConnection();
		HttpSession session=request.getSession();
		facultyDetail=new FacultyDetail();
		String sql="select * from tbl_faculty where Id=(select facultyid from tbl_team where teamid='"+session.getAttribute("TEAMID")+"')";
		System.out.println(sql);
		try {
			PreparedStatement preparedStatement=con.prepareStatement(sql);
			ResultSet res=conUtil.getResult(preparedStatement);
			if(res.first())
			{
				System.out.println("in if");
			facultyDetail.setId(res.getInt("ID"));
			facultyDetail.setFirstname(res.getString("firstname"));
			facultyDetail.setLastname(res.getString("lastname"));
			facultyDetail.setMobileno(res.getString("mobileno"));
			facultyDetail.setEmail(res.getString("email"));
			System.out.println("FacultyDetail set");
			
			}
			request.setAttribute("FACULTYDETAIL",facultyDetail);
		
			
		}
		catch (SQLException e) {
			System.out.println("Exception from GetDetailServlet:"+e);
		}
		
		
		return facultyDetail;
		
	}
	
	public TeamDetail getTeamDetail(HttpServletRequest request,String teamid)
	{
	ConnectionUtil conUtil=new ConnectionUtil();
	Connection con=conUtil.beginConnection();
	HttpSession session=request.getSession();
	String id=teamid;
	teamDetail=new TeamDetail();
	String sql="select * from tbl_team where teamid='"+id+"'";
	System.out.println(sql);
	try {
		PreparedStatement preparedStatement=con.prepareStatement(sql);
		ResultSet res=conUtil.getResult(preparedStatement);
		if(res.first())
		{
			System.out.println("in if");
			teamDetail.setCreatedby(res.getString("createdby"));
			teamDetail.setMember1(res.getString("member1"));
			teamDetail.setMember2(res.getString("member2"));
			teamDetail.setMember3(res.getString("member3"));
		
		System.out.println("TeamDetail set");
		
		}
		request.setAttribute("TEAMDETAIL",teamDetail);
	
		
	}
	catch (SQLException e) {
		System.out.println("Exception from GetDetailServlet:"+e);
	}
	
	
	return teamDetail;
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			HttpSession session=request.getSession();
			if(session.getAttribute("TEAMID")==null||session.getAttribute("TEAMID").equals(""))
			{
				System.out.println("in if");
				MessageConstant.setStatus("ERROR");
				MessageConstant.setMessage("You are unable to watch profile.First Complete Your profile and team registration.");
				response.sendRedirect("studentdash.jsp");
			}
			else
			{
			System.out.println("in else");
			getStudentDetail(request);
			getProjectDetail(request);
			getFacultyDetail(request);
			request.getRequestDispatcher("viewprofile.jsp").forward(request, response);
			}
					
	}

}
