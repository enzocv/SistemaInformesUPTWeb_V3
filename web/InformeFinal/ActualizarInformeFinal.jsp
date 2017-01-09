<%-- 
    Document   : reportesFaltantes
    Created on : 14-nov-2016, 20:52:58
    Author     : Drei
--%>

<%@page import="Entidad.ClsEntidadCacidadInformeFinalCurso"%>
<%@page import="Negocio.ClsNegocioUsuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Negocio.ClsNegocioDetallePruebaEntrada"%>
<%@page import="Entidad.ClsEntidadPruebaEntrada"%>
<%@page import="Entidad.ClsEntidadDetallePruebaEntrada"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Entidad.ClsEntidadPruebaCursosFaltantes"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Negocio.ClsNegocioPruebaEntrada"%>

<%@include file="../header.jsp" %>

<%@ page import = "java.util.Map" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%   
    
    // CARGAR DATOS CABECERA
    
    String codDocente = String.valueOf(session.getAttribute("codDocente"));
    String nivelUsuario = String.valueOf(session.getAttribute("nivelUsuario"));   
    String busqueda = "Prueba Entrada";
    String idInfoFinal = request.getParameter("id_Final");
    
//    String datos[] = (String[]) request.getAttribute("campo");
    String datos2[] = (String[]) request.getAttribute("campo2");
    String datos3[] = (String[]) request.getAttribute("campo3");
    String datos4[] = (String[]) request.getAttribute("campo4");
    
    int cnt = 0;

    
%>

<%
    String mate = "";
    String cues = "";
    String tare = "";
    String foro = "";
    String exam = "";
    String pptx = "";
    if(datos4 != null && !datos4[3].equals("")){
        String uso = datos4[3];
        String aula[] = uso.split(",");

        mate = aula[0].equals("Material del Curso") ? "checked":"";
        cues = aula[2].equals("Cuestionarios") ? "checked":"";
        tare = aula[4].equals("Tareas Encargadas") ? "checked":"";
        foro = aula[1].equals("Foros") ? "checked":"";
        exam = aula[3].equals("Examenes Virtuales") ? "checked":"";
        pptx = aula[5].equals("Presentaciones") ? "checked":"";
    }
%>

<head>
    <title>Informe Prueba Entrada</title>
</head>
<body class="background-gray">
        <div class="container body-padding">
            <div class="row">
                <div class="form-reporte shadow">
                    <% if(datos2 != null && datos3 != null && datos4 != null) {%>
                    <form class="" method="post" action="/SistemaInformesUPTWeb-V2/ActualizarInfoFinal">
                        <fieldset>

                            <div class="form-group">

                                <div class="sub-title">  
                                    <h2>Informe Final del Curso</h2>
                                    <h4>Semestre</h4>
                                    <br>
                                    <h4>Datos del curso :</h4>
                                </div>

                                <div class="row">

                                    <label class="col-lg-2 ">Nombre :</label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control input-sm" id="" value='<%=datos2[1]%>' disabled>
                                    </div>   

                                    <label class="col-lg-2 ">Código :</label>
                                    <div class="col-lg-3">
                                        <input type="text" class="form-control input-sm"  name="idCurso" id="" value='<%=datos2[0]%>' disabled>
                                    </div>


                                </div>
                                
                                <% String teo = ""; String prac = ""; String lab = ""; String taller = "";
                                   teo = Integer.parseInt(datos2[2]) > 0 ? "checked":""; 
                                   prac = Integer.parseInt(datos2[3]) > 0 ? "checked":"";
                                   lab = datos2[12].equals("Si") ? "checked":"";
                                   taller = datos2[13].equals("Si") ? "checked":"";
                                %>
                                    
                                <div class="row">
                                    <label class="col-lg-2 ">Teórico :</label>
                                    <div class="col-lg-1">
                                        <input type="checkbox" min="0" class="" id="" name='' value='' <%=teo%> >
                                    </div>

                                    <label class="col-lg-2 ">Práctico :</label>
                                    <div class="col-lg-1">
                                        <input type="checkbox" min="0" class="" id="" value='' <%=prac%>>
                                    </div>
                                </div>

                                <div class="row">   
                                    <label class="col-lg-2 ">Laboratorio :</label>
                                    <div class="col-lg-1">
                                        <input type="checkbox" min="0" name="Lab" class="" id="" value='' <%=lab%>>
                                    </div>

                                    <label class="col-lg-2 ">Taller :</label>
                                    <div class="col-lg-1">
                                      <input type="checkbox" min="0" name="Taller" class="" id="" name='' value="" <%=taller%>>
                                    </div>                                
                                </div>

                                <div class="sub-title">                                
                                    <h4>Datos del docente :</h4>
                                </div>

                                <div class="row">                                
                                    <label class="col-lg-2 ">Nombre :</label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control input-sm" id="" value='<%=datos2[8]%>' disabled>
                                    </div>                      
                                </div>

                                <div class="row">

                                    <label class="col-lg-2 ">Email :</label>
                                    <div class="col-lg-4">
                                        <input type="email" min="0" class="form-control input-sm" id="" value='<%=datos2[10]%>' disabled>
                                    </div>

                                    <label class="col-lg-2 ">Celular :</label>
                                    <div class="col-lg-3">
                                        <input type="number" min="0" class="form-control input-sm" id="" value='<%=datos2[9]%>' disabled>
                                    </div>                                
                                </div>

                            </div>

                            <div class="form-group">   
                                <div class="row">
                                    <div class="col-lg-5">
                                        <h4>Resumen del curso</h4>
                                    </div>
                                    <div class="col-lg-1 text-center">
                                        <h4>Nº</h4>
                                    </div>
                                    <div class="col-lg-1 text-center">
                                        <h4>%</h4>
                                    </div>
                                </div>                            
                                <div class="row">                                
                                    <label class="col-lg-5 ">Porcentaje de cumplimiento del sílabo</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="porSilabo" class="form-control input-sm" id="" value='<%=datos2[14]%>'>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeSilabo" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Prácticas calificadas realizadas</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="caliRealizadas" class="form-control input-sm" id="" value='<%=datos2[15]%>'>
                                   </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajePCalificadas" class="form-control input-sm" id="" value='' disabled>
                                   </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Experiencias de laboratorio realizadas</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="laboRealizada" class="form-control input-sm" id="" value='<%=datos2[16]%>'>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeLabRealizadas" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Proyectos y/o trabajos de investigación realizados</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="proyeRealizado" class="form-control input-sm" id="" value='<%=datos2[17]%>'>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajePRealiados" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Estudiantes matriculados</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="estMatricu" class="form-control input-sm" id="" value='<%=datos2[4]%>' disabled>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeMatriculados" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Estudiantes retirados</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="estReti" class="form-control input-sm" id="" value='<%=datos2[5]%>' disabled>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeRetirados" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Estudiantes con abandono</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="estAbando" class="form-control input-sm" id="" value='<%=datos2[6]%>' disabled>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeAbandono" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Estudiantes que asisten</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="estAsiste" class="form-control input-sm" id="" value='<%=datos2[18]%>'>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeAsisten" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Estudiantes aprobados</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="estAprobado" class="form-control input-sm" id="" value='<%=datos2[19]%>'>                                       
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeAprobados" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Estudiantes desaprobados</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="estDesapro" class="form-control input-sm" id="" value='<%=datos2[20]%>'>
                                    </div>  
                                    <div class="col-lg-1">
                                        <input type="text" name="porcentajeDesaprobados" class="form-control input-sm" id="" value='' disabled>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Nota final más alta</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="notaMasAlta" class="form-control input-sm" id="" value='<%=datos2[21]%>'>                                        
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Nota final promedio</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="notaProm" class="form-control input-sm" id="" value='<%=datos2[22]%>'>
                                    </div>  
                                </div>
                                <div class="row">                                
                                    <label class="col-lg-5 ">Nota final más baja</label>
                                    <div class="col-lg-1">
                                        <input type="text" name="notaMasBaja" class="form-control input-sm" id="" value='<%=datos2[23]%>'>
                                    </div>   
                                </div>                            
                            </div>    

                            <div class="form-group">
                                <label><a id="calc_percentages" class="btn btn-primary">Calcular Porcentajes</a></label>
                                <div><p id='permessage' ></p></div>
                            </div>    

                            <div class="form-group">
                                <div class="sub-title">  
                                    <h4>Indicaciones :</h4>
                                    <p>Según su apreciación deberá maracar el nivel que han alcanzado los estudiantes 
                                        en los diferentes aspectos que se mencionan a continuación:</p>
                                </div>
                                <table class="table table-striped table-hover ">
                                    <thead>
                                        <tr>
                                            <th>N</th>
                                            <th>P</th>
                                            <th>A</th>
                                            <th>B</th>
                                            <th>M</th>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr class="">
                                           <th>Nada</th>
                                            <th>Poco</th>
                                            <th>Aceptable</th>
                                            <th>Bien</th>
                                            <th>Muy Bien</th>
                                        </tr>
                                    </thead>
                                </table>

                                <div class="sub-title">  
                                    <p>Logros de capacidades del curso:</p>                                
                                </div>
                                
                                <div class="form-group table-responsive">
                                    <table class="table table-striped table-responsive table-prueba-entrada" id="tab_logic">
                                        <thead>
                                            <th class="col-md-1">#</th>
                                            <th class="col-md-6">Capacidades del curso</th>
                                            <th class="col-md-1">N</th>
                                            <th class="col-md-1">P</th>
                                            <th class="col-md-1">A</th>
                                            <th class="col-md-1">B</th>
                                            <th class="col-md-1">M</th>
                                        </thead>
                                        <tbody>
                                            <% 
                                                for (int i = 0; i < datos3.length; i+=5) {%>
                                                <% String n = datos3[i+2].equals("1")  ? "x":"";
                                                   String p = datos3[i+2].equals("11") ? "x":"";
                                                   String a = datos3[i+2].equals("21") ? "x":"";
                                                   String b = datos3[i+2].equals("31") ? "x":"";
                                                   String m = datos3[i+2].equals("41") ? "x":"";
                                                %>
                                                <tr id='addr<%=cnt%>'>
                                                    <td><input name=""                                  value="<%=cnt+1%>" type="text" class="form-control"/></td>
                                                    <td><input name="detalledescripcionCapa<%=cnt%>"    value="<%=datos3[i+1]%>" type="text" class="form-control"/></td>
                                                    <td><input name="detallenadaCapa<%=cnt%>"           value="<%=n%>" type="text" class="form-control"/></td>
                                                    <td><input name="detallepocoCapa<%=cnt%>"           value="<%=p%>" type="text" class="form-control"/></td>
                                                    <td><input name="detalleaceptableCapa<%=cnt%>"      value="<%=a%>" type="text" class="form-control"/></td>
                                                    <td><input name="detallebienCapa<%=cnt%>"           value="<%=b%>" type="text" class="form-control"/></td>
                                                    <td><input name="detallemuyBienCapa<%=cnt%>"        value="<%=m%>" type="text" class="form-control"/></td>
                                                </tr>
                                            <%
                                                cnt++; }
                                            %>
                                                <tr id='addr<%=cnt%>'></tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <label><a id="add_row" class="btn btn-success">Agregar Fila</a></label>
                                <label><a id='delete_row' class="btn btn-danger ">Eliminar Fila</a></label>
                                <div><p id='permessage' ></p></div>
                            </div>  

                            <div class="form-group" id="medidas_logic">
                                <label>Cuál cree que ha sido el motivo por el cual los estudiantes no alcanzaron el logro de capacidades</label>
                                <%
                                    int conta = 0;
                                    for (int i = 0; i < datos3.length; i+=5) {
                                %>
                                    <div id="mc<%=conta%>">
                                        <p>Para Nº <%=conta+1%><p>
                                        <textarea name="medCorrectiva<%=conta%>" class="form-control"><%=datos3[i+4]%></textarea>
                                    </div>
                                <%
                                    conta++; }
                                %>
                                <div id="mc<%=conta%>"></div>
                            </div>   
                            
                            <div class="form-group">
                                <div class="sub-title">  
                                    <h4>Observaciones :</h4>                                    
                                </div>
                                <div class="observaciones">
                                    <label>1.De los estudiantes. Nivel académico, conocimientos previos, interés en el curso, estilos de aprendizaje.</label>
                                    <textarea name="obsDelEstudiante" class="form-control" rows="3"><%=datos4[0]%></textarea>
                                </div>
                                <div class="observaciones">
                                    <label>2.Asistencia y puntualidad de los estudiantes.</label>
                                    <textarea name="obsAsistencia" class="form-control" rows="3"><%=datos4[1]%></textarea>
                                </div>
                                <div class="observaciones">
                                    <label>3.Del sílabo. ¿Qué temas del sílabo no se han completado? ¿Considera todos los temas adecuados? ¿Qué temas requieren más tiempo de dedicación?</label>
                                    <textarea name="obsDelSilabo" class="form-control" rows="3"><%=datos4[2]%></textarea>
                                </div>
                                <div class="observaciones">
                                    <label>4. Uso del Aula Virtual. Información colocada, uso de foros, chat y cantidad de visitas estudiantiles.</label>
                                    <div class="row">
                                        <label class="col-lg-2 ">Material del curso :</label>
                                        <div class="col-lg-1">
                                            <input type="checkbox" <%=mate%> min="0" class="" id="" name='usoAulamaterialcurso' value='material' >
                                        </div>
                                        <label class="col-lg-2 ">Cuestionarios :</label>
                                        <div class="col-lg-1">
                                            <input type="checkbox" <%=cues%> min="0" class="" id="" name='usoAulacuestionarios' value='cuestionarios'>
                                        </div>
                                        <label class="col-lg-2 ">Tareas encargadas:</label>
                                        <div class="col-lg-1">
                                            <input type="checkbox" <%=tare%> min="0" class="" id="" name='usoAulatareasencargadas' value='tareas' >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-lg-2 ">Foros :</label>
                                        <div class="col-lg-1">
                                            <input type="checkbox" <%=foro%> min="0" class="" id="" name='usoAulaforos' value='foros' >
                                        </div>
                                        <label class="col-lg-2 ">Examenes virtuales :</label>
                                        <div class="col-lg-1">
                                            <input type="checkbox" <%=exam%> min="0" class="" id="" name='usoAulaexamenesvirtuales' value='examenes' >
                                        </div>
                                        <label class="col-lg-2 ">Slideshow :</label>
                                        <div class="col-lg-1">
                                            <input type="checkbox" <%=pptx%> min="0" class="" id="" name='usoAulaslideshow' value='ppt' >
                                        </div>
                                    </div>
                                </div>
                                <div class="observaciones">
                                    <label>5. Disponibilidad de recursos en aulas y laboratorios</label>
                                    <textarea name="obsDisponibilidad" class="form-control" rows="3"><%=datos4[4]%></textarea>
                                </div>
                                <div class="observaciones">
                                    <label>6. Sílabo por competencias. ¿Qué actividades realizó usted para la evaluación del cumplimiento de las competencias de su curso,
                                    por los estudiatnes? ¿Podría presentar una propuesta de evaluación de las competencias de su curso?</label>
                                    <textarea name="obsCompetencias" class="form-control" rows="3"><%=datos4[5]%></textarea>
                                </div>
                                <div class="observaciones">
                                    <label>7.Mejora contínua. ¿Qué actividades de mejora contínua ha realizado en el curso de este ciclo y cuáles propone para el siguiente, para mejorar el rendimiento académico del estudiante.</label>
                                    <textarea name="obsMejora" class="form-control" rows="3"><%=datos4[6]%></textarea>
                                </div>
                                <div class="observaciones">
                                    <label>8. Actualización docente. Ha seguido usted algún curso de actualización profesional o docente en los últimos dos años. Indique tema del curso y duración</label>
                                    <textarea name="obsDocente" class="form-control" rows="3"><%=datos4[7]%></textarea>
                                </div>
                                <div class="observaciones">
                                   <label>9.Comentarios y Recomendaciones. Serán útiles para mejorar el Plan de Estudio y los servicios que brinadn la Escuela, la Facultad y la Universidad</label>
                                   <textarea name="obsComentarios" class="form-control" rows="3"><%=datos4[8]%></textarea>
                                </div>
                                
                            </div>


                            <div class="form-group">
                                 <%if(nivelUsuario.equals("Usuario")){ %>
                                    <input class="btn btn-primary" type="submit" name="Guardar" value="Guardar">
                                    <input class="btn btn-primary" type="submit" name="Enviar" value="Enviar">
                                <%}%>
                                <% if(nivelUsuario.equals("Administrador") || nivelUsuario.equals("Supervisor")){ %>
                            <!--//      <a href="/SistemaInformesUPTWeb-V2/ActualizarEstadoInformeAdmin?estado=Aceptado&id_Final= idInfoFinal &idCurso= datos2[0] ">Aceptar</a>-->
                                    <input class="btn btn-success" type="submit" name="Aceptar" value="Aceptar">
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Rechazar</button>
                                <% } %> 
                                <input class="btn btn-primary" type="submit" name="Informe" value="Hacer Informe">
                                <a href="consultaPruebaEntrada.jsp" class="btn btn-primary"> Volver</a>
                                <input type="hidden" name="id_Final" value="<%=idInfoFinal%>" />
                            </div>

                            <div class="form-group">
                                <p></p>
                            </div>

                        </fieldset>
                       
                        <!-- VENTANA PARA INGRESAR EL MOTIVO DE RECHAZO DEL INFORME -->
                        <div class="container">
                          <!-- Modal -->
                          <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">
                              <!-- Modal content-->
                              <div class="modal-content">
                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  <h4 class="modal-title">Rechazar Informe</h4>
                                </div>
                                <div class="modal-body">
                                    <textarea name="motivo" class="form-control" placeholder="Motivo de Rechazo."></textarea>
                                </div>
                                <div class="modal-footer">
                                  <input class="btn btn-info" type="submit" name="Rechazar" value="Rechazar">
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>     
                            
                            
                    </form>
                    <%}%>
                </div>
            </div>
        </div>   
        <script>
             var i = <%=cnt%>;
             var calculadoPorcentajes = false;
            $("#add_row").click(function(){
                
                $('#addr'+i).html("<td><input value='"+ (i + 1) +"' type='text' class='form-control'/></td>"+
                               "<td><input name='detalledescripcionCapa"+i+"' type='text' class='form-control'/></td>"+
                               "<td><input name='detallenadaCapa"+i+"' type='text' class='form-control'/></td>"+
                               "<td><input name='detallepocoCapa"+i+"' type='text' class='form-control'/></td>"+
                               "<td><input name='detalleaceptableCapa"+i+"' type='text' class='form-control'/></td>"+
                               "<td><input name='detallebienCapa"+i+"' type='text' class='form-control'/></td>" +
                               "<td><input name='detallemuyBienCapa"+i+"' type='text' class='form-control'/></td>");
//                               "<td><input name='buPer"+i+"' type='text' class='form-control'/></td>"+
//                               "<td><input name='total"+i+"' type='text' class='form-control'/></td>");  

                $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');

                $('#mc'+i).html("<p>Para Nº "+(i+1)+"<p><textarea name='medCorrectiva"+i+"' class='form-control'></textarea>");
             
                $('#medidas_logic').append("<div id='mc"+(i+1)+"'></div>");
             
             i++; 
         });
            $("#delete_row").click(function(){
                if(i>1){
                $("#addr"+(i-1)).html('');
                $("#mc"+(i-1)).html('');
                i--;
                }
            });
            
            $("#calc_percentages").click(function(){
                var filas = i;
                var permessage = "";
                
                if ($("input[name=estMatricu]").val() !== "") {
                    var matriculados = parseFloat( $("input[name=estMatricu]").val() );
                    var porcentajeTotal = 0.0;
                    if (matriculados >= 1) {
                        porcentajeTotal = ((matriculados / matriculados) *100) ; 
                        $("input[name=porcentajeMatriculados]").val(porcentajeTotal);
                    }
                    else{
                        $("input[name=porcentajeMatriculados]").val(0);
                    }
                    if ($("input[name=estReti]").val() !== "" && $("input[name=estAbando]").val() !== "" &&
                        $("input[name=estAsiste]").val() !== "" && $("input[name=estAprobado]").val() !== "" &&
                        $("input[name=estDesapro]").val() !== "") {

                        var retirados = parseFloat( $("input[name=estReti]").val() );
                        var abandono = parseFloat(  $("input[name=estAbando]").val() );
                        var asisten = parseFloat( $("input[name=estAsiste]").val() );
                        var aprobados = parseFloat( $("input[name=estAprobado]").val() );
                        var desaprobados = parseFloat( $("input[name=estDesapro]").val() );
                        
                        var eva = aprobados + desaprobados;

                        if ( (asisten <= matriculados && asisten > 0 ) ) {
                            if ( eva <= asisten && (aprobados + desaprobados) > 0 && aprobados >= 0 && desaprobados >= 0) {
//                                DecimalFormat df = new DecimalFormat("#0.0");
                                var preti = (retirados * porcentajeTotal ) /   matriculados;
    
                                $("input[name=porcentajeRetirados]").val( preti );
                                
                                var paban = (abandono * porcentajeTotal) / matriculados;
                                console.log(paban);
                                
                                $("input[name=porcentajeAbandono]").val( paban );
                                $("input[name=porcentajeAsisten]").val((asisten * porcentajeTotal)/matriculados);
//                                txtPorcenAsisten.setText( ""+(asisten * porcentajeTotal)/matriculados);
                                var asis = parseFloat(  $("input[name=porcentajeAsisten]").val() );
//                                txtPorcenAsisten.setText( ""+df.format((asisten * porcentajeTotal)/matriculados));


        //                        double porcentajeAsisten = asis;
        //                        df.format(porcentajeAsisten);
                                $("input[name=porcentajeAprobados]").val((aprobados * asis)/asisten);
                                $("input[name=porcentajeDesaprobados]").val((desaprobados * asis)/asisten);

                                calculadoPorcentajes = true;
                            }
                            else{
                                permessage = "Cantidad de aprobados y desaprobados no coinciden";
                            }
                        }else{
                            permessage = "Alumnos Asistentes mayores a los Matriculados";
                        }

                    }
                    else{
                        permessage = "Faltan Datos.";
                    }
                }
                else{
                    permessage = "Numero de Matriculados NULO";
                }
                $("#permessage").html('');
                $("#permessage").append(permessage);
            });
        </script>
                                    
    </body>
</html>