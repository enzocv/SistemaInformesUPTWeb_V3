<%-- 
    Document   : agregarUnidad
    Created on : 08-dic-2016, 10:00:57
    Author     : enzocv
--%>

<%@page import="Negocio.ClsNegocioUnidad"%>
<%@page import="Entidad.ClsEntidadUnidad"%>
<%
    if (request.getParameter("Enviar") != null) {
        String descripcionUnidad = request.getParameter("descripcionUnidad");
        String estadoUnidad      = request.getParameter("estadoUnidad");
        
        ClsEntidadUnidad entiUnidad = new ClsEntidadUnidad();
        entiUnidad.setDescripcionUnidad(descripcionUnidad);
        entiUnidad.setEstadoUnidad(estadoUnidad);
        
        ClsNegocioUnidad negoUnidad = new ClsNegocioUnidad();
        negoUnidad.AgregarUnidad(entiUnidad);
        
        try {
            negoUnidad.conexion.close();
            response.sendRedirect("Unidad.jsp");
        } catch (Exception e) {
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Unidad</title>
    </head>
    <body>
        <div class="container body-padding">
            <div class="row">
                <div class="form-reporte shadow">
                    <form class="form" id="form" method="post" action="">
                        <fieldset>
                            <div class="form-group">
                                <div class="sub-title">  
                                    <h2>Agregar nueva Unidad</h2>
                                    <br>
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-2 ">Descripción Unidad :</label>
                                    <div class="col-lg-4">
                                        <input type="text" name="descripcionUnidad" class="form-control input-sm" id="" value=''>
                                    </div>                      
                                </div>
                                <br>
                                <div class="row">                                
                                    <label class="col-lg-2 ">Estado Unidad :</label>
                                    <div class="col-lg-4">
                                        <select name="estadoUnidad" class="form-control ">
                                            <option value="Activo"          id="estado"> Activo      </option>
                                            <option value="Inactivo"        id="estado"> Inactivo    </option>
                                            <option value="Desactivado"     id="estado"> Desactivado </option>
                                        </select>
                                    </div>                      
                                </div>
                                    <br><br>
                                <div class="row">
                                    <div class="col-lg-2">
                                        <input  type="submit" name="Enviar" value="Enviar" class="btn btn-success form-control" />
                                    </div>                      
                                </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div> 
    </body>
</html>
