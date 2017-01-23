<%-- 
    Document   : NuevoCurso
    Created on : 21-ene-2017, 11:20:33
    Author     : Asus
--%>


<!DOCTYPE html>
<html><%-- 
    Document   : MantenimientoCursos
    Created on : 17-ene-2017, 11:16:11
    Author     : Asus
--%>


<%@page import="Entidad.ClsEntidadCurso"%>
<%@page import="Negocio.ClsNegocioCurso"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@include file="../../header2.jsp" %>

<%@ page import = "java.util.Map" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Cursos | Sistema de Informes UPT</title>
        
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
                
                <form method="POST" action="/SistemaInformesUPTWeb-V2/GuardarCursoServlet" class="form-reporte form-consulta shadow" >
                    <fieldset>
                        <div class="form-group">
                            <h2>Mantenimiento de Cursos</h2>
                        </div>
                        
                        <div class="form-group">
                            
                            <div class="form-group">
                                <label style="padding-bottom: .5em;">Id Curso:</label>
                                <input type="text" name="txtIdCurso" value="" class="form-control" />
                            </div>

                            <div class="form-group">
                                <label style="padding-bottom: .5em;">Nombre:</label>
                                <input type="text" name="txtNombre" value="" class="form-control" />
                            </div>

                            <div class="form-group">
                                <div class="row" >
                                    <div class=" col-lg-6" style="">
                                        <label style="padding-bottom: .5em;">H.Teoricas:</label>
                                        <input type="number" value="" name="txtHTeoricas" min="0" max="5" step="1"  required="required" class="form-control">
                                    </div>

                                    <div class=" col-lg-6" style="">
                                        <label style="padding-bottom: .5em;">H. Practicas:</label>
                                        <input type="number" value="" name="txtHPracticas" min="0" max="5" step="1"  required="required" class="form-control">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <label style="padding-bottom: .5em;">Creditos:</label>
                                        <input type="number" name="txtCreditos" min="0" max="5" step="1"  required="required" class="form-control">
                                    </div>

                                    <div class="col-lg-6">
                                        <label style="padding-bottom: .5em;">Ciclo:</label>

                                        <select name="txtCiclo" class="form-control">
                                            <option value="I"     >   I   </option>
                                            <option value="II"    >   II  </option>
                                            <option value="III"   >   III </option>
                                            <option value="IV"    >   IV  </option>
                                            <option value="V"     >   V   </option>
                                            <option value="VI"    >   VI  </option>
                                            <option value="VII"   >   VII </option>
                                            <option value="VIII"  >   VIII</option>
                                            <option value="IX"    >   IX  </option>
                                            <option value="X"     >   X   </option>
                                        </select>
                                    </div>

                                </div>

                            </div>


                            <div class="form-group">
                                <label style="padding-bottom: .5em;">Tipo Curso:</label>

                                <select name="txtTipoCurso" class="form-control">
                                    <option value="Ninguno"      >   Ninguno   </option>
                                    <option value="Opcional"     >   Opcional  </option>
                                    <option value="Obligatorio"  >   Obligatorio </option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label style="padding-bottom: .5em;">Pre Requisito:</label>
                                <input type="text" name="txtPreRequisito" value="" class="form-control" />
                            </div>

                            <input type="submit" name="Guardar" value="Guardar" class="btn btn-success" style="margin-top: 35px" />                                                                                                          
                            <a href="/SistemaInformesUPTWeb-V2/ModificarCursoServlet" class="btn btn-info" style="margin-top: 35px" >Volver</a>

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

