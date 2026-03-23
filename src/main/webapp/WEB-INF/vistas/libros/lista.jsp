<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1>Catálogo de Libros</h1>
        <c:if test="${sessionScope.usuario.rol == 'ADMIN'}">
            <a href="libros?accion=formulario" 
               class="btn btn-warning btn-lg">➕ Agregar nuevo libro</a>
        </c:if>
    </div>
    <table class="table table-striped mt-4">
        <thead class="table-primary">
            <tr>
                <th>Título</th>
                <th>Autor</th>
                <th>ISBN</th>
                <th>Género</th>
                <th>Editorial</th>
                <th>Año</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="libro" items="${libros}">
                <tr>
                    <td><c:out value="${libro.titulo}" /></td>
                    <td><c:out value="${libro.autor}" /></td>
                    <td><c:out value="${libro.isbn}" /></td>
                    <td><span class="badge bg-info"><c:out value="${libro.genero}" /></span></td>
                    <td><c:out value="${libro.editorial}" /></td>
                    <td><c:out value="${libro.yearPublicacion}" /></td>
                    <td>
                        <c:if test="${sessionScope.usuario.rol == 'ESTUDIANTE'}">
                            <a href="libros?accion=detalle&id=${libro.isbn}" class="btn btn-sm btn-info">Ver</a>
                            


                        </c:if>
                        <c:if test="${sessionScope.usuario.rol == 'ADMIN'}">
                            <a href="libros?accion=detalle&id=${libro.isbn}" class="btn btn-sm btn-secondary">Ver</a>
                            <a href="libros?accion=formulario&id=${libro.isbn}" class="btn btn-sm btn-warning">Actualizar datos</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>