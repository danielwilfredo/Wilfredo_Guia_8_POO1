<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='webjars/materialize/0.97.3/dist/css/materialize.min.css'>
            <script type="text/javascript" src="webjars/jquery/2.1.4/jquery.min.js"></script>
            <script type="text/javascript" src="webjars/materialize/0.97.3/dist/js/materialize.min.js"></script>
        <title>Mantenimiento Equipos</title>
    </head>
    <body>
    <div class="container">
      <div class="row">
        <div class="col l12 s12 m12">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Seleccione mantenimiento:</span>
                 <ul>
                     <li><h2><a href="index.jsp"><h4>Mantenimiento Equipos</h4></a></h2></li>
                   <li><h2><a href="jugadores.jsp"><h4>Mantenimiento Jugadores</h4></a></h2></li>
                </ul>
            </div>
          </div>
        </div>
      </div>
        
        
        
    <div class="row">
        <div class="col l12 s12 m12">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Ingresar Equipos</span>
              <h1>${mensAler}</h1>
        <form method="POST" action="EquiposServ" name="Demo">
            <input hidden type="text" name="codi2" id="codi2" value="${codi}"/><br/>
                <h5>Codigo equipo</h5>
            <input disabled class="white-text" type="text" name="codi" id="codi" value="${codi}"/><br/>
                <h5>Nombre equipo</h5>
            <input type="text" name="nomb" id="nomb" value="${nomb}"/><br/>
                <h5>Descripcion</h5>
            <input type="text" name="desc" id="desc" value="${desc}"/><br/><br/>
                <div class="file-field input-field">
                    <div class="btn">
                        <span>Imagen</span>
                        <input type="file" name="foto" id="foto">
                    </div>
                        <div class="file-path-wrapper">
                          <input class="file-path validate" type="text">
                        </div>
                
                </div>
                <div><img src='data:image/*;base64,$row[foto]' class='materialboxed' width='100px' height='100px'/><div>
        </form>
          </div>
            <div class="card-action">
             <input class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Guardar"/>
             <input class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Modificar"/>
            </div>
          </div>
        </div>
      </div>   
    
         <form method="POST" action="EquiposServ" name="Tabla">                                                                                  
       <div class="row">
        <div class="col l12 s12 m12">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
                <span class="card-title"><center>Equipos</center></span>
              <table border="1">
                <tr>
                    <th>Cons</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                </tr>
                <%
                 for(Equipos temp : new EquiposCtrl().consTodo())
                 {
                %>     
                <tr>
                    <td><input id="<%=temp.getCodiEqui()%>" name="codiEquiRadi" type="radio" value="<%=temp.getCodiEqui()%>"/>
                     <label for="<%=temp.getCodiEqui()%>"></label></td>
                    <td><%=temp.getNombreEqui()%></td>
                    <td><%=temp.getDescEqui                                        ()%></td>
                </tr>
                <%
                 }
                %>
            </table>
            </div>
            <div class="card-action">
            <input class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Consultar"/>
            <input class="btn waves-effect waves-light" type="submit" name="btnEqui" value="Eliminar"/>
            </div>
          </div>
        </div>
      </div>
         </form>
    </div>
    </body>
    
</html>
