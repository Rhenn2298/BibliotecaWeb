<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">
    <div class="card shadow-lg">
        <div class="card-body p-5">
            <div class="row">
                <!-- IZQUIERDA: Portada -->
                <div class="col-md-3 text-center">
                    <div class="bg-light p-4 rounded" style="height: 300px; display: flex; align-items: center; justify-content: center;">
                        <div>
                            <div style="font-size: 4rem;">📖</div>
                            <small class="text-muted">Portada no disponible</small>
                        </div>
                    </div>
                </div>

                <!-- DERECHA: Información -->
                <div class="col-md-9">
                    <h1 class="mb-2"><c:out value="${libro.titulo}" /></h1>
                    <p class="text-muted mb-4" style="font-size: 1.1rem;">
                        por <strong><c:out value="${libro.autor}" /></strong>
                    </p>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <p><strong>ISBN:</strong> <code><c:out value="${libro.isbn}" /></code></p>
                            <p><strong>Género:</strong> <span class="badge bg-info"><c:out value="${libro.genero}" /></span></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Editorial:</strong> <c:out value="${libro.editorial}" /></p>
                            <p><strong>Año:</strong> <c:out value="${libro.yearPublicacion}" /></p>
                        </div>
                    </div>

                    <!-- Descripción -->
                    <hr>
                    <h5 class="mb-3">Sinopsis</h5>
                    <p class="text-justify">
                        Don Quijote es una novela escrita por Miguel de Cervantes. 
                        Publicada su primera parte en 1605 y su continuación en 1615, 
                        es una de las obras más destacadas de la literatura española y 
                        universal. Cuenta las aventuras de Alonso Quixano, un hidalgo que 
                        cree estar loco por leer novelas de caballerías...
                    </p>

                    <!-- Estado -->
                    <hr>
                    <c:if test="${disponibles > 0}">
                        <div class="alert alert-success">
                            <strong>✅ Disponible</strong> - <c:out value="${disponibles}" /> copia<c:if test="${disponibles != 1}">s</c:if> en stock
                            </div>
                    </c:if>
                    <c:if test="${disponibles == 0}">
                        <div class="alert alert-danger">
                            <strong>❌ No disponible</strong> - Sin copias en stock
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Acciones según rol -->
            <hr>
            <div class="mt-4">
                <c:if test="${sessionScope.usuario.rol == 'ESTUDIANTE'}">
                    <c:if test="${disponibles > 0}">
                        <button type="button" class="btn btn-lg btn-warning" 
                                data-bs-toggle="modal" 
                                data-bs-target="#modalSolicitar"
                                data-titulo="${libro.titulo}"
                                data-isbn="${libro.isbn}">
                            Solicitar
                        </button>
                    </c:if>
                    <c:if test="${disponibles == 0}">
                        <button class="btn btn-primary btn-lg" disabled>📋 No disponible</button>
                    </c:if>
                </c:if>
                <c:if test="${sessionScope.rol == 'ADMIN'}">
                    <a href="libros?accion=formulario&id=${libro.isbn}" class="btn btn-warning btn-lg">✏️ Editar</a>
                </c:if>
                <a href="libros" class="btn btn-secondary btn-lg">Cancelar</a>
            </div>
        </div>
    </div>
    <!-- Modal Confirmar Solicitud -->
    <div class="modal fade" id="modalSolicitar" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-white">Confirmar Solicitud</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    ¿Deseas solicitar "<span id="tituloLibro"></span>"?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <form method="POST" action="prestamos" style="display: inline;">
                        <input type="hidden" name="accion" value="crear">
                        <input type="hidden" name="isbn" id="isbnLibro" value="">
                        <button type="submit" class="btn btn-sm btn-warning">Solicitar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('modalSolicitar').addEventListener('show.bs.modal', function (e) {
            const btn = e.relatedTarget;
            document.getElementById('tituloLibro').textContent = btn.getAttribute('data-titulo');
            document.getElementById('isbnLibro').value = btn.getAttribute('data-isbn');
        });
    </script>
</div>