<%@ page contentType="image/jpeg"%>
<jsp:useBean id="image" scope="page"
	class="com.game.util.MakeCertPic" />

<%

	String str = image.getCerPic(0, 0, response.getOutputStream());
	session.setAttribute("certCode", str);
	out.clear();
	out = pageContext.pushBody();
%>
