/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.Mante.Semestre;

import Entidad.ClsEntidadSemestre;
import Negocio.ClsNegocioSemestre;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Drei
 */
public class GuardarSemestreServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet GuardarSemestreServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarSemestreServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        
        ClsEntidadSemestre entiSem = new ClsEntidadSemestre();
        ClsNegocioSemestre negoSem = new ClsNegocioSemestre();
        
        
        String nombreSem = request.getParameter("txtNombre");
        String anioSem = request.getParameter("txtAnio");
        String estadoSem = request.getParameter("cmbEstado");

        entiSem.setNombreSemestre(nombreSem);
        entiSem.setAnioSemestre(anioSem);
        entiSem.setEstadoSemestre(estadoSem);
        
        negoSem.AgregarSemestre(entiSem);
        
        try {
            negoSem.cst.close();
            negoSem.conexion.close();
        } catch (SQLException ex) { 
            Logger.getLogger(GuardarSemestreServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        response.sendRedirect("Mantenimiento/MantenimientoSemestres.jsp");
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
