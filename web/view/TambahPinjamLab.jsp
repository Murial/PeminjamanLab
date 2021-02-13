<%-- 
    Document   : TambahPinjamLab
    Created on : Feb 10, 2021, 5:41:18 PM
    Author     : ASUS
--%>

<%@page import="controller.PinjamLabHome" %>
<jsp:useBean id="pl" class="model.PinjamLab"/>
<jsp:setProperty name="pl" property="*" />

<%
    int i = PinjamLabHome.save(pl);
    System.out.println(i);
    
    if (i > 0) {
            response.sendRedirect("Success.jsp");
        } else {
        response.sendRedirect("Failed.jsp");
    }
%>
