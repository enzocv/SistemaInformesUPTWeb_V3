
<%@page import="Negocio.ClsNegocioSemestre"%>
<%@page import="Entidad.ClsEntidadSemestre"%>
<%@page import="Entidad.ClsEntidadDocente"%>
<%@page import="Negocio.ClsNegocioDocente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@include file="../../header2.jsp" %>

<%@ page import = "java.util.Map" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //ClsNegocioDocente negoDocente = new ClsNegocioDocente();
    String idSemestre = request.getParameter("idSemestre");
    ArrayList<String> datosSem = null;
    ClsEntidadSemestre entSem = new ClsEntidadSemestre();
    entSem = new ClsNegocioSemestre().MostrarDatosSemestre(idSemestre);
    
    String estado = entSem.getEstadoSemestre().equals("Inactivo") ? "selected" : "";
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Docentes | Sistema de Informes UPT</title>
        
        <!--<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../../css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    </head>
    
<body class="background-gray">
        <div class="container body-padding">
            <div class="row">
                
                <form method="POST" action="/SistemaInformesUPTWeb-V2/ModificarSemestreServlet" class="form-reporte form-consulta shadow" >
                    <fieldset>
                        <div class="form-group">
                            <h2>Mantenimiento de Docentes</h2>
                        </div>
                        
                        <div class="form-group">
                            
                            <div class="form-group">
                                <label style="padding-bottom: .5em;">ID :</label>
                                <input type="text" name="" value="<%=entSem.getIdSemestre()%>" class="form-control" disabled="true"/>
                                <input type="hidden" name="txtID" value="<%=entSem.getIdSemestre()%>" class="form-control" />
                            </div>
                            
                            <div class="form-group">
                                <label style="padding-bottom: .5em;">Nombre :</label>
                                <input type="text" name="txtNombre" value="<%=entSem.getNombreSemestre()%>" class="form-control" />
                            </div>

                            <div class="form-group">
                                <div class="row" >
                                    <div class=" col-lg-6" style="">
                                        <label style="padding-bottom: .5em;">Año :</label>
                                        <input type="number" value="<%=entSem.getAnioSemestre()%>" name="txtAnio" min="1990" max="2050" class="form-control">
                                    </div>

                                    <div class=" col-lg-6" style="">
                                        <label style="padding-bottom: .5em;">Estado :</label>
                                        <select name="cmbEstado" class="form-control">
                                            <option value="Activo" >Activo</option>
                                            <option value="Inactivo" <%=estado%>>Inactivo</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                           

                            <input type="submit" name="Guardar" value="Guardar" class="btn btn-success" style="margin-top: 35px" />                                                                                                          
                            <a href="/SistemaInformesUPTWeb-V2/Mantenimiento/MantenimientoSemestres.jsp" class="btn btn-info" style="margin-top: 35px" >Volver</a>

                        </div>
                        
                    </fieldset>
                </form>
            </div>
        </div>  
                        
        <script>
            $(document).ready(function() {
                $('#tabla').DataTable();
            } );
        </script>
        
    </body>
</html>

