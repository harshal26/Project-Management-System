package servlets;
/*
 *
 *  Sean C. Sullivan 
 *  June 2003
 * 
 *  URL:  http://www.seansullivan.com/
 *  
 */

import javax.servlet.*;
import javax.servlet.http.*;

import utility.ConnectionUtil;
import utility.MyUtility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;








// import the iText packages
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

/** 
 * 
 *  a servlet that will generate a PDF document
 *  and send the document to the client via the 
 *  ServletOutputStream
 * 
 * 
 */
public class PDFServlet extends HttpServlet
{
	Connection con;
	ResultSet res;
	ConnectionUtil util=new ConnectionUtil();
@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws javax.servlet.ServletException, java.io.IOException	
			{
				processRequest(req, resp);
			}
public void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException	
		{
			processRequest(req, resp);
		}

public ResultSet getData(String enrollment)
{
	con=util.beginConnection();
	String sql="select * from tbl_user where enrollment=?";
	PreparedStatement preparedstmt;
	try {
		preparedstmt = con.prepareStatement(sql);
		preparedstmt.setString(1,enrollment);
		res=util.getResult(preparedstmt);
	} catch (SQLException e) {
		System.out.println("Exception in getData()"+e);
	}
	return res;

	
}
	
	public void processRequest(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException
	{
		//System.out.println("HARSHAL");
		DocumentException ex = null;
		
		ByteArrayOutputStream baosPDF = null;
		
		try
		{
			baosPDF = generatePDFDocumentBytes(req);

			////////////////////////////////////////////////////////
			// Note: 
			//
			// It is important to set the HTTP response headers 
			// before writing data to the servlet's OutputStream 
			//
			////////////////////////////////////////////////////////
			//1
			resp.setHeader("Cache-Control", "max-age=30");
			//2
			resp.setContentType("application/pdf");
			
		
			// The Content-disposition value will be in one of 
			// two forms:
			//
			//   1)  inline; filename=foobar.pdf
			//   2)  attachment; filename=foobar.pdf
			//
			// In this servlet, we use "inline"
			//3
			
			String fileName="NOC.pdf";				
			resp.setHeader(
				"Content-disposition",
				"inline;filename="+fileName);
			//4
			resp.setContentLength(baosPDF.size());

			ServletOutputStream sos;

			sos = resp.getOutputStream();
			
			baosPDF.writeTo(sos);
			
			sos.flush();
		}
		
		catch (DocumentException e)
		{
			System.out.println("Exception in PDFServlet:"+e);
		}
		finally
		{
			if (baosPDF != null)
			{
				baosPDF.reset();
			}
		}
		 
	}

	/**
	 *  
	 * @param req must be non-null
	 * 
	 * @return a non-null output stream. The output stream contains
	 *         the bytes for the PDF document
	 * 
	 * @throws DocumentException
	 * @throws SQLException 
	 * 
	 */
	
	
	protected ByteArrayOutputStream generatePDFDocumentBytes(
		final HttpServletRequest req)
		throws DocumentException
		
	{	
		MyUtility myUtil=new MyUtility();
		Document doc = new Document();
		
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		PdfWriter docWriter = null;

		try
		{
			docWriter = PdfWriter.getInstance(doc, baosPDF);
			
			doc.addAuthor("Harshal & Prakruti");
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator(this.getClass().getName());
			doc.addTitle("NOC");
			doc.addKeywords("pdf, itext, Java, open source, http");
			
			doc.setPageSize(PageSize.LETTER);
			
			
			doc.open();
			
			
			String enrollment=req.getSession().getAttribute("USERNAME").toString();
			String name="";
			ResultSet res=getData(enrollment);
			res.first();
			
			String fname=res.getString("firstname");
			String lname=res.getString("lastname");
			String mname=res.getString("middlename");
			String content;
			Paragraph para=null;
			if(fname!=null)
			{
			name=lname+" "+" "+fname+" "+mname;
			System.out.println(name);
			content="This is NOC letter for "+name+" whose Enrollment No is "+enrollment;
			para = new Paragraph(content,
		               FontFactory.getFont(FontFactory.TIMES_BOLD, 14, Font.NORMAL));
			}
			else
			{
				content="ERROR:Your profile is not completed.To get Your NOC, Do fill Your Profile." ;
				para = new Paragraph(content,
			               FontFactory.getFont(FontFactory.TIMES_BOLD, 14, Font.NORMAL,new BaseColor(255,0,0)));
				
			}
			
		 
			doc.add(para);
		
		}
		catch(SQLException e)
		{
			System.out.println("Exception in SQL");
			
		}
		catch (DocumentException dex)
		{
			//baosPDF.reset();
			throw dex; 
		}
		finally
		{
			if (doc != null)
			{
				doc.close();
			}
			if (docWriter != null)
			{
				docWriter.close();
			}
		}
		System.out.println(baosPDF.size());
		if (baosPDF.size() < 1)
		{
			System.out.println("No content in document");
			throw new DocumentException(
				);		
		}
		return baosPDF;
	}
	
	
	
	 
}
