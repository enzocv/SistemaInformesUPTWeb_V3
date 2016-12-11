<%-- 
    Document   : reportesFaltantes
    Created on : 14-nov-2016, 20:52:58
    Author     : Drei
--%>
<%@page import="Entidad.ClsEntidadPruebaCursosFaltantes"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Negocio.ClsNegocioPruebaEntrada"%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String codDocente;
    ArrayList<ClsNegocioPruebaEntrada> dato = null;
    String nivelUsuario = String.valueOf(session.getAttribute("nivelUsuario"));    

    String nombreUnidad = "";
%>
<head>
    <title>Reportes Faltantes</title>
</head>
<body class="background-gray">
        <div class="container body-padding">
            <div class="row">
                <form class="form-reporte shadow">
                    <fieldset>
                        <div class="form-group">
                            <h2>Informes Final del Curso</h2>
                        </div>
                        <div class="form-group">
                            <label for="select" class="control-label">Tipo de reporte</label>
                            <div class="">
                              <select class="form-control" id="select" name="tipoReporte">
                                <option value="Prueba Entrada">Informe Prueba de Entrada</option>
                                <option value="Informe Final Curso">Informe Prueba Final</option>
                                <option value="Portafolio">Informe de Portafolio</option>
                              </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <input class="btn btn-success" type="submit" name="Listar" value="Listar Tabla">
                        </div>
                        <div class="form-group">
                            <div class="table-responsive">
                                <table class="table table-striped table-prueba-entrada" border="1">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre del curso</th>
                                            <th>Nombre del docente</th>
                                            <%
                                                String busqueda = request.getParameter("tipoReporte");
                                                if (request.getParameter("Listar")!=null) {
                                                    if(busqueda.equals("Portafolio")){
                                                    %>            
                                                    <th>Unidad por hacer</th>
                                                    <%
                                                    }
                                                }
                                            %>
                                            <th>Controles</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            if (request.getParameter("Listar")!=null) {
                                                codDocente = String.valueOf(session.getAttribute("codDocente"));
                                                ClsNegocioPruebaEntrada datos = new ClsNegocioPruebaEntrada();
                                                busqueda = request.getParameter("tipoReporte");
                                                dato = datos.hacerInformePruebaFaltante(codDocente,busqueda);//ArrayList

                                                Iterator iterator = dato.iterator();

                                                while (iterator.hasNext()) {
                                                    ClsEntidadPruebaCursosFaltantes objenti = new ClsEntidadPruebaCursosFaltantes();
                                                    objenti = (ClsEntidadPruebaCursosFaltantes) iterator.next();
                                                    
                                                    if(busqueda.equals("Portafolio")){
                                                        if(objenti.getIdUnidad() < Integer.parseInt(objenti.getCuentaCarga())){                                                        
                                                    %>
                                                        <tr>
                                                            <td><%=objenti.getIdCurso()%></td>
                                                            <td><%=objenti.getNombreCurso()%></td>
                                                            <td><%=objenti.getNombreDocente()%></td>
                                                            <%
                                                                if(busqueda.equals("Portafolio")){
                                                                    switch(objenti.getIdUnidad()){
                                                                        case 0:
                                                                            nombreUnidad = "Unidad I";
                                                                            break;
                                                                        case 1:
                                                                            nombreUnidad = "Unidad II";
                                                                            break;
                                                                        case 2:
                                                                            nombreUnidad = "Unidad III";
                                                                            break;
                                                                    }
                                                                %>            
                                                                    <td><%=nombreUnidad%></td>
                                                                <%
                                                            }
                                                            %>
                                                            <td>
                                                                <%
                                                                    if(busqueda.equals("Prueba Entrada")){
                                                                    %>
                                                                        <a href="pruebaEntrada.jsp?id_Curso=<%=objenti.getIdCurso()%>" class="btn btn-info btn-xs btn-controles">Hacer informe</a>                                      
                                                                    <%
                                                                }
                                                                %>
                                                                <%
                                                                    if(busqueda.equals("Informe Final Curso")){
                                                                    %>            
                                                                    <a href="TraerDatosInfo?id_Curso=<%=objenti.getIdCurso()%>" class="btn btn-info btn-xs btn-controles">Hacer informe</a>                                      
                                                                    <%
                                                                }
                                                                %>
                                                                <%
                                                                    if(busqueda.equals("Portafolio")){
                                                                    %>            
                                                                    <a href="TraerDatosCabeceraPortafolio?busqueda=Portafolio&idUnidad=<%=objenti.getIdUnidad()%>" class="btn btn-info btn-xs btn-controles">Hacer informe</a>                                      
                                                                    <%
                                                                }
                                                                %>

                                                            </td>

                                                        </tr>
                                                        <%
                                                        }
                                                    }else{
                                                        %>
                                                        <tr>
                                                            <td><%=objenti.getIdCurso()%></td>
                                                            <td><%=objenti.getNombreCurso()%></td>
                                                            <td><%=objenti.getNombreDocente()%></td>
                                                            <td>
                                                                <%
                                                                    if(busqueda.equals("Prueba Entrada")){
                                                                    %>
                                                                        <a href="pruebaEntrada.jsp?id_Curso=<%=objenti.getIdCurso()%>" class="btn btn-info btn-xs btn-controles">Hacer informe</a>                                      
                                                                    <%
                                                                }
                                                                %>
                                                                <%
                                                                    if(busqueda.equals("Informe Final Curso")){
                                                                    %>            
                                                                    <a href="TraerDatosInfo?id_Curso=<%=objenti.getIdCurso()%>" class="btn btn-info btn-xs btn-controles">Hacer informe</a>                                      
                                                                    <%
                                                                }
                                                                %>
                                                                <%
                                                                    if(busqueda.equals("Portafolio")){
                                                                    %>            
                                                                    <a href="TraerDatosCabeceraPortafolio?busqueda=Portafolio&idUnidad=<%=objenti.getIdUnidad()%>" class="btn btn-info btn-xs btn-controles">Hacer informe</a>                                      
                                                                    <%
                                                                }
                                                                %>

                                                            </td>

                                                        </tr>
                                                        <%
                                                    }                                                  
                                                }
                                                datos.conexion.close();
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>        
    </body>
</html>

