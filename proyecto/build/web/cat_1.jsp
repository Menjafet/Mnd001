<%-- 
    Document   : cat_1
    Created on : 11-abr-2019, 14:19:34
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
      <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul class="navegador"> 
            <img src="imagenes/ej.jpg" alt="Logo" title="Logo" id="logo" align="left"/>
            <li><a class="activo" href="A2.jsp">Inicio</a></li>
            <li><a href="#nuevo">Nuevo</a></li>

            <li class="drop"><a><span>Productos</span></a>
                <ul class="submenu">
                    <li><a href="cat_1.jsp">Categoria 1</a></li>

                    <li><a href="cat_1.jsp">Categoria 2</a></li>
                </ul>
            </li>

            <li><a href="#SobreNosotros">Sobre nosotros</a></li>


            <%
                if (model.usuario.isInicio()) {
            %>
            <li><a><%= model.usuario.getNombre()%></a></li>
            <li id="logout"><form action="logout"> <input type="submit" value="logout"/></form></li>
            <li><a href="#carrito">Carrito</a></li>

            <%            } else {
            %>
            <li><a href="faces/inicio_login.xhtml">login</a></li>
            <li><a href="faces/registrarse.xhtml">registrarse</a></li>
                <%                }
                %>



        </ul>

        <sql:setDataSource var="LADB" url="jdbc:derby://localhost:1527/a"  driver="org.apache.derby.jdbc.ClientDriver" user="a" password="a" />

        <sql:query var="lol" dataSource="${LADB}">
            SELECT * FROM A.ARTICULO where tipo='T1'
        </sql:query>


        <div class="contenido">
            <ul>

                <c:forEach var="nispe" items="${lol.rows}">
                    <form  action="el_arti">
                        <li > 
                            <img src="${nispe.img}" alt="" height="100" width="70"  />
                            <div class="bottom">${nispe.nombres}</div>
                            <input type="submit"  style=" background-color: #ffffff" value="ver" />
                            <input type="hidden" name="nombre" value="${nispe.nombres}" />
                            <input type="hidden" name="img" value="${nispe.img}" />
                            <input type="hidden" name="descripcion" value="${nispe.descripcion}" />
                            <input type="hidden" name="precio" value="${nispe.precio}" />
                            <input type="hidden" name="id" value="${nispe.id}" />
                        </li>
                    </form>
                </c:forEach>

            </ul>
        </div>   
        
    </body>
</html>