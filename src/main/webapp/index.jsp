<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Biblioteca Digital</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="d-flex align-items-center justify-content-center bg-secondary" style="height: 100vh;">

        <div class="card shadow bg-dark text-white" style="width: 400px;">
            <div class="card-body p-5">
                <h3 class="card-title text-center mb-4">📚 Biblioteca Digital</h3>

                <form method="POST" action="login">
                    <div class="mb-3">
                        <label for="usuario" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" required>
                    </div>

                    <div class="mb-3">
                        <label for="contrasena" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                    </div>

                    <button type="submit" class="btn btn-warning w-100">Ingresar</button>
                </form>
            </div>
        </div>
        <div class="modal fade" id="errorModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title">❌ Error de autenticación</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        Usuario o contraseña incorrectos. Intenta nuevamente.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="logoutModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-secondary text-white">
                        <h5 class="modal-title">✅ Sesión cerrada</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        Has cerrado sesión correctamente.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Mensaje de Datos de Login erroneos -->
        <%
            String error = request.getParameter("error");
            if ("1".equals(error)) {
        %>
        <script>
            var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
            errorModal.show();
            window.history.replaceState({}, document.title, window.location.pathname);
        </script>
        <%
            }
        %>
        
        <!-- Modal de Cerrar sesion -->
        <%
            String logout = request.getParameter("logout");
            if ("1".equals(logout)) {
        %>
        <script>
            var logoutModal = new bootstrap.Modal(document.getElementById('logoutModal'));
            logoutModal.show();
            window.history.replaceState({}, document.title, window.location.pathname);
        </script>
        <%
            }
        %>
    </body>
</html>