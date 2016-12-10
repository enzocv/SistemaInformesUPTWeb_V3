/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidad.ClsEntidadPortafolio;
import Entidad.ClsEntidadPortafolioMaterialDocente;
import Entidad.ClsEntidadPortafolioMaterialEstudiante;
import Negocio.ClsNegocioInformeFinalCurso;
import Negocio.ClsNegocioPortafolio;
import Negocio.ClsNegocioPortafolioMaterialDocente;
import Negocio.ClsNegocioPortafolioMaterialEstudiante;
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
public class GuardarPortafolio extends HttpServlet {

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
            out.println("<title>Servlet GuardarPortafolio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarPortafolio at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
        String id_Curso = request.getParameter("idcurso");
        String revisado = request.getParameter("caRevisadoPor");
        
        String estado = request.getParameter("Guardar") != null ? "Guardado":"Enviado";
        
        String Asiste = request.getParameter("asiste");
        String Aprobado = request.getParameter("estAprobado");
        String Desaprobado = request.getParameter("estDesapro");
//        out.println(request.getParameter("idUnidad"));
        int idUnidad = Integer.parseInt(request.getParameter("idUnidad").trim());
        
        /*Obtener el IDCARGAACADEMICA*/
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
        /*FIN DE OBTENER CARGAACADEMICA*/
        
        /*GUARDAR CABECERA PORTAFOLIO*/
        ClsEntidadPortafolio entiPortafolio = new ClsEntidadPortafolio();
        ClsNegocioPortafolio negPortafolio = new ClsNegocioPortafolio();
        
        entiPortafolio.setIdCargaAcademica(Integer.parseInt(idCargaAcademica));
        entiPortafolio.setEstadoPortafolio(estado);
        entiPortafolio.setEstudianteAsisten(Integer.parseInt( Asiste ) );
        entiPortafolio.setEstudianteAprobado(Integer.parseInt( Aprobado ));
        entiPortafolio.setEstudianteDesaprobado(Integer.parseInt(Desaprobado));
        entiPortafolio.setRecepcioadoPor(revisado);
        entiPortafolio.setIdUnidad(idUnidad);

        negPortafolio.AgregarPortafolio(entiPortafolio);
        
        ClsNegocioPortafolioMaterialDocente negoMaterialDocente2 =  new ClsNegocioPortafolioMaterialDocente();
        
        ArrayList<String> idinfo = negoMaterialDocente2.obtenerInfoFinalDocente(codDocente,id_Curso,idUnidad);
        String id[] = idinfo.toArray(new String[idinfo.size()]);
        
        /*FIN GUARDAR CABECERA PORTAFOLIO*/
//        out.println(Asiste);
//        out.println(Aprobado);
//        out.println(Desaprobado);
//        out.println(revisado);
        
        /* RECIBIR DATOS DE CAPACIDADES */
        ArrayList<String> datosTabla1 = new ArrayList<>();
        ArrayList<String> datosTabla2 = new ArrayList<>();

        /*DATOS DE TABLA 1*/
        Enumeration parameterList = request.getParameterNames();
        while( parameterList.hasMoreElements() )
        {
          String sName = parameterList.nextElement().toString();
          if(sName.toLowerCase().startsWith("t1")){
            datosTabla1.add(request.getParameter(sName));
          }
        }
        /*FIN DATOS TABLA 1*/
        
        /*DATOS TABLA 2*/
        Enumeration parameterList2 = request.getParameterNames();
        while( parameterList2.hasMoreElements() )
        {
          String sName = parameterList2.nextElement().toString();
          if(sName.toLowerCase().startsWith("t2")){
            datosTabla2.add(request.getParameter(sName));
          }
        }
        /*FIN DATOS TABLA 2*/
        
        ClsEntidadPortafolioMaterialDocente entiMaterialDocente = new ClsEntidadPortafolioMaterialDocente();
        ClsNegocioPortafolioMaterialDocente negoMaterialDocente =  new ClsNegocioPortafolioMaterialDocente();

        ClsEntidadPortafolioMaterialEstudiante entiMaterialEstudiante = new ClsEntidadPortafolioMaterialEstudiante();
        ClsNegocioPortafolioMaterialEstudiante negoMaterialEstudiante =  new ClsNegocioPortafolioMaterialEstudiante();

//        ArrayList<String> idinfo = negoMaterialDocente.obtenerInfoFinalDocente(codDocente,id_Curso,idUnidad);
//        String id[] = idinfo.toArray(new String[idinfo.size()]);

        for (int i = 0; i < datosTabla1.size(); i+=4) {
            entiMaterialDocente.setIdPortafolio(Integer.parseInt( id[0] ));
            entiMaterialDocente.setMaterial(datosTabla1.get(i));
            String digi = datosTabla1.get(i+1).equals("1") && datosTabla1.get(i+1) != null  ? "Si":"No";
            String impre = datosTabla1.get(i+2).equals("1") && datosTabla1.get(i+2) != null ? "Si":"No";
            boolean digital = false;
            boolean impreso = false;
            if (digi.equals("Si")) digital = true;
            if (impre.equals("Si")) impreso = true;
            
//            out.println("========= T1 ========");
//            out.println("Total: "+datosTabla1.size());
//            out.println("Descripcion: "+datosTabla1.get(i));
//            out.println("Digital: "+ datosTabla1.get(i+1) );
//            out.println("Impreso: "+ datosTabla1.get(i+2) );
//            out.println("Cantidad: "+datosTabla1.get(i+3));
//            out.println("boolean digital: "+ digital  );
//            out.println("boolean impreso: "+ impreso );
//            out.println("=================");
            
            entiMaterialDocente.setDigital( digital );
            entiMaterialDocente.setImpreso( impreso );
            entiMaterialDocente.setCantidad( Integer.parseInt(datosTabla1.get(i+3)) );
            
            negoMaterialDocente.AgregarDetallePortafolioMaterialDocente(entiMaterialDocente);
        }

        for (int j = 0; j < datosTabla2.size(); j+=4) {
            entiMaterialEstudiante.setIdPortafolio(Integer.parseInt( id[0] ));
            entiMaterialEstudiante.setMaterial(datosTabla2.get(j));
//            
            String digi2 = datosTabla2.get(j+1).equals("1") && datosTabla2.get(j+1) != null  ? "Si":"No";
            String impre2 = datosTabla2.get(j+2).equals("1") && datosTabla2.get(j+2) != null ? "Si":"No";
            boolean digital2 = false;
            boolean impreso2 = false;
            if (digi2.equals("Si")) digital2 = true;
            if (impre2.equals("Si")) impreso2 = true;
//            out.println("========= T2 ========");
//            out.println("Total: "+datosTabla2.size());
//            out.println("Descripcion: "+datosTabla2.get(j));
//            out.println("Digital: "+ datosTabla2.get(j+1) );
//            out.println("Impreso: "+ datosTabla2.get(j+2) );
//            out.println("Cantidad: "+datosTabla2.get(j+3));
//            out.println("boolean digital: "+ digital2  );
//            out.println("boolean impreso: "+ impreso2 );
//            out.println("=================");
            
            entiMaterialEstudiante.setDigital( digital2 );
            entiMaterialEstudiante.setImpreso( impreso2 );
            entiMaterialEstudiante.setCantidad( Integer.parseInt(datosTabla2.get(j+3)) );
            
            negoMaterialEstudiante.AgregarDetallePortafolioMaterialEstudiante(entiMaterialEstudiante);
        }

        try {
            negoMaterialDocente.cst.close();
            negoMaterialDocente.conexion.close();
            
            negoMaterialEstudiante.cst.close();
            negoMaterialEstudiante.conexion.close();
            
                   
        } catch (SQLException ex) {
            Logger.getLogger(GuardarPortafolio.class.getName()).log(Level.SEVERE, null, ex);
        }
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
