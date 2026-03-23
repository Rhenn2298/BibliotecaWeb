package com.mycompany.bibliotecaweb.controlador;

import com.mycompany.bibliotecaweb.db.CopiaDAO;
import com.mycompany.bibliotecaweb.db.LibroDAO;
import com.mycompany.bibliotecaweb.db.PrestamoDAO;
import com.mycompany.bibliotecaweb.db.UsuarioDAO;
import com.mycompany.bibliotecaweb.modelo.Copia;
import com.mycompany.bibliotecaweb.modelo.EstadoPrestamo;
import com.mycompany.bibliotecaweb.modelo.Libro;
import com.mycompany.bibliotecaweb.modelo.Prestamo;
import com.mycompany.bibliotecaweb.modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
//Gestion de prestamos
@WebServlet(name = "PrestamoServlet", urlPatterns = {"/prestamos"})
public class PrestamoServlet extends HttpServlet {
    //Instancias de DAO
    private final PrestamoDAO prestamoDAO = new PrestamoDAO();
    private final LibroDAO libroDAO = new LibroDAO();
    private final CopiaDAO copiaDAO = new CopiaDAO();
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();
    //Carga de prestamos
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Verificar si el usuario está logueado
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        // Obtener parametros del usuario
        String rol = usuario.getRol().toString();
        String rut = usuario.getRut();
        try {
            //Prestamos del estudiante en Sesion
            if ("ESTUDIANTE".equals(rol)) {
                List<Prestamo> prestamos = prestamoDAO.listarPorUsuario(rut);
                for (Prestamo prestamo : prestamos) {
                    try {
                        //Obtiene el libro/copia solicitada
                        Copia copia = copiaDAO.obtenerIdCopia(prestamo.getIdCopia());
                        if (copia != null) {
                            Libro libro = libroDAO.buscarPorIsbn(copia.getIsbn());
                            prestamo.setLibro(libro);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                request.setAttribute("prestamos", prestamos);
                request.setAttribute("contenido", "/WEB-INF/vistas/prestamos/lista-alumno.jsp");
            //Prestamos realizados a la biblioteca
            } else if ("ADMIN".equals(rol)) {
                //Prestamos por estado
                List<Prestamo> solicitados = prestamoDAO.listarSolicitados();
                List<Prestamo> entregados = prestamoDAO.listarEntregados();
                List<Prestamo> vencidos = prestamoDAO.listarVencidos();
                List<Prestamo> devueltos = prestamoDAO.listarDevueltos();
                //Datos del Usuario solicitante
                obtenerUsuarioPrestamos(solicitados, usuarioDAO);
                obtenerUsuarioPrestamos(entregados, usuarioDAO);
                obtenerUsuarioPrestamos(vencidos, usuarioDAO);
                obtenerUsuarioPrestamos(devueltos, usuarioDAO);
                //Datos del libro solicitado
                obtenerLibrosPrestamos(solicitados, libroDAO, copiaDAO);
                obtenerLibrosPrestamos(entregados, libroDAO, copiaDAO);
                obtenerLibrosPrestamos(vencidos, libroDAO, copiaDAO);
                obtenerLibrosPrestamos(devueltos, libroDAO, copiaDAO);
                //Prestamos filtrados por estado
                request.setAttribute("solicitados", solicitados);
                request.setAttribute("entregados", entregados);
                request.setAttribute("vencidos", vencidos);
                request.setAttribute("devueltos", devueltos);
                request.setAttribute("contenido", "/WEB-INF/vistas/prestamos/lista-admin.jsp");
            }
            //Redireccion a Dashboard
            request.getRequestDispatcher("/WEB-INF/vistas/dashboard.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            System.err.println("Error en PrestamoServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendError(500, "Error en el servidor");
        }
    }
    //Gestion de CRUD prestamos
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Verificacion de Sesion activa
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        try {
            String accion = request.getParameter("accion");
            //Creacion de prestamo
            if ("crear".equals(accion) && "ESTUDIANTE".equals(usuario.getRol().toString())) {
                String isbn = request.getParameter("isbn");
                //Busca copias disponibles
                List<Copia> copiasDisponibles = copiaDAO.listarDisponibles(isbn);
                if (copiasDisponibles.isEmpty()) {
                    response.sendError(400, "No hay cpias disponibles en este momento");
                    return;
                }
                String idCopia = copiasDisponibles.get(0).getIdCopia();
                Prestamo prestamo = new Prestamo();//Creacion de Prestamo solicitado
                prestamo.setRut(usuario.getRut());
                prestamo.setIdCopia(idCopia);
                prestamo.setFechaSolicitud(LocalDate.now());
                prestamo.setEstado(EstadoPrestamo.SOLICITADO);
                prestamoDAO.guardar(prestamo);
                copiaDAO.actualizarEstado(idCopia, false);//Marca copia como no disponible
            //Entrega de Libro, Cambio de estado a Entregado y asignacion de fechas
            } else if ("entregar".equals(accion) && "ADMIN".equals(usuario.getRol().toString())) {
                int idPrestamo = Integer.parseInt(request.getParameter("idPrestamo"));
                List<Prestamo> prestamos = prestamoDAO.listar("SOLICITADO");//Busqueda del libro a entregar
                Prestamo prestamo = null;
                for (Prestamo p : prestamos) {
                    if (p.getIdPrestamo() == idPrestamo) {
                        prestamo = p;
                        break;
                    }
                }
                //Actualizacion de datos del prestamo
                if (prestamo != null) {
                    prestamo.setFechaEntrega(LocalDate.now());
                    prestamo.setFechaVencimiento(LocalDate.now().plusMonths(2));
                    prestamo.setEstado(EstadoPrestamo.ENTREGADO);
                    prestamoDAO.actualizar(prestamo);
                }
            //Devolucion de Libro, Cambio de estados a DEVUELTO y a copia Disponible
            } else if ("devolver".equals(accion) && "ADMIN".equals(usuario.getRol().toString())) {
                int idPrestamo = Integer.parseInt(request.getParameter("idPrestamo"));
                String idCopia = request.getParameter("idCopia");
                copiaDAO.actualizarEstado(idCopia, true);//Cambio de estado a dispopnible
                List<Prestamo> prestamos = prestamoDAO.listar("ENTREGADO");//Busqueda libro a devolver
                for (Prestamo p : prestamos) {
                    if (p.getIdPrestamo() == idPrestamo) {
                        p.setEstado(EstadoPrestamo.DEVUELTO);
                        prestamoDAO.actualizar(p);
                        break;
                    }
                }
            }
            response.sendRedirect(request.getContextPath() + "/prestamos");
        //control de Errores y Excepciones
        } catch (NumberFormatException e) {
            System.err.println("Error numerico: " + e.getMessage());
            response.sendError(400, "Datos inválidos");
        } catch (Exception e) {
            System.err.println("Error PrestamoServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendError(500, "Error al procesar préstamo");
        }
    }
    //Datos del Usuario a prestar
    private void obtenerUsuarioPrestamos(List<Prestamo> prestamos, UsuarioDAO usuarioDAO) {
        for (Prestamo prestamo : prestamos) {
            try {
                Usuario usuario = usuarioDAO.obtenerUsuarioPorRut(prestamo.getRut());
                prestamo.setUsuario(usuario);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    //Datos del Libro a prestar
    private void obtenerLibrosPrestamos(List<Prestamo> prestamos, LibroDAO libroDAO, CopiaDAO copiaDAO) {
        for (Prestamo prestamo : prestamos) {
            try {
                Copia copia = copiaDAO.obtenerIdCopia(prestamo.getIdCopia());
                if (copia != null) {
                    Libro libro = libroDAO.buscarPorIsbn(copia.getIsbn());
                    prestamo.setLibro(libro);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
