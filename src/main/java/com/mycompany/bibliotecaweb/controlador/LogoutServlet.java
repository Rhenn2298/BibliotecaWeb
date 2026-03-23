package com.mycompany.bibliotecaweb.controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//Gestion de cierre de sesion
@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
    //Cierre de sesion mediante boton Salir
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Verificacion de sesion activa y cambio de estado
        if (request.getSession(false) != null) {
            request.getSession().invalidate();
        }
        // Redirigir al index con mensaje
        response.sendRedirect(request.getContextPath() + "/index.jsp?logout=1");
    }
}
