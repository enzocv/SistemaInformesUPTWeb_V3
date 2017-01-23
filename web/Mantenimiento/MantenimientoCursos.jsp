<%-- 
    Document   : MantenimientoCursos
    Created on : 17-ene-2017, 11:16:11
    Author     : Asus
--%>


<%@page import="Entidad.ClsEntidadCurso"%>
<%@page import="Negocio.ClsNegocioCurso"%>
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
    
    ClsNegocioCurso negCurso = new ClsNegocioCurso();
    
    String mensaje = "";
    
    ArrayList<ClsNegocioCurso> dato = null;
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Cursos | Sistema de Informes UPT</title>
        
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
                            <h2>Mantenimiento de Cursos</h2>
                        </div>
                        <div class="form-group">
                            <a href="CRUDCurso/NuevoCurso.jsp" class="btn btn-info" >Agregar Curso Nuevo</a>
                        </div>
                        
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-striped table-prueba-entrada" border="1" id="tabla">
                                    <thead>
                                        <tr>                                               
                                            <th>ID</th>
                                            <th>Nombre Curso</th>
                                            <th>H.Teoricas</th>
                                            <th>H.Practicas</th>
                                            <th>Total Horas</th>
                                            <th>Creditos</th>
                                            <th>Ciclo</th>
                                            <th>Tipo de Curso</th>
                                            <th>Pre-Requisito</th>
                                            <th>Mantenimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            ClsNegocioCurso datos = new ClsNegocioCurso();

                                            dato = datos.seleccionarTodasLosCursos();

                                            Iterator iterator = dato.iterator();

                                            while (iterator.hasNext()) {
                                                ClsEntidadCurso objenti = new ClsEntidadCurso();

                                                objenti = (ClsEntidadCurso) iterator.next();

                                                %>

                                                <tr>
                                                        <td> <%= objenti.getIdCurso() %> </td>
                                                        <td> <%= objenti.getNombre()  %> </td>
                                                        <td> <%= objenti.getHorasTeoricas() %> </td>
                                                        <td> <%= objenti.getHorasPracticas() %> </td>
                                                        <td> <%= objenti.getTotalHoras() %> </td>
                                                        <td> <%= objenti.getCreditos() %> </td>
                                                        <td> <%= objenti.getCiclo() %> </td>
                                                        <td> <%= objenti.getTipoCurso() %> </td>
                                                        <td> <%= objenti.getPreRequisito() %> </td>
                                                        <td> 
                                                            <a href="CRUDCurso/ModificarCurso.jsp?idCurso=<%=objenti.getIdCurso()%>" class="btn btn-info" >Modificar</a>
                                                            <a href="../ModificarCursoServlet?idCurso=<%=objenti.getIdCurso() %>" class="btn btn-danger" >Eliminar</a>
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
