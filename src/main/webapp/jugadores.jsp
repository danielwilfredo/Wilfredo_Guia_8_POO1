<%-- 
    Document   : jugadores
    Created on : 03-19-2017, 05:58:26 PM
    Author     : DanielWilfredo
--%>

<%@page import="java.util.Base64"%>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='webjars/materialize/0.97.3/dist/css/materialize.min.css'>
            <script type="text/javascript" src="webjars/jquery/2.1.4/jquery.min.js"></script>
            <script type="text/javascript" src="webjars/materialize/0.97.3/dist/js/materialize.min.js"></script>
        <title>Mantenimiento Jugadores</title>
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
            
        <form method="POST" action="JugadoresServ" name="Demo" enctype="multipart/form-data">
                  <!--Importante agregarle el enctype"multipart/form-data"-->
          <div class="row">
        <div class="col l12 m12 s12">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Agregar Jugadores</span>
              <h1>${mensAler}</h1>
        <input hidden="" type="text" name="codiJuga" id="codiJuga" value="${codiJuga}">
        <h5>Codigo jugador</h5>
        <input disabled type="text" value="${codiJuga}" class="white-text">
         <h5>Nombre jugador</h5>
        <input type="text" name="nombJuga" id="nombJuga" value="${nombJuga}">
         <h5>Edad</h5>
        <input type="text" name="edadJuga" id="edadJuga" value="${edadJuga}">
         <h5>Altura</h5>
        <input type="text" name="altuJuga" id="altuJuga" value="${altuJuga}">
        <h5>Peso</h5>
        <input type="text" name="pesoJuga" id="pesoJuga" value="${pesoJuga}">
        <h5>Equipo</h5>
        <select id="cmbEqui" name="cmbEqui" >
      <option value="" disabled selected>Seleccione un equipo</option>
       <%
                for(Jugadores temp: new JugadoresCtrl().consEqui())
               
                { 
                    int id=-1;
                   if (request.getAttribute("cmbEqui") != null)
                   {                       
                        id =(Integer)request.getAttribute("cmbEqui");
                   }                      
                   
                    if(temp.getCodiEqui() == id)
                    {
                 %>
                        <option value="<%=temp.getCodiEqui()%>" SELECTED><%=temp.getNombEqui()%></option>;
                
               
                <%}
                    else
                    {
                 %>
                        <option value="<%=temp.getCodiEqui()%>" ><%=temp.getNombEqui()%></option>;
                
               
                <%}
                }
                %>
     
    </select>
                <div class="file-field input-field">
                    <div class="btn">
                        <span>Imagen</span>
                        <input type="file" name="foto" id="foto" required />
                    </div>
                        <div class="file-path-wrapper">
                          <input class="file-path validate" name="foto" type="text" placeholder='1200x1200 máx., 2MB máx., PNG/JPG/GIF'>
                        </div>
                
                </div>
                <div><img src='data:image/*;base64,$row[foto]' class='materialboxed' width='100px' height='100px'/><div>
            </div>
            <div class="card-action">
             <input class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Guardar"/>
             <input class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Modificar"/>
            </div>
          </div>
        </div>
   </div>       
         </form>
       
        <form method="POST" action="JugadoresServ" name="Demo">
                     
         <!--Empieza la tabla de jugadores-->
        
          <div class="row">
        <div class="col l12 m12 s12 ">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Jugadores</span>
                <table border="1">
                <tr>
                    <th>Cons</th>
                    <th>Nombre</th>
                    <th>Edad</th>
                    <th>Altura</th>
                    <th>Peso</th>
                    <th>Equipo</th>
                    <th>Imagen Jugador</th>
                </tr>
                 <%
                 for(Jugadores temp : new JugadoresCtrl().consTodo())
                     //Foreach para llenar los datos de la tabla jugadores
                 {   byte[] img = temp.getImgJuga();
                     String imgConv = Base64.getEncoder().encodeToString(img);
                %>   
               
                <tr>
                    <td><input id="<%=temp.getCodiJuga()%>" type="radio" name="codiJugaRadi" value="<%=temp.getCodiJuga()%>">
                        <label for="<%=temp.getCodiJuga()%>"></label></td>
                    <td><%=temp.getNombJuga()%></td>
                    <td><%=temp.getEdadJuga()%></td>
                    <td><%=temp.getAltuJuga()%></td>
                    <td><%=temp.getPesoJuga()%></td>
                    <td><%=temp.getNombEqui()%></td>
                    <td><img src="data:image/*;base64,<%=imgConv%>" class="materialboxed" width="100" height="100"></td>
                    
                </tr>
                <%
                 }
                %>
                    </table>
            </div>
            <div class="card-action">
            <input class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Consultar"/>
            <input class="btn waves-effect waves-light" type="submit" name="btnJuga" value="Eliminar"/>
            </div>
          </div>
        </div>
   </div>

        </form>

    </body>
    <script>
       $(document).ready(function() {
    $('select').material_select();
  }); 
    </script>
      
    </div>
</html>
