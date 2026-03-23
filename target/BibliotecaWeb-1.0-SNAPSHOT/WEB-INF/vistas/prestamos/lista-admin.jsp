<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">
    <h1>Gestión de Préstamos</h1>

    <!-- TABS -->
    <ul class="nav nav-tabs mt-4" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="solicitados-tab" data-bs-toggle="tab" data-bs-target="#solicitados" type="button" role="tab">
                Solicitados (<c:out value="${solicitados.size()}" />)
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="entregados-tab" data-bs-toggle="tab" data-bs-target="#entregados" type="button" role="tab">
                Entregados (<c:out value="${entregados.size()}" />)
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="vencidos-tab" data-bs-toggle="tab" data-bs-target="#vencidos" type="button" role="tab">
                Vencidos (<c:out value="${vencidos.size()}" />)
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="devueltos-tab" data-bs-toggle="tab" data-bs-target="#devueltos" type="button" role="tab">
                Devueltos (<c:out value="${devueltos.size()}" />)
            </button>
        </li>
    </ul>

    <!-- Secciones -->
    <div class="tab-content mt-3">

        <!-- seccion SOLICITADOS -->
        <div class="tab-pane fade show active" id="solicitados" role="tabpanel">
            <table class="table table-striped">
                <thead class="table-primary">
                    <tr>
                        <th>RUT</th>
                        <th>Nombre Alumno</th>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Fecha Solicitud</th>
                        <th>Fecha Vencimiento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prestamo" items="${solicitados}">
                        <tr>
                            <td><c:out value="${prestamo.usuario.rut}" /></td>
                            <td><c:out value="${prestamo.usuario.nombre}" /></td>
                            <td><c:out value="${prestamo.libro.titulo}" /></td>
                            <td><c:out value="${prestamo.libro.autor}" /></td>
                            <td><c:out value="${prestamo.fechaSolicitud}" /></td>
                            <td><c:out value="${prestamo.fechaVencimiento}" /></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-dark"
                                        data-bs-toggle="modal"
                                        data-bs-target="#modalEntregar"
                                        data-titulo="${prestamo.libro.titulo}"
                                        data-alumno="${prestamo.usuario.nombre}"
                                        data-fecha="${prestamo.fechaVencimiento}"
                                        data-idprestamo="${prestamo.idPrestamo}">
                                    Entregar
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- seccion ENTREGADOS -->
        <div class="tab-pane fade" id="entregados" role="tabpanel">
            <table class="table table-striped">
                <thead class="table-primary">
                    <tr>
                        <th>RUT</th>
                        <th>Nombre Alumno</th>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Fecha Entrega</th>
                        <th>Fecha Vencimiento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prestamo" items="${entregados}">
                        <tr>
                            <td><c:out value="${prestamo.usuario.rut}" /></td>
                            <td><c:out value="${prestamo.usuario.nombre}" /></td>
                            <td><c:out value="${prestamo.libro.titulo}" /></td>
                            <td><c:out value="${prestamo.libro.autor}" /></td>
                            <td><c:out value="${prestamo.fechaSolicitud}" /></td>
                            <td><c:out value="${prestamo.fechaVencimiento}" /></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-warning"
                                        data-bs-toggle="modal"
                                        data-bs-target="#modalDevolver"
                                        data-titulo="${prestamo.libro.titulo}"
                                        data-idprestamo="${prestamo.idPrestamo}"
                                        data-idcopia="${prestamo.idCopia}">
                                    Recibir devolución
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- seccion VENCIDOS -->
        <div class="tab-pane fade" id="vencidos" role="tabpanel">
            <table class="table table-striped">
                <thead class="table-danger">
                    <tr>
                        <th>RUT</th>
                        <th>Nombre Alumno</th>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Fecha Solicitud</th>
                        <th>Fecha Vencimiento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prestamo" items="${vencidos}">
                        <tr>
                            <td><c:out value="${prestamo.usuario.rut}" /></td>
                            <td><c:out value="${prestamo.usuario.nombre}" /></td>
                            <td><c:out value="${prestamo.libro.titulo}" /></td>
                            <td><c:out value="${prestamo.libro.autor}" /></td>
                            <td><c:out value="${prestamo.fechaSolicitud}" /></td>
                            <td><c:out value="${prestamo.fechaVencimiento}" /></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-warning"
                                        data-bs-toggle="modal"
                                        data-bs-target="#modalDevolver"
                                        data-titulo="${prestamo.libro.titulo}"
                                        data-idprestamo="${prestamo.idPrestamo}"
                                        data-idcopia="${prestamo.idCopia}">
                                    Recibir devolución
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- seccion DEVUELTOS -->
        <div class="tab-pane fade" id="devueltos" role="tabpanel">
            <table class="table table-striped">
                <thead class="table-danger">
                    <tr>
                        <th>RUT</th>
                        <th>Nombre Alumno</th>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Fecha Solicitud</th>
                        <th>Fecha Vencimiento</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prestamo" items="${devueltos}">
                        <tr>
                            <td><c:out value="${prestamo.usuario.rut}" /></td>
                            <td><c:out value="${prestamo.usuario.nombre}" /></td>
                            <td><c:out value="${prestamo.libro.titulo}" /></td>
                            <td><c:out value="${prestamo.libro.autor}" /></td>
                            <td><c:out value="${prestamo.fechaSolicitud}" /></td>
                            <td><c:out value="${prestamo.fechaVencimiento}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Entregar Libro -->
<div class="modal fade" id="modalEntregar" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-success">
                <h5 class="modal-title text-white">✅ Entregar Libro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Has entregado: <strong><span id="tituloEntrega"></span></strong></p>
                <p>Al alumno: <strong><span id="alumnoEntrega"></span></strong></p>
                <p>Fecha límite de entrega: <strong><span id="fechaEntrega"></span></strong></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                <form method="POST" action="prestamos" style="display:inline;">
                    <input type="hidden" name="accion" value="entregar">
                    <input type="hidden" name="idPrestamo" id="idPrestamoEntrega" value="">
                    <button type="submit" class="btn btn-success">Confirmar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal: Recibir Devolución -->
<div class="modal fade" id="modalDevolver" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h5 class="modal-title text-white">📚 Recibir Devolución</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                ¿Confirmas la devolución de <strong><span id="tituloDevolver"></span></strong>?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                <form method="POST" action="prestamos" style="display:inline;">
                    <input type="hidden" name="accion" value="devolver">
                    <input type="hidden" name="idPrestamo" id="idPrestamoDevolver" value="">
                    <input type="hidden" name="idCopia" id="idCopiaDevolver" value="">
                    <button type="submit" class="btn btn-info">Confirmar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById('modalEntregar').addEventListener('show.bs.modal', function (e) {
        const btn = e.relatedTarget;
        document.getElementById('tituloEntrega').textContent = btn.getAttribute('data-titulo');
        document.getElementById('alumnoEntrega').textContent = btn.getAttribute('data-alumno');
        document.getElementById('fechaEntrega').textContent = btn.getAttribute('data-fecha');
        document.getElementById('idPrestamoEntrega').value = btn.getAttribute('data-idprestamo');
    });
    document.getElementById('modalDevolver').addEventListener('show.bs.modal', function (e) {
        const btn = e.relatedTarget;
        document.getElementById('tituloDevolver').textContent = btn.getAttribute('data-titulo');
        document.getElementById('idPrestamoDevolver').value = btn.getAttribute('data-idprestamo');
        document.getElementById('idCopiaDevolver').value = btn.getAttribute('data-idcopia');
    });
</script>