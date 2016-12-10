/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidad.ClsEntidadPruebaCursosFaltantes;
import Negocio.ClsNegocioPruebaEntrada;
import static Presentacion.FrmReportesFaltantes.tablaF;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author enzocv
 */
public class TraerDatosCabeceraPortafolio extends HttpServlet {

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
            out.println("<title>Servlet TraerDatosCabeceraPortafolio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TraerDatosCabeceraPortafolio at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
            String codDocente = String.valueOf(request.getSession().getAttribute("codDocente"));
            String nivelUsuario = String.valueOf(request.getSession().getAttribute("nivelUsuario")); 
        
            ClsNegocioPruebaEntrada datos = new ClsNegocioPruebaEntrada();
            String busqueda = request.getParameter("busqueda");
            
            ArrayList<ClsNegocioPruebaEntrada> dato = null;
            
            dato = datos.hacerInformePruebaFaltante(codDocente,busqueda);//ArrayList

            Iterator iterator = dato.iterator();


            String campo[] = new String[8];

            while (iterator.hasNext()) {
                ClsEntidadPruebaCursosFaltantes objenti = new ClsEntidadPruebaCursosFaltantes();

                objenti = (ClsEntidadPruebaCursosFaltantes) iterator.next();

                campo[0] = objenti.getIdCurso();
                campo[1] = objenti.getNombreCurso();
                campo[2] = objenti.getNombreDocente();
                campo[3] = String.valueOf(objenti.getAlumnosMatriculados());
                campo[4] = String.valueOf(objenti.getAlumnosRetirados());
                campo[5] = String.valueOf(objenti.getAlumnosAbandono());
                campo[6] = String.valueOf(objenti.getIdUnidad());
                campo[7] = String.valueOf(objenti.getDescripcionUnidad());

            }
        
        request.setAttribute("campo", campo);
        request.getRequestDispatcher("portafolio.jsp").forward(request, response);
            
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
        processRequest(request, response);
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
