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

import pojo.StudentDetail;
import pojo.StudentDetail;
import utility.ConnectionUtil;


public class UpdateStudentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentDetail StudentDetail;
	GetDetailServlet getDetailServlet=new GetDetailServlet();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			StudentDetail=getDetailServlet.getStudentDetail(request);
			request.getRequestDispatcher("updateprofile.jsp").forward(request,response);		
	}
}
