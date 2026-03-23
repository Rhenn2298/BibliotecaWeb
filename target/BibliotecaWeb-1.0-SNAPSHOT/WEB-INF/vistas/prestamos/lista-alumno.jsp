<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">
    <h1>Mis Préstamos</h1>

    <table class="table table-striped mt-4">
        <thead class="table-primary">
            <tr>
                <th>Título</th>
                <th>Autor</th>
                <th>Fecha Entrega</th>
                <th>Fecha Vencimiento</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="prestamo" items="${prestamos}">
                <tr <c:if test="${prestamo.estado == 'VENCIDO'}">class="table-danger"</c:if>>
                    <td><c:out value="${prestamo.libro.titulo}" /></td>
                    <td><c:out value="${prestamo.libro.autor}" /></td>
                    <td>
                        <c:if test="${prestamo.fechaEntrega != null}">
                            <c:out value="${prestamo.fechaEntrega}" />
                        </c:if>
                        <c:if test="${prestamo.fechaEntrega == null}">
                            <span class="text-muted">-</span>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${prestamo.estado == 'VENCIDO'}">
                            <span class="text-danger"><c:out value="${prestamo.fechaVencimiento}" /></span>
                        </c:if>
                        <c:if test="${prestamo.estado != 'VENCIDO'}">
                            <c:out value="${prestamo.fechaVencimiento}" />
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${prestamo.estado == 'SOLICITADO'}">
                            <span class="badge bg-warning">SOLICITADO</span>
                        </c:if>
                        <c:if test="${prestamo.estado == 'ENTREGADO'}">
                            <span class="badge bg-success">ENTREGADO</span>
                        </c:if>
                        <c:if test="${prestamo.estado == 'VENCIDO'}">
                            <span class="badge bg-danger">VENCIDO</span>
                        </c:if>
                        <c:if test="${prestamo.estado == 'DEVUELTO'}">
                            <span class="badge bg-info">DEVUELTO</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>