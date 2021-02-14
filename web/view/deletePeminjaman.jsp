<%-- 
    Document   : deletePeminjaman
    Created on : Feb 13, 2021, 7:59:59 PM
    Author     : ASUS
--%>

<%@page import="controller.PinjamLabHome" %>
<jsp:useBean id="pl" class="model.PinjamLab"/>
<jsp:setProperty name="pl" property="*" />

<script type="text/javascript">
    function successAlert() {
        alert("Data BERHASIL dihapus");
    }
    function failedAlert() {
        alert("Data GAGAL dihapus");
    }
}

<%
    int i = PinjamLabHome.delete(pl);
    
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
