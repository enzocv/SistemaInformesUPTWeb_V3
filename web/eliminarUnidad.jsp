<%-- 
    Document   : eliminarUnidad
    Created on : 08-dic-2016, 10:32:38
    Author     : enzocv
--%>

<%@page import="Negocio.ClsNegocioUnidad"%>
<%
    String idUnidad = request.getParameter("idUnidad");
    ClsNegocioUnidad negoUnidad = new ClsNegocioUnidad();
    negoUnidad.EliminarUnidad(idUnidad);
    
    try {
        negoUnidad.conexion.close();
        response.sendRedirect("Unidad.jsp");
    } catch (Exception e) {
    }
%>
