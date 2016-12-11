<%-- 
    Document   : reportesFaltantes
    Created on : 14-nov-2016, 20:52:58
    Author     : Drei
--%>
<%@page import="Negocio.ClsNegocioPortafolio"%>
<%@page import="Negocio.ClsNegocioInformeFinalCurso"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entidad.ClsEntidadPruebaCursosFaltantes"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Negocio.ClsNegocioPruebaEntrada"%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String codDocente = String.valueOf(session.getAttribute("codDocente"));
    String nivelUsuario = String.valueOf(session.getAttribute("nivelUsuario"));    
    
    ResultSet rs = null;
    
    ClsNegocioPruebaEntrada negPruebaEntrada = new ClsNegocioPruebaEntrada();
        
    String selected = "";
    
    String mensaje = "";
    
    String informe = "";
    if(request.getParameter("Informe")!=null){
        informe = request.getParameter("Informe");
    }
%>
<head>
    <title>Consulta Informe Prueba Entrada</title>
</head>
<body class="background-gray">
        <div class="container body-padding">
            <div class="row">
                <form class="form-reporte form-consulta shadow">
                    <fieldset>
                        <div class="form-group">
                            <h2>Consulta de Informes</h2>
                        </div>
                        <div class="form-group">
                            <label for="select" class="control-label">Tipo Informe</label>
                            <div class="">
                              <select class="form-control" id="select" name="Informe">
                                  <option value="Entrada" <%=selected=(informe.equals("Entrada")) ? "selected" : "" %>>Prueba de Entrada</option>
                                  <option value="Final" <%=selected=(informe.equals("Final")) ? "selected" : "" %>>Informe Final del Curso</option>
                                  <option value="Portafolio" <%=selected=(informe.equals("Portafolio")) ? "selected" : "" %>>Portafolio</option>
                              </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="select" class="control-label">Criterio</label>
                            <div class="">
                              <select class="form-control" id="select" name="criterio">
                                  <%
                                    if (nivelUsuario.equals("Usuario")) {
                                        %>
                                        <option value="Todos">Todos</option>
                                        <option value="Código Curso">Código Curso</option>
                                        <option value="Nombre Curso">Nombre Curso</option>
                                        <option value="Fecha">Fecha</option>
                                        <option value="Estado">Estado</option>
                                        
                                        <% 
                                        if (request.getParameter("Buscar")!=null) {
                                            String tipoInfo = request.getParameter("Informe");
                                            if (tipoInfo.equals("Portafolio")) {
                                                %>
                                                <option value="Unidad">Unidad</option>
                                                <%
                                            }                                                        
                                        }
                                    }
                                    else if(nivelUsuario.equals("Supervisor") || nivelUsuario.equals("Administrador")){
                                        %>
                                        <option value="Todos">Todos</option>
                                        <option value="Código Docente">Código Docente</option>
                                        <option value="Nombre Docente">Nombre Docente</option>
                                        <option value="Semestre">Semestre</option>
                                        <option value="Código Curso">Código Curso</option>
                                        <option value="Nombre Curso">Nombre Curso</option>
                                        <option value="Fecha">Fecha</option>
                                        <option value="Estado">Estado</option>
                                        <% 
                                            if (request.getParameter("Buscar")!=null) {
                                                String tipoInfo = request.getParameter("Informe");
                                                if (tipoInfo.equals("Portafolio")) {
                                                    %>
                                                    <option value="Unidad">Unidad</option>
                                                    <%
                                                }                                                        
                                            }
                                    }
                                  %>
                              </select>
                            </div>
                        </div>
                              
                        <div class="form-group">
                            <label for="busqueda" class="control-label">Búsqueda</label>
                            <div class="">                              
                                <input name="busqueda" type="text" class="form-control" id="busqueda" placeholder="Búsqueda">
                            </div>
                        </div>
                              
                        <div class="form-group">
                            <input class="btn btn-success" type="submit" name="Buscar" value="Buscar">
                        </div>
                              
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-striped table-prueba-entrada" border="1">
                                    <thead>
                                        <tr>
                                            <%
                                                if (nivelUsuario.equals("Usuario")) {
                                                    %>
                                                    <th>ID</th>
                                                    <th>Cod Curso</th>
                                                    <th>Curso</th>
                                                    <th>Fecha</th>
                                                    <th>Estado</th>
                                                                                                       
                                                    <% 
                                                    if (request.getParameter("Buscar")!=null) {
                                                        String tipoInfo = request.getParameter("Informe");
                                                        if (tipoInfo.equals("Portafolio")) {
                                                            %>
                                                            <th>Unidad</th>
                                                            <%
                                                        }                                                        
                                                    }
                                                }
                                                else if(nivelUsuario.equals("Supervisor") || nivelUsuario.equals("Administrador")){
                                                    %>
                                                    <th>ID</th>
                                                    <th>Cod Doc</th>
                                                    <th>Nombre Docente</th>
                                                    <th>Semestre</th>
                                                    <th>Cod Curso</th>
                                                    <th>Curso</th>
                                                    <th>Fecha</th>
                                                    <th>Estado</th>
                                                    
                                                    <%
                                                        if (request.getParameter("Buscar")!=null) {
                                                        String tipoInfo = request.getParameter("Informe");
                                                        if (tipoInfo.equals("Portafolio")) {
                                                            %>
                                                            <th>Unidad</th>
                                                            <%
                                                        }                                                        
                                                    }
                                                }
                                            %>
                                                    <th>Control</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            ClsNegocioInformeFinalCurso negoInfo = new ClsNegocioInformeFinalCurso();
                                            ClsNegocioPortafolio negoPorta = new ClsNegocioPortafolio();
                                            if (request.getParameter("Buscar")!=null) {
                                                String criterio = request.getParameter("criterio");
                                                String busqueda = request.getParameter("busqueda");
                                                if (nivelUsuario.equals("Usuario")) {
                                                    String tipoInfo = request.getParameter("Informe");
                                                    if (tipoInfo.equals("Final")) {
                                                        
                                                        rs = negoInfo.ConsultaAvanzaInfoFinalUsuario(criterio, busqueda, codDocente);
                                                    }
                                                    else if(tipoInfo.equals("Entrada")){
                                                        rs  =negPruebaEntrada.ConsultaAvanzaPruebaEntradaUsuario(criterio, busqueda,codDocente);
                                                    }
                                                    else if(tipoInfo.equals("Portafolio")){
                                                        rs  =negoPorta.ConsultaAvanzaPortafolioUsuario(criterio, busqueda,codDocente);
                                                    }

                                                    boolean encuentra = false;
                                                    
                                                    while (rs.next()) {
                                                        %>
                                                        <tr>
                                                            <td> <%= rs.getString(1)%> </td>
                                                            <td> <%= rs.getString(2)%> </td>
                                                            <td> <%= rs.getString(3)%> </td>
                                                            <td> <%= rs.getString(4)%> </td>
                                                            <td> <%= rs.getString(5)%> </td>
                                                            
                                                            <%if(tipoInfo.equals("Entrada")){%>
                                                                <td> <a href="pruebaEntrada.jsp?id_PruebaEntrada=<%= rs.getString(1)%>" class="btn btn-success btn-xs btn-controles">Ver Informe E</a></td>
                                                            <% } 
                                                            else if(tipoInfo.equals("Final")) {%>
                                                                <td> <a href="BucarInfoFinal?id_Final=<%= rs.getString(1)%>" class="btn btn-success btn-xs btn-controles">Ver Informe F</a></td>
                                                            <% } 
                                                            else if(tipoInfo.equals("Portafolio")) {%>
                                                                <td> <%= rs.getString(6)%> </td>
                                                                <td> <a href="TraerDatosCompletosPortafolio?id_Portafolio=<%= rs.getString(1)%>" class="btn btn-success btn-xs btn-controles">Ver Informe P</a></td>
                                                            <% } %>
                                                            
                                                        </tr>
                                                        <%
                                                        
                                                        encuentra = true;
                                                    }

                                                    if (encuentra == false) {
                                                        mensaje = "No se encuentra.";
                                                    }
                                                    
                                                    rs.close();
                                                    if (tipoInfo.equals("Entrada")) {
                                                        negPruebaEntrada.conexion.close();
                                                            
                                                    }
                                                    else if(tipoInfo.equals("Final")){
                                                        negoInfo.conexion.close();
                                                    }
                                                    else if(tipoInfo.equals("Portafolio")){
                                                        negoInfo.conexion.close();
                                                    }
                                                    
                                                }
                                                else if(nivelUsuario.equals("Supervisor") || nivelUsuario.equals("Administrador")){
                                                    
                                                    String tipoInfo = request.getParameter("Informe");
                                                    if (tipoInfo.equals("Final")) {
                                                        rs = negoInfo.ConsultaAvanzaInformeFinal(criterio, busqueda);
                                                    }
                                                    else if(tipoInfo.equals("Entrada")){
                                                        rs  =negPruebaEntrada.ConsultaAvanzaPruebaEntrada(criterio, busqueda);
                                                    }
                                                    else if(tipoInfo.equals("Portafolio")){
                                                        rs  =negoPorta.ConsultaAvanzaPortafolioAdministrador(criterio, busqueda);
                                                    }

                                                    

                                                    boolean encuentra = false;
                                                    
                                                    while (rs.next()) {
                                                        %>
                                                        <tr>
                                                            <td> <%= rs.getString(1)%> </td>
                                                            <td> <%= rs.getString(2)%> </td>
                                                            <td> <%= rs.getString(3)%> </td>
                                                            <td> <%= rs.getString(4)%> </td>
                                                            <td> <%= rs.getString(5)%> </td>
                                                            <td> <%= rs.getString(6)%> </td>
                                                            <td> <%= rs.getString(7)%> </td>
                                                            <td> <%= rs.getString(8)%> </td>
                                                            <td> <%= rs.getString(9)%> </td>
                                                            <%if(tipoInfo.equals("Entrada")){%>
                                                                <td> <a href="pruebaEntrada.jsp?id_PruebaEntrada=<%= rs.getString(1)%>" class="btn btn-success btn-xs btn-controles">Ver Informe E</a></td>
                                                            <% } 
                                                            else if(tipoInfo.equals("Final")) {%>
                                                                <td> <a href="BucarInfoFinal?id_Final=<%= rs.getString(1)%>" class="btn btn-success btn-xs btn-controles">Ver Informe F</a></td>
                                                            <% } 
                                                            else if(tipoInfo.equals("Portafolio")) {%>
                                                                <td> <a href="TraerDatosCompletosPortafolio?id_Portafolio=<%= rs.getString(1)%>" class="btn btn-success btn-xs btn-controles">Ver Informe P</a></td>
                                                            <% } %>
                                                        </tr>
                                                        <%
                                                        encuentra = true;
                                                    }

                                                    if (encuentra == false) {
                                                        mensaje = "No se encuentra.";
                                                    }
                                                }
                                            }
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
    </body>
</html>

