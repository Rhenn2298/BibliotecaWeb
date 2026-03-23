<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">
    <div class="card shadow-lg">
        <div class="card-header bg-dark text-white">
            <h3 class="mb-0">
                <c:if test="${param.id != null}">✏️ Editar Libro</c:if>
                <c:if test="${param.id == null}">➕ Agregar Nuevo Libro</c:if>
                </h3>
            </div>

            <div class="card-body p-4">
                <form id="formularioLibro" method="POST" action="libros">

                    <!-- ISBN -->
                    <div class="mb-3">
                        <label for="isbn" class="form-label">ISBN</label>
                        <input type="text" class="form-control" id="isbn" name="isbn" 
                               placeholder="100001CN01" 
                               value="${libro.isbn}"
                        required>
                </div>

                <!-- Título -->
                <div class="mb-3">
                    <label for="titulo" class="form-label">Título</label>
                    <input type="text" class="form-control" id="titulo" name="titulo" 
                           placeholder="Don Quijote" 
                           value="${libro.titulo}"
                           required>
                </div>

                <!-- Autor -->
                <div class="mb-3">
                    <label for="autor" class="form-label">Autor</label>
                    <input type="text" class="form-control" id="autor" name="autor" 
                           placeholder="Miguel de Cervantes" 
                           value="${libro.autor}"
                           required>
                </div>

                <!-- Editorial -->
                <div class="mb-3">
                    <label for="editorial" class="form-label">Editorial</label>
                    <input type="text" class="form-control" id="editorial" name="editorial" 
                           placeholder="Planeta" 
                           value="${libro.editorial}"
                           required>
                </div>

                <!-- Año Publicación -->
                <div class="mb-3">
                    <label for="año" class="form-label">Año de Publicación</label>
                    <input type="number" class="form-control" id="año" name="año" 
                           placeholder="2024" min="1450" max="2100" 
                           value="${libro.yearPublicacion}"
                           required>
                </div>

                <!-- Género -->
                <div class="mb-3">
                    <label for="genero" class="form-label">Género</label>
                    <select class="form-select" id="genero" name="genero" required>
                        <option value="">-- Selecciona un género --</option>
                        <option value="FICCION" <c:if test="${libro.genero == 'FICCION'}">selected</c:if>>Ficción</option>
                        <option value="NOVELA" <c:if test="${libro.genero == 'NOVELA'}">selected</c:if>>Novela</option>
                        <option value="CIENCIA" <c:if test="${libro.genero == 'CIENCIA'}">selected</c:if>>Ciencia</option>
                        <option value="HISTORIA" <c:if test="${libro.genero == 'HISTORIA'}">selected</c:if>>Historia</option>
                        <option value="FILOSOFIA" <c:if test="${libro.genero == 'FILOSOFIA'}">selected</c:if>>Filosofía</option>
                        <option value="DRAMA" <c:if test="${libro.genero == 'DRAMA'}">selected</c:if>>Drama</option>
                        <option value="AVENTURA" <c:if test="${libro.genero == 'AVENTURA'}">selected</c:if>>Aventura</option>
                        <option value="FANTASIA" <c:if test="${libro.genero == 'FANTASIA'}">selected</c:if>>Fantasía</option>
                        </select>
                    </div>

                    <!-- Cantidad de Copias -->
                    <div class="mb-4">
                        <label for="cantidad" class="form-label">Cantidad de Copias</label>
                        <input type="number" class="form-control" id="cantidad" name="cantidad" 
                               placeholder="5" min="1" 
                        <c:if test="${param.id != null}">
                            value="${cantidadCopias}" disabled readonly
                        </c:if>
                        <c:if test="${param.id == null}">
                            required
                        </c:if>>
                </div>

                <!-- Botones -->
                <div class="d-flex gap-2">
                    <button type="button" class="btn btn-warning btn-lg" onclick="abrirModalConfirmarLibro()">💾 Guardar</button>
                    <a href="libros" class="btn btn-secondary btn-lg" >Cancelar</a>
                    <c:if test="${param.id != null}">  
                        <a href="libros?accion=copias&id=${param.id}" 
                           class="btn btn-info btn-lg">📋 Administrar Copias</a>  
                    </c:if>      
                </div>

            </form>
        </div>
    </div>
</div>
<!-- Modal Confirmar Agregar o Actualizar Libro -->
<div class="modal fade" id="modalConfirmarLibro" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-dark">
                <h5 class="modal-title text-white" id="tituloModalLibro">Confirmar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body" id="mensajeModalLibro"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-warning" onclick="confirmarLibro()">Confirmar</button>
            </div>
        </div>
    </div>
</div>

<script>
function abrirModalConfirmarLibro() {
    const esNuevo = ${param.id == null ? 'true' : 'false'};
    
    if (esNuevo) {
        document.getElementById('tituloModalLibro').textContent = '➕ Agregar Nuevo Libro';
        document.getElementById('mensajeModalLibro').textContent = '¿Quieres confirmar este nuevo libro?';
    } else {
        document.getElementById('tituloModalLibro').textContent = '✏️ Editar Libro';
        document.getElementById('mensajeModalLibro').textContent = '¿Quieres confirmar los nuevos datos de este libro?';
    }
    
    new bootstrap.Modal(document.getElementById('modalConfirmarLibro')).show();
}

function confirmarLibro() {
    document.getElementById('formularioLibro').submit();
}
</script>