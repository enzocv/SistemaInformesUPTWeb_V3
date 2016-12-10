/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidad.ClsEntidadCacidadInformeFinalCurso;
import Entidad.ClsEntidadInformeFinalCurso;
import Entidad.ClsEntidadObservaFinalCurso;
import Negocio.ClsNegocioCapadidadInformeFinalCurso;
import Negocio.ClsNegocioInformeFinalCurso;
import Negocio.ClsNegocioObservacionesInformeFinalCurso;
import Negocio.ClsNegocioUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author enzocv
 */
public class GuardarInfoFinal extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardarInfoFinal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarInfoFinal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        String codDocente = String.valueOf(request.getSession().getAttribute("codDocente"));
        String guardado = request.getParameter("Guardar") != null ? request.getParameter("Guardar"):"nada";
        String enviado = request.getParameter("Enviar")   != null ? request.getParameter("Enviar"):"nada";
        String estado = "nada";
        String id_Curso = request.getParameter("idCurso");
        
        /*OBTENER EL ESTADO*/
        if (guardado.equals("Guardar")) {
            estado = "Guardado";
        }
        else if (enviado.equals("Enviar")) {
            estado = "Enviado";
        }
        /*FIN DE OBTENER EL ESTADO/
        
        */
        /*OBTENER EL ID DE LA CARGA ACADEMICA*/
        ClsEntidadInformeFinalCurso entiInfoFinal = new ClsEntidadInformeFinalCurso();
        ClsNegocioInformeFinalCurso negoInfoFinal = new ClsNegocioInformeFinalCurso();

        String idCargaAcademica = "";
        ClsNegocioUsuario docente = new ClsNegocioUsuario();
        ResultSet rsDocente;
        try {
            rsDocente = docente.obtenerDatosPruebaEntrada(codDocente, id_Curso);
            while (rsDocente.next()) {
                idCargaAcademica = rsDocente.getString(8);
            }
            docente.conexion.close();
        } catch (Exception ex) {
            Logger.getLogger(GuardarInfoFinal.class.getName()).log(Level.SEVERE, null, ex);
        }
        /*FIN DE OBTENER EL ID DE LA CARGA ACADEMICA*/
        
        /*RECIBIR TODOS LOS DATOS DEL RESUMEN DEL CURSO*/
        
        int cumpliSilabo = Integer.parseInt(    request.getParameter("porSilabo")      != "" ? request.getParameter("porSilabo") : "0");
        int caliRealizadas = Integer.parseInt(  request.getParameter("caliRealizadas") != "" ? request.getParameter("caliRealizadas"):"0");
        int laboRealizada = Integer.parseInt(   request.getParameter("laboRealizada")  != "" ? request.getParameter("laboRealizada"):"0");
        int proyeRealizado = Integer.parseInt(  request.getParameter("proyeRealizado") != "" ? request.getParameter("proyeRealizado"):"0");
        int estAsiste = Integer.parseInt(       request.getParameter("estAsiste")      != "" ? request.getParameter("estAsiste"):"0");
        int estAprobado = Integer.parseInt(     request.getParameter("estAprobado")    != "" ? request.getParameter("estAprobado"):"0");
        int estDesapro = Integer.parseInt(      request.getParameter("estDesapro")     != "" ? request.getParameter("estDesapro"):"0");
        int notaMasAlta = Integer.parseInt(     request.getParameter("notaMasAlta")    != "" ? request.getParameter("notaMasAlta"):"0");
        int notaProm = Integer.parseInt(        request.getParameter("notaProm")       != "" ? request.getParameter("notaProm"):"0");
        int notaMasBaja = Integer.parseInt(     request.getParameter("notaMasBaja")    != "" ? request.getParameter("notaMasBaja"):"0");

        String Lab = request.getParameter("Lab") != null ? "Si" : "No";
        String Taller = request.getParameter("Taller") != null ? "Si" : "No";
        
        /*INGRESAR DATOS A LA ENTIDAD*/
        entiInfoFinal.setIdCargaAcademica(Integer.parseInt(idCargaAcademica));
        entiInfoFinal.setEstadoInformeFinalCurso(estado);
        entiInfoFinal.setCumpliSilabo(cumpliSilabo);
        entiInfoFinal.setPractiRealizadas(caliRealizadas);
        entiInfoFinal.setLaboratoRealizadas(laboRealizada);
        entiInfoFinal.setProyectoRealizado(proyeRealizado);
        entiInfoFinal.setEstudianteAsiste(estAsiste);
        entiInfoFinal.setEstudienteAproado(estAprobado);
        entiInfoFinal.setEstudianteDesaprobado(estDesapro);
        entiInfoFinal.setNotaMasAlta(notaMasAlta);
        entiInfoFinal.setNotaPromedio(notaProm);
        entiInfoFinal.setNotaMasBaja(notaMasBaja);
        entiInfoFinal.setLab(Lab);
        entiInfoFinal.setTaller(Taller);
        
        negoInfoFinal.AgregarInformeFinal(entiInfoFinal);
        
        try {
            negoInfoFinal.conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(GuardarInfoFinal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        /*FINAL RECIBIR TODOS LOS DATOS DEL RESUMEN DEL CURSO*/
        
        /*OBTENER EL ID DEL INFORME FINAL DEL CURSO*/
        ClsNegocioCapadidadInformeFinalCurso negocioCapacidadIdInfo = new ClsNegocioCapadidadInformeFinalCurso();
        ArrayList<String> idinfo = negocioCapacidadIdInfo.obtenerInfoFinalDocente(codDocente, id_Curso);
        String id[] = idinfo.toArray(new String[idinfo.size()]);
        /*FIN OBTENER EL ID DEL INFORME FINAL DEL CURSO*/
        
        /* RECIBIR DATOS DE CAPACIDADES */
        ArrayList<String> datosTabla = new ArrayList<>();
        ArrayList<String> datosMedidasCorrectivas = new ArrayList<>();

        Enumeration parameterList = request.getParameterNames();
        while( parameterList.hasMoreElements() )
        {
          String sName = parameterList.nextElement().toString();
          if(sName.toLowerCase().startsWith("detalle")){
            datosTabla.add(request.getParameter(sName));
          }
          if(sName.toLowerCase().startsWith("medcorrectiva")){
            datosMedidasCorrectivas.add(request.getParameter(sName));
          }
        }
        
        ClsEntidadCacidadInformeFinalCurso entiCapa = new ClsEntidadCacidadInformeFinalCurso();
        ClsNegocioCapadidadInformeFinalCurso negoCapa = new ClsNegocioCapadidadInformeFinalCurso();
        int l = 0;
        for (int i = 0; i < datosTabla.size(); i+=6) {
            entiCapa.setDescripcion(datosTabla.get(i));

            String n = datosTabla.get(i+1).toLowerCase().equals("x") ? "Si":"No";
            String p = datosTabla.get(i+2).toLowerCase().equals("x") ? "Si":"No";
            String a = datosTabla.get(i+3).toLowerCase().equals("x") ? "Si":"No";
            String b = datosTabla.get(i+4).toLowerCase().equals("x") ? "Si":"No";
            String m = datosTabla.get(i+5).toLowerCase().equals("x") ? "Si":"No";

            if(n.equals("Si")) entiCapa.setIdnivelcapacidad(1);
            if(p.equals("Si")) entiCapa.setIdnivelcapacidad(11);
            if(a.equals("Si")) entiCapa.setIdnivelcapacidad(21);
            if(b.equals("Si")) entiCapa.setIdnivelcapacidad(31);
            if(m.equals("Si")) entiCapa.setIdnivelcapacidad(41);

            entiCapa.setIdinformefinalcurso(Integer.parseInt(id[0]));

            entiCapa.setMedidaCorectiva(datosMedidasCorrectivas.get(l));
            l++;
            negoCapa.AgregarDetallePruebaEntrada(entiCapa);
        }
        
        /*FIR DE RECIBIR DATOS DE CAPACIDADES*/
        
        
        /* recibir datos observaciones */
        ClsEntidadObservaFinalCurso entiObserva = new ClsEntidadObservaFinalCurso();
        ClsNegocioObservacionesInformeFinalCurso negoObserva = new ClsNegocioObservacionesInformeFinalCurso();

        ArrayList<String> datosObservaciones = new ArrayList<>();

        Enumeration parameterListObs = request.getParameterNames();
        while( parameterListObs.hasMoreElements() )
        {
          String sName = parameterListObs.nextElement().toString();
          if(sName.toLowerCase().startsWith("obs")){
            datosObservaciones.add(request.getParameter(sName));
          }
        }  

        String materal = request.getParameter("usoAulamaterialcurso") != null ? "Material del Curso" : "No";
        String foros = request.getParameter("usoAulaforos") != null ? "Foros" : "No";
        String cuestionarios = request.getParameter("usoAulacuestionarios") != null ? "Cuestionarios" : "No";
        String examenes = request.getParameter("usoAulaexamenesvirtuales") != null ? "Examenes Virtuales" : "No";
        String tareas = request.getParameter("usoAulatareasencargadas") != null ? "Tareas Encargadas" : "No";
        String ppt = request.getParameter("usoAulaslideshow") != null ? "Presentaciones" : "No";
        String total = materal + "," + foros + "," + cuestionarios + "," + examenes + "," + tareas + "," + ppt;

        int p = 1;
        String da[] = new String[9];
        int idObs = 1;
        int i = 0;
        for ( i = 0; i < datosObservaciones.size(); i++) {
            entiObserva.setIdObservaciones(idObs);
            entiObserva.setIdinformefinalcurso(Integer.parseInt(id[0]));
            if (idObs == 4) {
                da[i] = total;
                entiObserva.setDescripcion(total);
                i--;
            }
            else{
                da[i] = datosObservaciones.get(i);
                entiObserva.setDescripcion(datosObservaciones.get(i));
            }

            idObs++;
            negoObserva.AgregarPruebaEntrada(entiObserva);
        }
        
        try {
            negoObserva.cst.close();
            negoObserva.conexion.close();
        } catch (Exception e) {
        }
        
        /* fin recibir */
        
        response.sendRedirect("reportesFaltantes.jsp");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
