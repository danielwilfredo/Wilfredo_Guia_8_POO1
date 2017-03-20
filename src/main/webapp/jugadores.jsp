<%-- 
    Document   : jugadores
    Created on : 03-19-2017, 05:58:26 PM
    Author     : DanielWilfredo
--%>

<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jugadores</title>
    </head>
    <body>
        <h1>Mantenimiento Jugadores</h1>
        <form method="POST" action="JugadoresServ" name="Demo">
        <h1>${mensAler}</h1>
        <input hidden="" type="text" name="codiJuga" id="codiJuga" value="${codi}">
        <h5>Codigo</h5>
        <input type="text" value="${codiJuga}">
         <h5>Nombre</h5>
        <input type="text" name="nombJuga" id="nombJuga" value="${nombJuga}">
         <h5>Edad</h5>
        <input type="text" name="edadJuga" id="edadJuga" value="${edadJuga}">
         <h5>Altura</h5>
        <input type="text" name="altuJuga" id="altuJuga" value="${altuJuga}">
        <h5>Peso</h5>
        <input type="text" name="pesoJuga" id="pesoJuga" value="${pesoJuga}">
        <h5>Equipo</h5>
        <SELECT NAME="cmbEqui" id="cmbEqui"> 
            <%
                for(Jugadores temp : new JugadoresCtrl().consEqui())
                {
                    
            %>
            <option values="<%=temp.getCodiEqui() %>"><%=temp.getNombEqui() %></option>
           <%
                            
                }
            %>
            
        </SELECT> <br><br>
         <input type="submit" name="btnJuga" value="Guardar"/>
         <input type="submit" name="btnJuga" value="Modificar"/>
         </form>
        <br>
        <!--Empieza la tabla de jugadores-->
        
        <form method="POST" action="JugadoresServ" name="Demo">
                       <table border="1">
                <tr>
                    <th>Cons</th>
                    <th>Nombre</th>
                    <th>Edad</th>
                    <th>Altura</th>
                    <th>Peso</th>
                    <th>Equipo</th>
                </tr>
                 <%
                 for(Jugadores temp : new JugadoresCtrl().consTodo())
                     //Foreach para llenar los datos de la tabla jugadores
                 {
                %>   
               
                <tr>
                    <td><input type="radio" name="codiJugaRadi" value="<%=temp.getCodiJuga()%>"></td>
                    <td><%=temp.getNombJuga()%></td>
                    <td><%=temp.getEdadJuga()%></td>
                    <td><%=temp.getAltuJuga()%></td>
                    <td><%=temp.getPesoJuga()%></td>
                    <td><%=temp.getNombEqui()%></td>
                </tr>
                <%
                 }
                %>
                    </table>
            <input type="submit" name="btnJuga" value="Consultar"/>
            <input type="submit" name="btnJuga" value="Eliminar"/>

        </form>

    </body>
</html>
