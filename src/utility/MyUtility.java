package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.*;

public class MyUtility {
	
	Connection con;
	
	public String getCurrentDate()
	{
		Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
	     
        Date currentTime = localCalendar.getTime();
        int day = localCalendar.get(Calendar.DATE);
        int month = localCalendar.get(Calendar.MONTH) + 1;
        int year = localCalendar.get(Calendar.YEAR);
        String date=Integer.toString(year)+"-"+Integer.toString(month)+"-"+Integer.toString(day);
        return date;
		
	}
	
	String[] sortArray(String[] enrollment)
	{
		int length=enrollment.length;
		System.out.println("length:"+length);
		int no[]=new int[length];
		for(int i=0;i<length;i++)
		{
			if(enrollment[i]!="")
			no[i]=Integer.parseInt(enrollment[i].substring(9));
			else
			no[i]=0;
		}
		
		for(int i=0;i<4;i++)
		{
			System.out.println("no[i]:"+no[i]);
		}
		for(int i=0;i<length;i++)
		{
			for(int j=i+1;j<length;j++)
			{
				if(no[i]>no[j])
				{
					int k=no[i];
					no[i]=no[j];
					no[j]=k;
					
				}
			}
		}
		
		for(int i=0;i<4;i++)
		{
			System.out.println("no[i]:"+no[i]);
		}
		
		for(int i=0;i<length;i++)
		{
			if(no[i]==0)
			enrollment[i]="000";	
		    else if(no[i]>0&&no[i]<10)
			enrollment[i]="00"+Integer.toString(no[i]);
			else if(no[i]>9&&no[i]<100)
			enrollment[i]="0"+Integer.toString(no[i]);
			else
			enrollment[i]=Integer.toString(no[i]);
			
		}
		return enrollment;
	}
	
	public boolean checkUserRegistration(String... enrollment)
	{
		ConnectionUtil util = new ConnectionUtil();
		con = util.beginConnection();
		StringBuffer sql = new StringBuffer("SELECT enrollment,teamid from tbl_user where enrollment IN (");
		try {
			int counter = 0, rowCounter = 0;
			for (int iCNTR = 0 ; iCNTR < enrollment.length ; iCNTR++) {
				if (enrollment[iCNTR] != null && enrollment[iCNTR] != "") {
					sql.append("'" + enrollment[iCNTR] + "'");
					if (iCNTR != (enrollment.length - 1) && (enrollment[iCNTR + 1] != null && enrollment[iCNTR + 1] != "")) {
						sql.append(",");
					}
					counter++;
				}
				
			}
			sql.append(")");
			System.out.println("SQL: " + sql.toString());
			PreparedStatement preparedstmt=con.prepareStatement(sql.toString());
			
			ResultSet res=util.getResult(preparedstmt);
			while (res.next()) {
				rowCounter++;
				if(res.getString("teamid")!=null && !res.getString("teamid").isEmpty())
				{
					MessageConstant.setStatus("ERROR");
					MessageConstant.setMessage(res.getString("enrollment") + " is already registerd with Team.");
					return false;
				}
			}
			
			System.out.println("rowCounter: " + rowCounter);
			System.out.println("Counter: " + counter);
			
			if(counter != rowCounter) {
				MessageConstant.setStatus("ERROR");
				MessageConstant.setMessage("You are entered wrong enrollment number.");
				return false;
			}
			return true;
		} catch (Exception e) {
			System.out.println("Exception in checkUserRegistration():" + e);
			MessageConstant.setMessage("ERROR in Enrollment");
			return false;
		}
		
	}
	
	public String createTeamID(Connection con,String... enrollment)
	{
		boolean flag=false;
		String date=null;
		String branch=null;
		String createdBy=enrollment[0], member1=enrollment[1], member2=enrollment[2], member3=enrollment[3] ;
		String teamID=null;
		
		if(!createdBy.equals(member1) && !createdBy.equals(member2) && !createdBy.equals(member3))
		{
			flag = checkUserRegistration(enrollment);
			ConnectionUtil util=new ConnectionUtil();
	        
	        if(flag) {
				String sql="SELECT * from tbl_user where enrollment=?";
				try {
					PreparedStatement preparedstmt=con.prepareStatement(sql);
					preparedstmt.setString(1,createdBy);
					ResultSet res=util.getResult(preparedstmt);
					res.first();//to set cursor properly in first place....
					branch=res.getString("branchcode");
					date=res.getString("passout");
					if(member1==null&&member2==null&&member3==null)
					{
						teamID=branch+date.substring(0,4)+"000000000"+enrollment[0].substring(9);
					}
					else
					{
					String temp[]=sortArray(enrollment);
					teamID=branch+date.substring(0,4)+temp[0]+temp[1]+temp[2]+temp[3];
					
					}
				} catch (SQLException e) {
					System.out.println("Exception in createTeamID():"+e);
				}
	        } else {
	        	return null;
	        }
		} else {
			MessageConstant.setMessage("You can not be a member.");
			return null;
		}
		return teamID;
	}
	

}
