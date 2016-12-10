<%-- 
    Document   : Unidad
    Created on : 07-dic-2016, 21:01:19
    Author     : enzocv
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Negocio.ClsNegocioUnidad"%>
<%@page import="Entidad.ClsEntidadUnidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>


<%
    String id_usu="";
    ClsEntidadUnidad u = new ClsEntidadUnidad();
    
    ArrayList<ClsEntidadUnidad> unidadDatos;
    unidadDatos = new ClsNegocioUnidad().seleccionarTodasLasUnidad();
    
    String seleccionDoc = "";
%>

<head>
    <title>Gestión de Unidad</title>
</head>
<body class="">
        <div class="container body-padding">
            <div class="row">
                <div class="shadow" style="background:#FFF;padding: 0 14px;">
                    <div class="form-group" style="">
                        <h2 style="padding: 20px 0;" >Gestión de Unidad</h2>
                    </div>
                    <div class="form-group">
                        <a href="agregarUnidad.jsp" class="btn-link"> Agregar Nueva Unidad</a>
                    </div>
                    <div class="form-group table-responsive">
                        <table class="table table-striped table-responsive table-prueba-entrada" id="tab_logic">
                            <thead>
                                <th class="col-md-1">Nro</th>
                                <th class="col-md-4">Descripción</th>
                                <th class="col-md-1">Estado</th>
                                <th class="col-md-1">Control</th>
                            </thead>
                            <tbody>
                                <% int i = 0; %>
                                <% for (ClsEntidadUnidad uni : unidadDatos){ %>
                                <tr>
                                    <form action="cambiarEstadoUnidad" method="POST">
                                        <td> <input value="<%=uni.getIdUnidad() %>"         name="idUnidad"  type="text" class="form-control" disabled/> </td>
                                    <td> <input value="<%=uni.getDescripcionUnidad()%>" name="descripcionUnidad" type="text" class="form-control"/> </td>
                                    <td>
                                        <%
                                            String activo = "";
                                            String inactivo = "";
                                            String desactivo = "";
                                            if (uni.getEstadoUnidad().equals("Activo")) {
                                                activo = "selected";
                                            }
                                            else if(uni.getEstadoUnidad().equals("Inactivo")){
                                                inactivo = "selected";
                                            }
                                            else{
                                                desactivo = "selected";
                                            }
                                        %>
                                            <select name="estadoUnidad" class="form-control " onchange="this.form.submit()" >
                                                <option value="Activo"      <%=activo%>    id="estado"> Activo      </option>
                                                <option value="Inactivo"    <%=inactivo%>  id="estado"> Inactivo    </option>
                                                <option value="Desactivado" <%=desactivo%> id="estado"> Desactivado </option>
                                            </select>
                                            <input value="<%=uni.getIdUnidad() %>"            name="idUnidad"           type="hidden" />
                                            <input value=""   name="descripcionUnidadH"  type="hidden" />
                                    </td>
                                    <td>
                                        <a href="eliminarUnidad.jsp?idUnidad=<%=uni.getIdUnidad() %>" class="btn btn-danger form-control" onclick="return confirm('¿Está seguro que desea eliminar este registro?')"  >
                                            Eliminar
                                        </a>
                                    </td>
                                    </form>
                                </tr>
                                <% i++; } %>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
                
            </div>
        </div>   
        <script>
             $("#estado").click(function(){
                texto =  $("input[name=descripcionUnidad]").val();
                $("input[name=descripcionUnidadH]").val(texto);
                console.log(texto);
            });
        </script>
                                    
    </body>
</html>

