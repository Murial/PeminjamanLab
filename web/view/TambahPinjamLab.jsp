<%-- 
    Document   : TambahPinjamLab
    Created on : Feb 10, 2021, 5:41:18 PM
    Author     : ASUS
--%>

<%@page import="controller.PinjamLabHome" %>
<jsp:useBean id="pl" class="model.PinjamLab"/>
<jsp:setProperty name="pl" property="*" />

<script type="text/javascript">
    function successAlert() {
        alert("Data BERHASIL diinputkan");
    }
    
    function failedAlert() {
        alert("Data GAGAL diinputkan");
    }
</script> 



<%
    int i = PinjamLabHome.save(pl);
    System.out.println(i);

    if (i > 0) {
        %>
        <script type="text/javascript"> window.onload = successAlert;</script>
        <%
        response.sendRedirect("index.jsp");
    } else {
        %>
        <script type="text/javascript"> window.onload = failedAlert;</script>
        <%
        response.sendRedirect("index.jsp");
    }
%>
