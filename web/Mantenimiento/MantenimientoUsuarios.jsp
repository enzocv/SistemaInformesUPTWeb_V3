

<%@page import="Negocio.ClsNegocioDocente"%>
<%@page import="Entidad.ClsEntidadUsuario"%>
<%@page import="Negocio.ClsNegocioUsuario"%>
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
        <title>Mantenimiento de Usuarios | Sistema de Informes UPT</title>
        
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
                            <h2>Mantenimiento de Usuarios</h2>
                        </div>
                        <div class="form-group">
                            <a href="CRUDUsuario/SeleccionarDocente.jsp" class="btn btn-info" >Agregar Usuario</a>
                        </div>
                        
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-striped table-prueba-entrada" border="1" id="tabla">
                                    <thead>
                                        <tr>                                               
                                            <th>ID</th>
                                            <th>Código</th>
                                            <th>Nivel</th>
                                            <th>Estado</th>
                                            <th>Mantenimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            ClsNegocioUsuario datos = new ClsNegocioUsuario();

                                            dato = datos.MostrarUsuarios();

                                            Iterator iterator = dato.iterator();

                                            while (iterator.hasNext()) {
                                                ClsEntidadUsuario objenti = new ClsEntidadUsuario();

                                                objenti = (ClsEntidadUsuario) iterator.next();

                                                %>

                                                <tr>
                                                        <td> <%= objenti.getIdUsuario()%> </td>
                                                        <td> <%= objenti.getCodDocente()%> </td>
                                                        <td> <%= objenti.getNivelUsuario()%> </td>
                                                        <td> <%= objenti.getEstadoUsuario()%> </td>
                                                        <td> 
                                                            <a href="CRUDUsuario/ModificarUsuario.jsp?idUsuario=<%=objenti.getIdUsuario()%>" class="btn btn-info" >Modificar</a>
                                                            <a href="../EliminarUsuarioServlet?idUsuario=<%=objenti.getIdUsuario() %>" class="btn btn-danger" >Eliminar</a>
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
