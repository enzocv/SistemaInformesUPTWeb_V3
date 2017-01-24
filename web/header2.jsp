
<div class="navbar navbar-default navbar-fixed-top shadow">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                    
            </button>
<!--                    <div class="logo navbar-brand"></div>-->
<!--                    <img src="img/logo.png" class="navbar-brand logo">-->
            <a href="#" class="navbar-brand brand"> Sistema Informes UPT</a>
        </div>  
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" area-hashpopup="false" area-expanded="false">
                        Informes<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/SistemaInformesUPTWeb-V2/reportesFaltantes.jsp">Ver informes restantes</a></li>
                    </ul>                    
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" area-hashpopup="true" area-expanded="false">
                        Consultas<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/SistemaInformesUPTWeb-V2/consultaPruebaEntrada.jsp">Consulta Informes</a></li>
                        <%
                            if(session.getAttribute("nivelUsuario")!=null)
                            {
                                if (session.getAttribute("nivelUsuario").equals("Administrador") || session.getAttribute("nivelUsuario").equals("Supervisor"))
                                {
                        %>   
                                <li><a href="/SistemaInformesUPTWeb-V2/ControlInformes.jsp?Informe=Prueba+Entrada&Buscar=Buscar&tabla_length=20">Control de Informes</a></li>
                                <li><a href="/SistemaInformesUPTWeb-V2/Unidad.jsp">Control de Unidad</a></li>
                        <%
                                }
                                else {%>
                                <li><a href="/SistemaInformesUPTWeb-V2/ControlInformeCursos.jsp">Consulta Informes Por Cursos</a></li>
                                <% }
                            }
                        %>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" area-hashpopup="false" area-expanded="false">
                        Imprimir<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/SistemaInformesUPTWeb-V2/imprimirReporte.jsp">Imprimir informes aprobados</a></li>
                        <%
                            if(session.getAttribute("nivelUsuario")!=null)
                            {
                                if (session.getAttribute("nivelUsuario").equals("Administrador") || session.getAttribute("nivelUsuario").equals("Supervisor"))
                                {
                        %>   
                                <li><a href="/SistemaInformesUPTWeb-V2/imprimirReporteCiclos.jsp">Reportes Por Ciclo</a></li>
                        <%
                                }
                            }%>
                    </ul>                    
                </li>
                <%
                            if(session.getAttribute("nivelUsuario")!=null)
                            {
                                if (session.getAttribute("nivelUsuario").equals("Administrador") || session.getAttribute("nivelUsuario").equals("Supervisor"))
                                {
                        %>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" area-hashpopup="false" area-expanded="false">
                                            Mantenimiento<span class="caret"></span>
                                        </a>         
                                        <ul class="dropdown-menu">
                                            <li><a href="/SistemaInformesUPTWeb-V2/Mantenimiento/MantenimientoCursos.jsp">Cursos</a></li>
                                            <li><a href="/SistemaInformesUPTWeb-V2/Mantenimiento/MantenimientoDocentes.jsp">Docentes</a></li>
                                        </ul>
                                    </li>
                <%
                                }
                            }%>
            </ul>

            <ul class="nav navbar-nav navbar-right">
            <%
                if (session.getAttribute("codDocente") != null)
                {
            %>   
            <li><a href="#" id="unidadActiva" style="color: #99ffff;"><%=session.getAttribute("unidadActiva")%></a></li>
                <li><a href="#" id="loginlink">Bienvenido: <%=session.getAttribute("nombreDocente")%></a></li>
                <li><a href="/SistemaInformesUPTWeb-V2/cerrarSession.jsp" id="loginlink">Cerrar sesión</a></li>
            <%          
                }else{ %>
                <li><a href="/SistemaInformesUPTWeb-V2/login.jsp" id="loginlink">No ha iniciado sesión</a></li>
            <%
                }
            %>                    
            </ul>
        </div>
    </div>
</div>

