package com.mycompany.bibliotecaweb.controlador;

import com.mycompany.bibliotecaweb.db.CopiaDAO;
import com.mycompany.bibliotecaweb.db.LibroDAO;
import com.mycompany.bibliotecaweb.modelo.Copia;
import com.mycompany.bibliotecaweb.modelo.Genero;
import com.mycompany.bibliotecaweb.modelo.Libro;
import com.mycompany.bibliotecaweb.modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
//Gestion de Catalogo de libors y copias
@WebServlet(name = "LibroServlet", urlPatterns = {"/libros"})
public class LibroServlet extends HttpServlet {
//Dependencia DAO
    private final LibroDAO libroDAO = new LibroDAO();
    private final CopiaDAO copiaDAO = new CopiaDAO();
    //Navegacion del Catalogo Bibliotecario
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Verificar si el usuario está logueado
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        //Parametros de navegacion
        String accion = request.getParameter("accion");
        String id = request.getParameter("id");
        try {
            //Detalles del Libro, datos del libro y copias
            if ("detalle".equals(accion) && id != null) {
                Libro libro = libroDAO.buscarPorIsbn(id);
                int disponibles = copiaDAO.contarDisponibles(id);
                List<Copia> copiasDisponibles = copiaDAO.listarDisponibles(id);
                String idCopiaDisponible = "";
                if (!copiasDisponibles.isEmpty()) {//Busqueda de ID_Copia disponible
                    idCopiaDisponible = copiasDisponibles.get(0).getIdCopia();
                }
                request.setAttribute("libro", libro);
                request.setAttribute("disponibles", disponibles);
                request.setAttribute("idCopiaDisponible", idCopiaDisponible);
                request.setAttribute("contenido", "/WEB-INF/vistas/libros/detalle.jsp");
            //Formulario de Agregar o Actualizar Libros
            } else if ("formulario".equals(accion)) {
                if (id != null) {//carga de datos de un libro seleccionado
                    Libro libro = libroDAO.buscarPorIsbn(id);
                    List<Copia> copias = copiaDAO.listarCopias(id);
                    request.setAttribute("libro", libro);
                    request.setAttribute("cantidadCopias", copias.size());
                }
                request.setAttribute("contenido", "/WEB-INF/vistas/libros/formulario.jsp");
            //Lista copias registradas d eun libro
            } else if ("copias".equals(accion) && id != null) {
                // Mostrar copias de un libro
                Libro libro = libroDAO.buscarPorIsbn(id);
                List<Copia> copias = copiaDAO.listarCopias(id);
                request.setAttribute("libro", libro);
                request.setAttribute("copias", copias);
                request.setAttribute("contenido", "/WEB-INF/vistas/libros/copias.jsp");
            //Catalogo completo
            } else {
                List<Libro> libros = libroDAO.listarTodos();
                request.setAttribute("libros", libros);
                request.setAttribute("contenido", "/WEB-INF/vistas/libros/lista.jsp");
            }
            //Redireccion Dashboard 
            request.getRequestDispatcher("/WEB-INF/vistas/dashboard.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            System.err.println("Error LibroServlet GET: " + e.getMessage());
            e.printStackTrace();
            response.sendError(500, "Error en el servidor");
        }
    }
    //Gestion CRUD
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Verificacion de Sesion
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario == null || !usuario.getRol().toString().equals("ADMIN")) {
            response.sendError(403, "Acceso denegado");
            return;
        }
        try {
            String accion = request.getParameter("accion");
            //Eliminacion de copias disponibles
            if ("eliminar".equals(accion)) {
                String idCopia = request.getParameter("idCopia");
                String isbn = request.getParameter("isbn");
                try {
                    Copia copia = copiaDAO.obtenerIdCopia(idCopia);
                    if (!copia.isDisponible()) {//Una copia prestada no se puede eliminar
                        request.setAttribute("error", "No se puede eliminar una copia en préstamo activo");
                        response.sendRedirect(request.getContextPath() + "/libros?accion=copias&id=" + isbn + "&error=copia_en_prestamo");
                        return;
                    }
                    copiaDAO.eliminar(idCopia);
                    response.sendRedirect(request.getContextPath() + "/libros?accion=copias&id=" + isbn);
                    return;
                } catch (Exception e) {
                    System.err.println("Error al eliminar copia: " + e.getMessage());
                    response.sendError(500, "Error al eliminar copia");
                    return;
                }
            //Agregar nuevas copias al catalogo
            } else if ("agregarCopia".equals(accion)) {
                String isbn = request.getParameter("isbn");
                int proximoNumero = copiaDAO.obtenerSiguienteID(isbn);
                Copia copia = new Copia();
                copia.setIsbn(isbn);
                copia.setNumeroCopia(proximoNumero);
                copia.setDisponible(true);
                copiaDAO.guardar(copia);
                response.sendRedirect(request.getContextPath() + "/libros?accion=copias&id=" + isbn);
                return;
            }
            //Datos del formulario para anadir un nuevo Libro
            String isbn = request.getParameter("isbn");
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String editorial = request.getParameter("editorial");
            int year = Integer.parseInt(request.getParameter("año"));
            Genero genero = Genero.valueOf(request.getParameter("genero"));
            Libro libro = new Libro(isbn, titulo, autor, genero, editorial, year);
            Libro libroExistente = libroDAO.buscarPorIsbn(isbn);
            if (libroExistente == null) {//Verificacion de Libro en catalogo para creacion o actualizacion
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                libroDAO.guardar(libro);
                // Crearcion de copias
                for (int i = 1; i <= cantidad; i++) {
                    Copia copia = new Copia();
                    copia.setIsbn(isbn);
                    copia.setNumeroCopia(i);
                    copia.setDisponible(true);
                    copiaDAO.guardar(copia);
                }
            } else {
                libroDAO.actualizar(libro);
            }
            response.sendRedirect(request.getContextPath() + "/libros");
        //Errores y Excepciones
        } catch (NumberFormatException e) {
            System.err.println("Error  " + e.getMessage());
            response.sendError(400, "Datos inválidos");
        } catch (IllegalArgumentException e) {
            System.err.println("Error de seleccion: " + e.getMessage());
            response.sendError(400, "Género inválido");
        } catch (Exception e) {
            System.err.println("Error LibroServlet POST: " + e.getMessage());
            e.printStackTrace();
            response.sendError(500, "Error al guardar libro");
        }
    }
}
