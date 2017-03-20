/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vista;

import com.sv.udb.controlador.JugadoresCtrl;
import com.sv.udb.modelo.Jugadores;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DanielWilfredo
 */
@WebServlet(name = "JugadoresServ", urlPatterns = {"/JugadoresServ"})
public class JugadoresServ extends HttpServlet {

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
         boolean esValido = request.getMethod().equals("POST");
        String mens = "";
        if(!esValido){
            response.sendRedirect(request.getContextPath() + "/Jugadores.jsp");
        }
        else
        {
            String CRUD = request.getParameter("btnJuga");//Declaro una variable para obtener
            //que se presiono en el boton de la pagina jugadores.jsp
            if(CRUD.equals("Guardar"))
            {
                Jugadores obje = new Jugadores();
                obje.setCodiEqui(Integer.parseInt(request.getParameter("cmbEqui")));
                obje.setNombJuga(request.getParameter("nombJuga"));
                obje.setEdadJuga((request.getParameter("edadJuga")));
                obje.setAltuJuga(Integer.parseInt((request.getParameter("altuJuga"))));
                obje.setPesoJuga((request.getParameter("pesoJuga")));
                if(new JugadoresCtrl().guar(obje))
                {
                    mens="Datos Guardados";
                }
                else
                {
                    mens="Error al guardar";
                }
            }
             request.setAttribute("mensAler",mens);
            request.getRequestDispatcher("/jugadores.jsp").forward(request, response);
            
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
