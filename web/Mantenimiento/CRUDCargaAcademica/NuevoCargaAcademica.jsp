<%-- 
    Document   : NuevoCargaAcademica
    Created on : 02-feb-2017, 0:18:10
    Author     : Asus
--%>


<%@page import="Entidad.ClsEntidadDocente"%>
<%@page import="Entidad.ClsEntidadCurso"%>
<%@page import="Negocio.ClsNegocioCurso"%>
<%@page import="Entidad.ClsEntidadSemestre"%>
<%@page import="Negocio.ClsNegocioSemestre"%>
<%@page import="Entidad.ClsEntidadPlanEstudio"%>
<%@page import="Negocio.ClsNegocioPlanEstudio"%>
<%@page import="Negocio.ClsNegocioCargaAcademica"%>
<%@page import="Negocio.ClsNegocioDocente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@include file="../../header2.jsp" %>

<%@ page import = "java.util.Map" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ClsNegocioCargaAcademica negoDocente = new ClsNegocioCargaAcademica();
//    String codigoDoc = negoDocente.ObtenerCodigo();
//    negoDocente.conexion.close();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Carga Academica | Sistema de Informes UPT</title>
        
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
                
                <form method="POST" action="/SistemaInformesUPTWeb-V2/nuevoCargaAcedemica" class="form-reporte form-consulta shadow" >
                    <fieldset>
                        <div class="form-group">
                            <h2>Mantenimiento de Carga Academica</h2>
                        </div>
                        
                        <div class="form-group">
                            
                            <div class="row">
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Plan de Estudio :</label>
                                    <select name="idPlanEstudio" class="form-control">
                                        <%
                                            ArrayList<ClsNegocioPlanEstudio> datoPE = null;
                                            ClsNegocioPlanEstudio datos = new ClsNegocioPlanEstudio();
                                            datoPE = datos.MostrarPlanEstudios();

                                            Iterator iterator = datoPE.iterator();

                                            while (iterator.hasNext()) {
                                                ClsEntidadPlanEstudio objenti = new ClsEntidadPlanEstudio();

                                                objenti = (ClsEntidadPlanEstudio) iterator.next();

                                        %>
                                        <option value="<%=objenti.getIdPlanEstudio()%>"> <%=objenti.getNombrePlanEstudio()  %> </option>
                                        <% } %>
                                    </select>
                                </div>
                                    
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Semestre :</label>
                                    <select name="idSemestre" class="form-control">
                                        <%
                                            ArrayList<ClsNegocioSemestre> datoSE = null;
                                            ClsNegocioSemestre datosSE = new ClsNegocioSemestre();
                                            datoSE = datosSE.MostrarSemestres();

                                            Iterator iteratorSE = datoSE.iterator();

                                            while (iteratorSE.hasNext()) {
                                                ClsEntidadSemestre objentiSE = new ClsEntidadSemestre();

                                                objentiSE = (ClsEntidadSemestre) iteratorSE.next();

                                        %>
                                        <option value="<%=objentiSE.getIdSemestre()%>"> <%=objentiSE.getNombreSemestre()%> </option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Curso :</label>
                                    <select name="idCurso" class="form-control">
                                        <%
                                            ArrayList<ClsNegocioCurso> datoCU = null;
                                            ClsNegocioCurso datosCU = new ClsNegocioCurso();
                                            datoCU = datosCU.seleccionarTodasLosCursos();

                                            Iterator iteratorCU = datoCU.iterator();

                                            while (iteratorCU.hasNext()) {
                                                ClsEntidadCurso objentiCU = new ClsEntidadCurso();

                                                objentiCU = (ClsEntidadCurso) iteratorCU.next();

                                        %>
                                        <option value="<%=objentiCU.getIdCurso()%>"> <%=objentiCU.getNombre()%> </option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Matriculados :</label>
                                    <input type="text" name="txtMatriculados" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Retirados :</label>
                                    <input type="text" name="txtRetirados" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Abandono :</label>
                                    <input type="text" name="txtAbandono" class="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5">
                                    <label style="padding-bottom: .5em;">Docente :</label>
                                    <select name="idDocente" class="form-control">
                                        <%
                                            ArrayList<ClsNegocioDocente> datoDO = null;
                                            ClsNegocioDocente datosDo = new ClsNegocioDocente();
                                            datoDO = datosDo.MostrarDocentes();

                                            Iterator iteratorDO = datoDO.iterator();

                                            while (iteratorDO.hasNext()) {
                                                ClsEntidadDocente objentiDO = new ClsEntidadDocente();

                                                objentiDO = (ClsEntidadDocente) iteratorDO.next();

                                        %>
                                        <option value="<%=objentiDO.getCodDocente()%>"> <%=objentiDO.getNombreDocente()%> </option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-lg-5">
                                    <label style="padding-bottom: .5em;">Sección :</label>
                                    <select name="idSeccion" class="form-control">
                                        <option value="A"> A </option>
                                        <option value="B"> B </option>
                                        <option value="C"> C </option>
                                    </select>
                                </div>
                            </div>

                            <input type="submit" name="Guardar" value="Guardar" class="btn btn-success" style="margin-top: 35px" />                                                                                                          
                            <a href="/SistemaInformesUPTWeb-V2/Mantenimiento/MantenimientoCargaAcademica.jsp" class="btn btn-info" style="margin-top: 35px" >Volver</a>

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


