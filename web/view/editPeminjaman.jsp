<%-- 
    Document   : editPeminjaman
    Created on : Feb 13, 2021, 8:18:21 PM
    Author     : ASUS
--%>

<%@page import="controller.PinjamLabHome" %>
<jsp:useBean id="pl" class="model.PinjamLab"/>
<jsp:setProperty name="pl" property="*" />

<script type="text/javascript">
    function successAlert() {
        alert("Data BERHASIL diupdate");
    }
    
    function failedAlert() {
        alert("Data GAGAL diupdate");
    }
</script> 


<%
    int i = PinjamLabHome.update(pl);
    
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