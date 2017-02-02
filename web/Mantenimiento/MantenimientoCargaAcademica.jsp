<%-- 
    Document   : MantenimientoCargaAcademica
    Created on : 02-feb-2017, 0:17:21
    Author     : Asus
--%>

<%@page import="Entidad.ClsEntidadCargaAcedemica"%>
<%@page import="Negocio.ClsNegocioCargaAcademica"%>
<%@page import="Entidad.ClsEntidadPlanEstudio"%>
<%@page import="Negocio.ClsNegocioPlanEstudio"%>
<%@page import="Entidad.ClsEntidadSemestre"%>
<%@page import="Negocio.ClsNegocioSemestre"%>
<%@page import="Entidad.ClsEntidadDocente"%>
<%@page import="Negocio.ClsNegocioDocente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@include file="../header2.jsp" %>
<%@ page import = "java.util.Map" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String codDocente = String.valueOf(session.getAttribute("codDocente"));
    String nivelUsuario = String.valueOf(session.getAttribute("nivelUsuario"));    
    
    ResultSet rs = null;
    
    ClsNegocioCargaAcademica negDocente = new ClsNegocioCargaAcademica();
    
    String mensaje = "";
    
    ArrayList<ClsNegocioCargaAcademica> dato = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Carga Academica | Sistema de Informes UPT</title>
        
        <!--<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    </head>
    
<body class="background-gray">
        <div class="container body-padding">
            <div class="row">
                <form class="form-reporte form-consulta shadow">
                    <fieldset>
                        <div class="form-group">
                            <h2>Mantenimiento de Carga Academica</h2>
                        </div>
                        <div class="form-group">
                            <a href="CRUDCargaAcademica/NuevoCargaAcademica.jsp" class="btn btn-info" >Agregar Carga Academica</a>
                        </div>
                        
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-striped table-prueba-entrada" border="1" id="tabla">
                                    <thead>
                                        <tr>                                               
                                            <th>Id</th>
                                            <th>Plan de Estudio</th>
                                            <th>Semestre</th>
                                            <th>Curso</th>
                                            <th>Matriculados</th>
                                            <th>Retirados</th>
                                            <th>Abandono</th>
                                            <th>Docente</th>
                                            <th>Sección</th>
                                            <th>Mantenimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            ClsNegocioCargaAcademica datos = new ClsNegocioCargaAcademica();

                                            dato = datos.MostrarCargaAcademica();

                                            Iterator iterator = dato.iterator();

                                            while (iterator.hasNext()) {
                                                ClsEntidadCargaAcedemica objenti = new ClsEntidadCargaAcedemica();

                                                objenti = (ClsEntidadCargaAcedemica) iterator.next();

                                                %>

                                                <tr>
                                                        <td> <%= objenti.getIdCargaAcademica()%> </td>
                                                        <td> <%= objenti.getNombrePlanEstudio()%> </td>
                                                        <td> <%= objenti.getNombreSemestre()%> </td>
                                                        <td> <%= objenti.getIdCurso()%> </td>
                                                        <td> <%= objenti.getAlumnosMatriculados()%> </td>
                                                        <td> <%= objenti.getAlumnosRetirados()%> </td>
                                                        <td> <%= objenti.getAlumnosAbandono()%> </td>
                                                        <td> <%= objenti.getNombreDocente()%> </td>
                                                        <td> <%= objenti.getSeccion()%> </td>
                                                        <td> 
                                                            <a href="CRUDCargaAcademica/ModificarCargaAcademica.jsp?id=<%=objenti.getIdCargaAcademica()%>" class="btn btn-info" >Modificar</a>
                                                            <a href="../Elimina?id=<%=objenti.getIdCargaAcademica()%>" class="btn btn-danger" >Eliminar</a>
                                                        </td>                                                                                                                 
                                                <%

                                            }
                                            datos.conexion.close();                                          
                                        %>
                                    </tbody>                                    
                                </table>
                            </div>
                           
                        </div>
                        <div class="form-group">
                            <p><%=mensaje%></p>
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
