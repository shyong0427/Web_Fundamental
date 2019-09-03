<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json;charset=utf-8"%>

<% 
	JSONObject jsonObj = new JSONObject();
//	jsonObj.put("name", "심헌용"); // {"name" : "심헌용" }
//	out.print(jsonObj.toString());
	
	JSONArray jsonArray = new JSONArray();
	jsonObj.put("cafelist", jsonArray); // {"cafelist" : []}
	
	JSONObject item1 = new JSONObject();
	item1.put("name", "심헌용");
	item1.put("clubid", "shyong0427");
	jsonArray.add(item1);
	
	JSONObject item2 = new JSONObject();
	item2.put("name", "스티브");
	item2.put("clubid", "steve3023");
	jsonArray.add(item2);
	
	JSONObject item3 = new JSONObject();
	item3.put("name", "손정의");
	item3.put("clubid", "sje3294");
	jsonArray.add(item3);
	
	out.print(jsonObj.toString());
%>