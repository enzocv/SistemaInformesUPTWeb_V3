<%-- 
    Document   : imprimirReporteCiclos
    Created on : 08-dic-2016, 20:26:26
    Author     : enzocv
--%>
<%@include file="header.jsp" %>

<%
    if (request.getParameter("imprimir")!= null) {
        if (request.getParameter("tipoReporte").equals("Entrada")) {
            response.sendRedirect("reportesPorCiclo/entradaPorCiclo.jsp");
        }
        else if (request.getParameter("tipoReporte").equals("Final")) {
            response.sendRedirect("reportesPorCiclo/finalPorCiclo.jsp");
        }
        else if (request.getParameter("tipoReporte").equals("Portafolio")) {
            response.sendRedirect("reportesPorCiclo/portafolioPorCiclo.jsp");
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Imprimir Reportes</title>
</head>
<body class="background-gray">
        <div class="container body-padding">
            <div class="row">
                <form class="form-reporte shadow">
                    <fieldset>
                        <div class="form-group">
                            <h2>Imprimir Reportes</h2>
                        </div>
                        <div class="form-group">
                            <label for="select" class="control-label" style="padding: 0 0 20px 0;" >Tipo de reporte</label>
                            <div class="">
                              <select class="form-control" id="select" name="tipoReporte" >
                                <option value="Entrada">Informe Prueba de Entrada</option>
                                <option value="Final">Informe Final</option>
                                <option value="Portafolio">Informe de Portafolio</option>
                              </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="imprimir" value="imprimir" class="btn btn-success" />
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>        
    </body>
</html>
