/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.Mante.Usuario;

import Entidad.ClsEntidadUsuario;
import Negocio.ClsNegocioUsuario;
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
public class GuardarUsuarioServlet extends HttpServlet {

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
            out.println("<title>Servlet GuardarUsuarioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarUsuarioServlet at " + request.getContextPath() + "</h1>");
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
        
        ClsEntidadUsuario entiUsu = new ClsEntidadUsuario();
        ClsNegocioUsuario negoUsu = new ClsNegocioUsuario();
        
        String idUsu = negoUsu.ObtenerID();
        String codDoc = request.getParameter("txtCodigo");
        String contraseniaUsu = request.getParameter("txtContrasenia");
        String nivelUsu = request.getParameter("cmbNivel");
        String estadoUsu = request.getParameter("cmbEstado");



        entiUsu.setIdUsuario(idUsu);
        entiUsu.setCodDocente(codDoc);
        entiUsu.setContraseniaUsuario(contraseniaUsu);
        entiUsu.setNivelUsuario(nivelUsu);
        entiUsu.setEstadoUsuario(estadoUsu);
        
        negoUsu.AgregarUsuario(entiUsu);
        
        try {
            negoUsu.cst.close();
            negoUsu.conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(GuardarUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);    
        }
        
        
        response.sendRedirect("Mantenimiento/MantenimientoUsuarios.jsp");
        
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
