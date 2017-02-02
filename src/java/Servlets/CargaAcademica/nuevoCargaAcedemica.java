/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.CargaAcademica;

import Entidad.ClsEntidadCargaAcedemica;
import Negocio.ClsNegocioCargaAcademica;
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
 * @author Asus
 */
public class nuevoCargaAcedemica extends HttpServlet {

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
            out.println("<title>Servlet nuevoCargaAcedemica</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet nuevoCargaAcedemica at " + request.getContextPath() + "</h1>");
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
        
        String idPlanEstudio = request.getParameter("idPlanEstudio");
        String idSemestre    = request.getParameter("idSemestre");
        String idCurso       = request.getParameter("idCurso");
        String matriculados  = (request.getParameter("txtMatriculados") != null ) ? request.getParameter("txtMatriculados"):"0";
        String retirados     = (request.getParameter("txtRetirados")    != null ) ? request.getParameter("txtRetirados"):"0";
        String abandono      = (request.getParameter("txtAbandono")     != null ) ? request.getParameter("txtAbandono"):"0";
        String codDoc        = request.getParameter("idDocente");
        String seccion       = request.getParameter("idSeccion");
        
        ClsEntidadCargaAcedemica entCar = new ClsEntidadCargaAcedemica();
        ClsNegocioCargaAcademica negoCar = new ClsNegocioCargaAcademica();
        
        entCar.setIdPlanEstudio(Integer.parseInt(idPlanEstudio));
        entCar.setIdSemestre(Integer.parseInt(idSemestre));
        entCar.setIdCurso(idCurso);
        entCar.setAlumnosMatriculados(Integer.parseInt(matriculados));
        entCar.setAlumnosRetirados(Integer.parseInt(retirados));
        entCar.setAlumnosAbandono(Integer.parseInt(abandono));
        entCar.setCodDocente(codDoc);
        entCar.setSeccion(seccion);
        
        negoCar.AgregarCargaAcademica(entCar);
        
        try {
            negoCar.cst.close();
            negoCar.conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(nuevoCargaAcedemica.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("Mantenimiento/MantenimientoCargaAcademica.jsp");
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
