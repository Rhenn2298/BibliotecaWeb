package com.mycompany.bibliotecaweb.controlador;

import com.mycompany.bibliotecaweb.modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//Dashboard
@WebServlet(name = "DashboardServlet", urlPatterns = {"/dashboard"})
public class DashboardServlet extends HttpServlet {
    //Verificacion de sesion
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Usuario logeado
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        //Redireccion al index
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        //Mostrar Dashboard
        request.getRequestDispatcher("/WEB-INF/vistas/dashboard.jsp")
                .forward(request, response);
    }
}
