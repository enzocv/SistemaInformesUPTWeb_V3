

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
    
    ClsNegocioDocente negDocente = new ClsNegocioDocente();
    
    String mensaje = "";
    
    ArrayList<ClsNegocioDocente> dato = null;
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
                            <h2>Mantenimiento de Docentes</h2>
                        </div>
                        <div class="form-group">
                            <a href="CRUDDocente/NuevoDocente.jsp" class="btn btn-info" >Agregar Docente</a>
                        </div>
                        
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-striped table-prueba-entrada" border="1" id="tabla">
                                    <thead>
                                        <tr>                                               
                                            <th>Código</th>
                                            <th>Nombre</th>
                                            <th>Email</th>
                                            <th>Celular</th>
                                            <th>Grado</th>
                                            <th>Mantenimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            ClsNegocioDocente datos = new ClsNegocioDocente();

                                            dato = datos.MostrarDocentes();

                                            Iterator iterator = dato.iterator();

                                            while (iterator.hasNext()) {
                                                ClsEntidadDocente objenti = new ClsEntidadDocente();

                                                objenti = (ClsEntidadDocente) iterator.next();

                                                %>

                                                <tr>
                                                        <td> <%= objenti.getCodDocente()%> </td>
                                                        <td> <%= objenti.getNombreDocente()%> </td>
                                                        <td> <%= objenti.getEmailDocente()%> </td>
                                                        <td> <%= objenti.getCelularDocente()%> </td>
                                                        <td> <%= objenti.getGradoDocente()%> </td>
                                                        <td> 
                                                            <a href="CRUDDocente/ModificarDocente.jsp?codDocente=<%=objenti.getCodDocente()%>" class="btn btn-info" >Modificar</a>
                                                            <a href="../EliminarDocenteServlet?codDocente=<%=objenti.getCodDocente() %>" class="btn btn-danger" >Eliminar</a>
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
