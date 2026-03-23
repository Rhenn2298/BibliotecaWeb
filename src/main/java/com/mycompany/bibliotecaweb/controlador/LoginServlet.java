package com.mycompany.bibliotecaweb.controlador;

import com.mycompany.bibliotecaweb.db.UsuarioDAO;
import com.mycompany.bibliotecaweb.modelo.Usuario;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//Acceso al Sistema
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    //Dependencia DAO
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();
    //Formulario Login
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mostrar formulario login
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    //Gestion de credenciales del usuario
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Datos del formulario
        String rut = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        try {
            //Validacion de credenciales
            Usuario usuario = usuarioDAO.validarLogin(rut, contrasena);
            if (usuario != null) {
                //Login correcto
                request.getSession().setAttribute("usuario", usuario);
                response.sendRedirect(request.getContextPath() + "/dashboard");
            } else {
                //Login incorrecto
                request.setAttribute("error", "datos incorrectos");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            //Errores y Excepciones
            System.err.println("Error LoginServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error de sistema");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
