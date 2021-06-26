<%@ page language="java" import="java.util.*,java.sql.*,makecon.GetConnection"  pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%! Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	//System.out.println("sdflsjdfldsakjfkldsjfsd");
	
	%>
          
	  <%
	  RequestDispatcher rd1=request.getRequestDispatcher("CheckTableName.jsp");
	  String name =null;
	  try{
	        GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			RequestDispatcher rd=request.getRequestDispatcher("TableExisted.jsp");
			RequestDispatcher rd2=request.getRequestDispatcher("EnterName.jsp");

			stmt=conn.createStatement();
			name=request.getParameter("tablename");
			if(name=="")
			{
			rd2.forward(request,response);
			}
			else
			{
			String que="select count(*) from "+name;
			
			int n=stmt.executeUpdate(que);
			System.out.println(n);
			if(n!=0)
			    rd.forward(request,response);
			}
			}
			catch(Exception e)
			{
			//keep the table name in sesssion scope for future purpose
			request.getSession().setAttribute("tabname",name);
			request.setAttribute("ok","AVAILABLE");
			    rd1.forward(request,response);
			    }  
			 %>
			
            
			
		