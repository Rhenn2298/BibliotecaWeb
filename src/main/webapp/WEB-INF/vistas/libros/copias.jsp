<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">
    <div class="card shadow-lg">
        <div class="card-header bg-dark text-white">
            <h3 class="mb-0">📋 Administrar Copias - <c:out value="${libro.titulo}" /></h3>
        </div>

        <div class="card-body p-4">
            <table class="table table-striped">
                <thead class="table-primary">
                    <tr>
                        <th>ID Copia</th>
                        <th>Título</th>
                        <th>Nro. Copia</th>
                        <th>Disponible</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="copia" items="${copias}">
                        <tr>
                            <td><c:out value="${copia.idCopia}" /></td>
                            <td><c:out value="${libro.titulo}" /></td>
                            <td><c:out value="${copia.numeroCopia}" /></td>
                            <td>
                                <c:if test="${copia.disponible}">
                                    <span class="badge bg-success">✅ Sí</span>
                                </c:if>
                                <c:if test="${!copia.disponible}">
                                    <span class="badge bg-danger">❌ No</span>
                                </c:if>
                            </td>
                            <td>
                                <form method="POST" action="libros" style="display:inline;">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="idCopia" value="${copia.idCopia}">
                                    <input type="hidden" name="isbn" value="${libro.isbn}">
                                    <button type="button" class="btn btn-sm btn-danger" 
                                            onclick="abrirModalEliminarCopia('${copia.idCopia}', '${libro.isbn}')">🗑️ Eliminar</button>                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Botón Agregar Copia -->
            <div class="mt-4">
                <form id="formAgregarCopia" method="POST" action="libros" style="display:inline;">
                    <input type="hidden" name="accion" value="agregarCopia">
                    <input type="hidden" name="isbn" value="${libro.isbn}">
                    <button type="button" class="btn btn-success btn-lg" 
                            onclick="abrirModalAgregarCopia()">➕ Agregar Nueva Copia</button>
                </form>
            </div>

            <!-- Botón Volver -->
            <div class="mt-4">
                <a href="libros" class="btn btn-secondary btn-lg">← Volver al Catálogo</a>
            </div>
        </div>
    </div>
</div>
<!-- Modal: Confirmar Agregar Copia -->
<div class="modal fade" id="modalAgregarCopia" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-success">
                <h5 class="modal-title text-white">➕ Agregar Nueva Copia</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                ¿Deseas agregar una nueva copia a <strong><c:out value="${libro.titulo}" /></strong>?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" onclick="confirmarAgregarCopia()">Confirmar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Error Copia en Prestada -->
<div class="modal fade" id="modalErrorEliminacion" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h5 class="modal-title text-white">⚠️ No se puede eliminar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                No se puede eliminar una copia en préstamo activo. Por favor intenta más tarde.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Entendido</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Confirmar Eliminar Copia -->
<div class="modal fade" id="modalConfirmarEliminar" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h5 class="modal-title text-white">🗑️ Eliminar Copia</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                ¿Estás seguro de que deseas eliminar esta copia?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                <form method="POST" action="libros" style="display:inline;">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="idCopia" id="idCopiaEliminar" value="">
                    <input type="hidden" name="isbn" id="isbnEliminar" value="">
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function abrirModalAgregarCopia() {
        new bootstrap.Modal(document.getElementById('modalAgregarCopia')).show();
    }

    function confirmarAgregarCopia() {
        document.getElementById('formAgregarCopia').submit();
    }
    // Detectar si hay error y mostrar modal
    <c:if test="${not empty param.error}">
    document.addEventListener('DOMContentLoaded', function () {
        new bootstrap.Modal(document.getElementById('modalErrorEliminacion')).show();
    });
    </c:if>

    function abrirModalEliminarCopia(idCopia, isbn) {
        document.getElementById('idCopiaEliminar').value = idCopia;
        document.getElementById('isbnEliminar').value = isbn;
        new bootstrap.Modal(document.getElementById('modalConfirmarEliminar')).show();
    }
</script>