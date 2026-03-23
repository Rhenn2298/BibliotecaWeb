<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Biblioteca Digital</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-brand">
                    <span>📚 Biblioteca Digital - Bienvenido/a, ${sessionScope.usuario.nombre} </span>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">           
                    <ul class="navbar-nav ms-auto">
                        <c:if test="${sessionScope.usuario.rol == 'ESTUDIANTE'}">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/libros">Catálogo</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/prestamos">Mis Libros</a></li>
                            </c:if>
                            <c:if test="${sessionScope.usuario.rol == 'ADMIN'}">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/prestamos">Préstamos</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/libros">Libros</a></li>
                            </c:if>
                        <li class="nav-item">
                            <button type="button" class="nav-link btn btn-link text-warning" data-bs-toggle="modal" data-bs-target="#confirmLogoutModal">
                                Salir
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <main class="container mt-4">
            <jsp:include page="${contenido}" />
        </main>
        <footer class="bg-dark text-white text-center py-3 fixed-bottom">
            <p>&copy; 2026 Biblioteca Digital</p>
        </footer>
        <!-- Modal confirmacion de cerrar sesion -->
        <div class="modal fade" id="confirmLogoutModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-dark">
                        <h5 class="modal-title text-white">Confirmar cierre de sesión</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro que deseas cerrar tu sesión?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                        <!-- Este botón sí envía el formulario -->
                        <form method="POST" action="logout" style="display:inline;">
                            <button type="submit" class="btn btn-dark">Cerrar sesión</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>