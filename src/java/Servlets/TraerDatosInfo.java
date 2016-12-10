/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidad.ClsEntidadPruebaCursosFaltantes;
import Negocio.ClsNegocioPruebaEntrada;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author enzocv
 */
public class TraerDatosInfo extends HttpServlet {

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
            out.println("<title>Servlet TraerDatosInfo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TraerDatosInfo at " + request.getContextPath() + "</h1>");
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
        
        String id_Curso = request.getParameter("id_Curso");
        
        String campo[]  = new String[11];
        
        ArrayList<ClsNegocioPruebaEntrada> dato = null;
        ClsNegocioPruebaEntrada datos = new ClsNegocioPruebaEntrada();
        dato = datos.hacerInformePruebaFaltante(codDocente,"Informe Final Curso");
        Iterator iterator = dato.iterator();
            
        while (iterator.hasNext()) {
            ClsEntidadPruebaCursosFaltantes objenti = new ClsEntidadPruebaCursosFaltantes();

            objenti = (ClsEntidadPruebaCursosFaltantes) iterator.next();

            if (id_Curso.equals(String.valueOf(objenti.getIdCurso()))) {
                campo[0] = objenti.getIdCurso();
                campo[1] = objenti.getNombreCurso();
                campo[2] = String.valueOf(objenti.getHorasTeoricas());
                campo[3] = String.valueOf(objenti.getHoraPracticas());
                campo[4] = String.valueOf(objenti.getAlumnosMatriculados());
                campo[5] = String.valueOf(objenti.getAlumnosRetirados());
                campo[6] = String.valueOf(objenti.getAlumnosAbandono());
                campo[7] = String.valueOf(objenti.getCodigoDocente());
                campo[8] = String.valueOf(objenti.getNombreDocente());
                campo[9] = objenti.getEmailDocente();
                campo[10]= objenti.getCeluDocente();
                break;
            }
        }
        request.setAttribute("campo", campo);
        request.getRequestDispatcher("InformeFinal/informeFinal.jsp?id_Curso="+id_Curso).forward(request, response);
        out.println(campo[1]);
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
