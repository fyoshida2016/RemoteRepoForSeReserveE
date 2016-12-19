<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="true"%>
<%@ page import="model.User"%>
<%@ page import="model.Room"%>
<%@ page import="model.Reservation"%>
<%@ page import="java.util.LinkedList"%>
<%


	LinkedList<Reservation> reservations = (LinkedList<Reservation>) request.getAttribute("Reservations");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title id="title">会議室一覧</title>
</head>
<body>
<center>

会議室予約システム

<p>
予約一覧
</p>

<table align="center" border="1">
<thead>
<tr>
<td>部屋</td>
<td>使用者</td>
<td>使用年月日</td>
<td>開始時刻</td>
<td>終了時刻</td>
<td></td>
</tr>
</thead>
<tbody>
<% for(Reservation reservation :reservations){ %>
<tr>
<td><%= reservation.getRoom().getName() %></td>
<td><%= reservation.getUser().getName() %></td>
<td><%= reservation.getStartYear() + "年" + reservation.getStartMonth() + "月" + reservation.getStartDay() + "日" %>
<td><%= reservation.getStartHour() + "時" + reservation.getStartMinute() + "分" %></td>
<td><%= reservation.getPeriodHour() + "時" + reservation.getPeriodMinute() + "分" %></td>
<td>
<form method="post" action="RoomDetailsServlet">
<input type="hidden" name="RID" value="<%= reservation.getRid() %>" />
<input type="submit" value="詳細" />
</form>
</td>
<tr>
<%}%>
</tbody>
</table>
</form>

<font size="4">&copy;</font> H28 Software Engineering All Right Reserved.

</center>
</body>
</html>