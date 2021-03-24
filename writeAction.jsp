<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dda.DdaDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dda" class="dda.Dda" scope="page"/>
<jsp:setProperty name="dda" property="ddaTitle"/>
<jsp:setProperty name="dda" property="ddaContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>따릉이는 처음이라</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		else{
			if(dda.getDdaTitle()==null||dda.getDdaContent()==null){
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					DdaDAO ddaDAO=new DdaDAO(); 
					int result=ddaDAO.write(dda.getDdaTitle(),userID,dda.getDdaContent());
					if(result == -1){
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("location.href='dda.jsp'");
						script.println("</script>");
					}
		}
		
		}
	%>
</body>
</html>