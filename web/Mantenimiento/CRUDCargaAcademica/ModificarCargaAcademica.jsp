<%-- 
    Document   : ModificarCargaAcademica
    Created on : 02-feb-2017, 0:17:59
    Author     : Asus
--%>

<%@page import="Entidad.ClsEntidadCargaAcedemica"%>
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
    
    ClsEntidadCargaAcedemica entiC = new ClsNegocioCargaAcademica().MostrarDatosCargaAcademica(
                                                                        request.getParameter("id"));
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
                
                <form method="POST" action="/SistemaInformesUPTWeb-V2/modificaCargaAcedemica" class="form-reporte form-consulta shadow" >
                    <fieldset>
                        <div class="form-group">
                            <h2>Mantenimiento de Carga Academica</h2>
                            <input type="hidden" name="idCargaAcademica" value="<%=entiC.getIdCargaAcademica() %>" />
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
                                                if (entiC.getIdPlanEstudio() == objenti.getIdPlanEstudio()) {
                                                
                                        %>
                                        <option value="<%=objenti.getIdPlanEstudio()%>" selected > <%=objenti.getNombrePlanEstudio()%> </option>
                                        
                                        <%      }
                                                else{ %>
                                        <option value="<%=objenti.getIdPlanEstudio()%>" > <%=objenti.getNombrePlanEstudio()%> </option>
                                        <%        }
                                           }
                                        %>
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
                                                if (entiC.getIdSemestre() == Integer.parseInt(objentiSE.getIdSemestre())) {

                                        %>
                                        <option value="<%=objentiSE.getIdSemestre()%>" selected > <%=objentiSE.getNombreSemestre() %> </option>
                                                
                                        <%      }
                                                else{ %>

                                        <option value="<%=objentiSE.getIdSemestre()%>" > <%=objentiSE.getNombreSemestre() %> </option>
                                        <%        }
                                           }
                                        %>
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
                                                if (entiC.getIdCurso().equals(objentiCU.getIdCurso())) {
                                                
                                        %>
                                        <option value="<%=objentiCU.getIdCurso()%>" selected > <%=objentiCU.getNombre()%> </option>
                                        <%      } 
                                                else{%>
                                        <option value="<%=objentiCU.getIdCurso()%>"  > <%=objentiCU.getNombre()%> </option>

                                        <%        }
                                           }
                                        %>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Matriculados :</label>
                                    <input type="text" value="<%=entiC.getAlumnosMatriculados() %>" name="txtMatriculados" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Retirados :</label>
                                    <input type="text" value="<%=entiC.getAlumnosRetirados()%>" name="txtRetirados" class="form-control" />
                                </div>
                                <div class="col-lg-4">
                                    <label style="padding-bottom: .5em;">Abandono :</label>
                                    <input type="text" value="<%=entiC.getAlumnosAbandono()%>" name="txtAbandono" class="form-control" />
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
                                                
                                                if (entiC.getCodDocente().equals(objentiDO.getCodDocente())) {
                                                

                                        %>
                                        <option value="<%=objentiDO.getCodDocente()%>" selected  > <%=objentiDO.getNombreDocente()%> </option>
                                        <%      }
                                                else{%>
                                        <option value="<%=objentiDO.getCodDocente()%>" > <%=objentiDO.getNombreDocente()%> </option>

                                        <%        }
                                           }
                                        %>
                                    </select>
                                </div>
                                <div class="col-lg-5">
                                    <label style="padding-bottom: .5em;">Sección :</label>
                                    <select name="idSeccion" class="form-control">
                                        <%
                                            String selected5 = "";
                                            String selected6 = "";
                                            String selected7 = "";
                                            
                                            if (entiC.getSeccion().equals("A")) {
                                                 selected5 = "selected";   
                                            }
                                            else if (entiC.getSeccion().equals("B")) {
                                                 selected6 = "selected";   
                                            }
                                            else{
                                                 selected7 = "selected";
                                            }
                                        %>
                                        <option value="A" <%=selected5 %> > A </option>
                                        <option value="B" <%=selected6 %> > B </option>
                                        <option value="C" <%=selected7 %> > C </option>
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


