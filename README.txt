# 📚 Biblioteca Digital UNTEC 

## Tecnologías Utilizadas:

- Java EE
- Jakarta Servlet
- JSP 
- JSTL
- JDBC
- MySQL
- Apache Tomcat 10.1.52
- Bootstrap 5
- Maven
- JDK 21

---

## Descripción del Proyecto

Sistema web desarrollado en Java EE para gestionar la biblioteca digital de la Universidad UNTEC.  
El proyecto implementa el patrón de diseño MVC con acceso a base de datos mediante el patrón DAO,  
gestión de sesiones de usuario, vistas dinámicas con JSP y JSTL, y despliegue en Apache Tomcat.  
Permite a estudiantes consultar el catálogo y solicitar préstamos, y a administradores gestionar libros,  
copias y el ciclo completo de préstamos.

---

## Descripción General

La Biblioteca Digital UNTEC es un sistema de gestión web que permite a los usuarios interactuar  
con el catálogo de libros de forma online.  

El sistema contempla dos tipos de usuario:
- Estudiantes  
- Administradores  

Los estudiantes pueden consultar el catálogo disponible y solicitar préstamos de libros.  
Los administradores gestionan el catálogo completo y administran el ciclo de vida de cada préstamo.

Cada libro puede tener múltiples copias físicas. Cuando un estudiante solicita un libro,  
el sistema asigna automáticamente una copia disponible, permitiendo múltiples préstamos simultáneos  
del mismo título si existen copias.

### Estados del préstamo:
- **SOLICITADO**  
- **ENTREGADO** (con vencimiento de 2 meses)  
- **VENCIDO**  
- **DEVUELTO**

---

## Funcionalidades Principales

### 🔐 Autenticación
- Inicio de sesión  
![Login](src/docs/img/presentacion/Login.PNG)

- Cerrar sesión  
![Cerrar Sesión](src/docs/img/presentacion/CerrarSesion.PNG)

---

### 👤 Estudiante

- Consulta del catálogo  
![Catálogo](src/docs/img/presentacion/Catalogo.PNG)

- Detalle de libro  
![Detalle Libro](src/docs/img/presentacion/DetalleLibro.PNG)

- Solicitud de préstamo  
![Solicitud Confirmación](src/docs/img/presentacion/solicitudConfirmacion.PNG)

- Mis préstamos  
![Mis Préstamos](src/docs/img/presentacion/MisPrestamos.PNG)

---

### 🛠️ Administrador

- Gestión de libros  
![Libros](src/docs/img/presentacion/Libros.PNG)

- Agregar libro  
![Agregar Libro](src/docs/img/presentacion/AgregarLibro.PNG)

- Editar libro  
![Editar Libro](src/docs/img/presentacion/EditarLibro.PNG)

- Gestión de copias  
![Copias](src/docs/img/presentacion/Copias.PNG)

- Gestión de préstamos por estado  

**Solicitados**  
![Préstamos Solicitados](src/docs/img/presentacion/PrestamosSol.PNG)

**Entregados**  
![Préstamos Entregados](src/docs/img/presentacion/PrestamosEnt.PNG)

**Vencidos**  
![Préstamos Vencidos](src/docs/img/presentacion/PrestamosVen.PNG)

**Devueltos**  
![Préstamos Devueltos](src/docs/img/presentacion/PrestamosDev.PNG)

---

## Credenciales de Prueba

### Administrador
- Usuario: `11565421-1`  
- Contraseña: `carla2024`

### Estudiante
- Usuario: `19876543-2`  
- Contraseña: `sumac456`

---

## Base de Datos

Los archivos DDL y DML se encuentran en:

```
src/docs/sql
```

### Diagrama ER  
![Diagrama ER](src/docs/img/sql/DiagramaER.PNG)

### Tablas  

- Copias  
![Tabla Copias](src/docs/img/sql/TablaCopias.PNG)

- Libros  
![Tabla Libros](src/docs/img/sql/TablaLibros.PNG)

- Préstamos  
![Tabla Préstamos](src/docs/img/sql/TablaPrestamos.PNG)

- Usuarios  
![Tabla Usuarios](src/docs/img/sql/TablaUsuarios.PNG)
