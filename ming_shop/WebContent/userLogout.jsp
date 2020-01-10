<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.getSession().invalidate();
%>

<script>
	location.href = 'newindex.jsp';
</script>





