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

<%@include file="../../header2.jsp" %>

<%@ page import = "java.util.Map" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String codDocente = String.valueOf(session.getAttribute("codDocente"));
    String nivelUsuario = String.valueOf(session.getAttribute("nivelUsuario"));    
    String idCurso = request.getParameter("idCurso");
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
                
                <form method="POST" action="/SistemaInformesUPTWeb-V2/ModificarCursoServlet" class="form-reporte form-consulta shadow" >
                    <fieldset>
                        <div class="form-group">
                            <h2>Mantenimiento de Cursos</h2>
                        </div>
                        
                        <div class="form-group">
                            <% 
                                ClsNegocioCurso datos = new ClsNegocioCurso();

                                dato = datos.seleccionarCurso(idCurso);

                                Iterator iterator = dato.iterator();

                                while (iterator.hasNext()) {
                                    ClsEntidadCurso objenti = new ClsEntidadCurso();

                                    objenti = (ClsEntidadCurso) iterator.next();

                                    %>
                                    <div class="form-group">
                                        <label style="padding-bottom: .5em;">Id Curso:</label>
                                        <input type="text" name="txtIdCurso" value="<%= objenti.getIdCurso() %>" class="form-control" disabled/>
                                        <input type="hidden" name="txtIdCurso" value="<%= objenti.getIdCurso() %>" class="form-control" />
                                    </div>

                                    <div class="form-group">
                                        <label style="padding-bottom: .5em;">Nombre:</label>
                                        <input type="text" name="txtNombre" value="<%= objenti.getNombre() %>" class="form-control" />
                                    </div>

                                    <div class="form-group">
                                        <div class="row" >
                                            <div class=" col-lg-6" style="">
                                                <label style="padding-bottom: .5em;">H.Teoricas:</label>
                                                <input type="number" value="<%= objenti.getHorasTeoricas() %>" name="txtHTeoricas" min="0" max="5" step="1"  required="required" class="form-control">
                                            </div>

                                            <div class=" col-lg-6" style="">
                                                <label style="padding-bottom: .5em;">H. Practicas:</label>
                                                <input type="number" value="<%= objenti.getHorasPracticas() %>" name="txtHPracticas" min="0" max="5" step="1"  required="required" class="form-control">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <label style="padding-bottom: .5em;">Creditos:</label>
                                                <input type="number" value="<%= objenti.getCreditos() %>" name="txtCreditos" min="0" max="5" step="1"  required="required" class="form-control">
                                            </div>

                                            <div class="col-lg-6">
                                                <label style="padding-bottom: .5em;">Ciclo:</label>
                                                <%
                                                    String selected1 = objenti.getCiclo().equals("I") ? "selected":"";
                                                    String selected2 = objenti.getCiclo().equals("II") ? "selected":"";
                                                    String selected3 = objenti.getCiclo().equals("III") ? "selected":"";
                                                    String selected4 = objenti.getCiclo().equals("IV") ? "selected":"";
                                                    String selected5 = objenti.getCiclo().equals("V") ? "selected":"";
                                                    String selected6 = objenti.getCiclo().equals("VI") ? "selected":"";
                                                    String selected7 = objenti.getCiclo().equals("VII") ? "selected":"";
                                                    String selected8 = objenti.getCiclo().equals("VIII") ? "selected":"";
                                                    String selected9 = objenti.getCiclo().equals("IX") ? "selected":"";
                                                    String selected10 = objenti.getCiclo().equals("X") ? "selected":"";
                                                    
                                                %>
                                                <select name="txtCiclo" class="form-control">
                                                    <option value="I"       <%=selected1%> >   I   </option>
                                                    <option value="II"      <%=selected2%> >   II  </option>
                                                    <option value="III"     <%=selected3%> >   III </option>
                                                    <option value="IV"      <%=selected4%> >   IV  </option>
                                                    <option value="V"       <%=selected5%> >   V   </option>
                                                    <option value="VI"      <%=selected6%> >   VI  </option>
                                                    <option value="VII"     <%=selected7%> >   VII </option>
                                                    <option value="VIII"    <%=selected8%> >   VIII</option>
                                                    <option value="IX"      <%=selected9%> >   IX  </option>
                                                    <option value="X"       <%=selected10%> >   X   </option>
                                                </select>
                                            </div>

                                        </div>

                                    </div>


                                    <div class="form-group">
                                        <label style="padding-bottom: .5em;">Tipo Curso:</label>
                                        <%
                                                    String selectedNI = objenti.getTipoCurso().equals("Ninguno") ? "selected":"";
                                                    String selectedOP = objenti.getTipoCurso().equals("Opcional") ? "selected":"";
                                                    String selectedOB = objenti.getTipoCurso().equals("Obligatorio") ? "selected":"";
                                                    
                                                %>
                                        <select name="txtTipoCurso" class="form-control">
                                            <option value="Ninguno"       <%=selectedNI%>  >   Ninguno   </option>
                                            <option value="Opcional"      <%=selectedOP%>  >   Opcional  </option>
                                            <option value="Obligatorio"   <%=selectedOB%>  >   Obligatorio </option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label style="padding-bottom: .5em;">Pre Requisito:</label>
                                        <input type="text" name="txtPreRequisito" value="<%= objenti.getPreRequisito() %>" class="form-control" />
                                    </div>

                                    <input type="submit" name="Modificar" value="Modificar" class="btn btn-success" style="margin-top: 35px" />                                                                                                          
                                    <a href="/SistemaInformesUPTWeb-V2/ModificarCursoServlet" class="btn btn-info" style="margin-top: 35px" >Volver</a>
                                    
                                    <%
                                }
                                datos.conexion.close();                                          
                            %>
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
