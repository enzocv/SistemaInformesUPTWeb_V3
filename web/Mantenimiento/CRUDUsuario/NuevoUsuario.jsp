
<%@page import="Negocio.ClsNegocioUsuario"%>
<%@page import="Negocio.ClsNegocioDocente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@include file="../../header2.jsp" %>

<%@ page import = "java.util.Map" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ClsNegocioUsuario negoUsuario = new ClsNegocioUsuario();
    String idUsu = negoUsuario.ObtenerID();
    negoUsuario.conexion.close();
    
    String codDoc = request.getParameter("codDocente");
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Usuarios | Sistema de Informes UPT</title>
        
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
                
                <form method="POST" action="/SistemaInformesUPTWeb-V2/GuardarUsuarioServlet" class="form-reporte form-consulta shadow" >
                    <fieldset>
                        <div class="form-group">
                            <h2>Nuevo Usuario</h2>
                        </div>
                        
                        <div class="form-group">
                            
                            <div class="form-group">
                                <label style="padding-bottom: .5em;">Id :</label>
                                <input type="text" name="txtI" value="<%=idUsu%>" class="form-control" disabled/>
                                <input type="hidden" name="txtId" value="<%=idUsu%>" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label style="padding-bottom: .5em;">Código :</label>
                                <input type="text" name="txtCod" value="<%=codDoc%>" class="form-control" disabled/>
                                <input type="hidden" name="txtCodigo" value="<%=codDoc%>" class="form-control"/>
                            </div>
                            
                             <div class="form-group">
                                <label style="padding-bottom: .5em;">Contraseña :</label>
                                <input type="password" name="txtContrasenia" value="123" class="form-control" />
                            </div>

                            <div class="form-group">
                                <div class="row" >
                                    <div class=" col-lg-6" style="">
                                        <label style="padding-bottom: .5em;">Nivel :</label>

                                        <select name="cmbNivel" class="form-control">
                                            <option value="Usuario">   Usuario   </option>
                                            <option value="Supervisor">   Supervisor  </option>
                                            <option value="Administrador">   Administrador </option>
                                        </select>
                                    </div>

                                    <div class=" col-lg-6" style="">
                                        <label style="padding-bottom: .5em;">Estado :</label>
                                        <select name="cmbEstado" class="form-control">
                                            <option value="Activo"     >   Activo   </option>
                                            <option value="Inactivo"    >   Inactivo  </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                           

                            <input type="submit" name="Guardar" value="Guardar" class="btn btn-success" style="margin-top: 35px" />                                                                                                          
                            <a href="/SistemaInformesUPTWeb-V2/Mantenimiento/MantenimientoUsuarios.jsp" class="btn btn-info" style="margin-top: 35px" >Volver</a>

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

