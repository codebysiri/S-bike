<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dda.Dda" %>
<%@ page import="dda.DdaDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		if(userID == null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int ddaID=0;
		if(request.getParameter("ddaID")!=null)
			ddaID=Integer.parseInt(request.getParameter("ddaID"));
		if(ddaID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='dda.jsp'");
			script.println("</script>");
		}
		Dda dda = new DdaDAO().getDda(ddaID);
		if(!userID.equals(dda.getUserID())){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='dda.jsp'");
			script.println("</script>");
		} else{
			if(request.getParameter("ddaTitle")==null||request.getParameter("ddaContent")==null
					||request.getParameter("ddaTitle").equals("")||request.getParameter("ddaContent").equals("")){
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					DdaDAO ddaDAO=new DdaDAO();
					int result=ddaDAO.update(ddaID, request.getParameter("ddaTitle"),request.getParameter("ddaContent"));
					if(result == -1){
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정에 실패했습니다.')");
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