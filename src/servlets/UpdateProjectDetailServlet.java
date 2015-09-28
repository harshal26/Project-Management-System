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
import utility.ConnectionUtil;
import utility.MessageConstant;


public class UpdateProjectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProjectDetail projectDetail;
	GetDetailServlet getDetailServlet;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    getDetailServlet=new GetDetailServlet();
			getDetailServlet.getProjectDetail(request);
			request.getRequestDispatcher("updateprojectdetail.jsp").forward(request,response);		
	}
}
