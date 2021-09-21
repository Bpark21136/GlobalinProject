<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject"%>

<%
	int sqlOK = (Integer)request.getAttribute("sqlOK");
	
	JSONObject result = new JSONObject();
	result.put("sqlOK", sqlOK);
	
	out.println(result);
%>