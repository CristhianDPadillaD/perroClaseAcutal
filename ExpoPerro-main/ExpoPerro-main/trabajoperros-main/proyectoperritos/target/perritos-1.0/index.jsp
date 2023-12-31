<%-- 
    Document   : index
    Created on : 20/09/2023, 10:56:10 a. m.
    Author     : Grupo 7
--%>

<%@page import="java.io.IOException"%>
<%@include file="temps/header.jsp" %>
       
   <!-- Imagen de encabezado con la clase "PerroBandera" -->

   <image  class= "PerroBandera" src="./img/perro.jpg" >
    <div class="row">
    <div class="col">
     <div class="card">
        <div class="card-body" >

   <!-- Formulario para ingresar información sobre un perro, enctype para subir arhcivos-->

   <form action="SvPerro" method="POST" enctype="multipart/form-data">

   <!-- Título del formulario -->
                <div class="container text-center">
                 <legend>Ingresar Perro </legend>
                  </div>
    <!-- Campo para ingresar el nombre del perro -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Nombre</span>
                        <input type="text" class="form-control" name="nombre"  placeholder="Nombre" aria-label="Username" aria-describedby="basic-addon1" required="true">
                   </div>
     <!-- Campo para ingresar la raza del perro -->
                     <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Raza</span>
                        <input type="text" class="form-control" name="raza"  placeholder="Nombre" aria-label="Username" aria-describedby="basic-addon1" required="true">
                   </div>
       <!-- Campo para ingresar la URL de la foto del perro -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Foto</span>
                        <input type="file" class="form-control" name="foto"  placeholder="url foto" aria-label="Username" aria-describedby="basic-addon1" required="true">
                   </div>
        <!-- desplegable para asignar puntos a un  perro -->
                    <select class="form-select" aria-label="Default select example" name="punto" required="true" >
                        <option selected>Puntos</option>
                        <option value="1">Uno</option>
                        <option value="2">Dos</option>
                        <option value="3">Tres</option>
                        <option value="4">Cuatro</option>
                        <option value="5">Cinco</option>
                        <option value="6">Seis</option>
                        <option value="7">Seite</option>
                        <option value="8">Ocho</option>
                        <option value="9">Nueve</option>
                        <option value="10">Diez</option>
                      </select>
                <br>
     <!-- Campo para ingresar la edad del perro -->
                        <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Edad</span>
                        <input type="number" class="form-control" name="edad"  placeholder="Numero" aria-label="Username" aria-describedby="basic-addon1" required="true">
                        </div> 

      <!-- Botón para enviar el formulario -->          
                 <div class="mb-3">
                         <input type="submit" value="Insertar Perro" class="btn btn-primary">
                   </div>
            </form>
             </div>
           </div>
        </div>
    <div class="col">
             <div class="card">
     <div class="card-body">

        <!-- Tabla para mostrar los datos de los perros -->
          <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Raza</th>
                            <th>Foto</th>
                            <th>Puntos</th>
                            <th>Edad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                  <tbody>
              <%
            
            ArrayList <perro> misPerros = null;
            // Obtener la ruta real del archivo de datos
            String dataPath = application.getRealPath("/Data/datosperros.ser");
            
            // Repetimos el proceso de carga de datos porque:
            // Si invocas directamente la página JSP de listar videos, el request no tiene el atributo que estás buscando
            // Es nulo, de ahí que te dé ese error. @RubioRic (Stack Overflow en español)
            
            File archivo = new File(dataPath);
          try {
                if (archivo.exists()) {
                    FileInputStream fis = new FileInputStream(dataPath);
                    ObjectInputStream ois = new ObjectInputStream(fis);
                    misPerros = (ArrayList<perro>) ois.readObject();
                    ois.close();
                    System.out.println("Datos de perros cargados exitosamente desde: " + dataPath);
                }
                } catch (IOException e) {
                    e.printStackTrace();
                    // Manejar el error aquí, por ejemplo, registrándolo o tomando medidas adecuadas.
                }

            
            // Obtener array list de la solicitud
            // Realizamos un cambios de out.print a strong para que la interfaz se adapte mas flexiblemnte
            // Pero respetamos la logica de Java
            
             if (misPerros != null) {
                System.out.println("Se cargaron " + misPerros.size() + " perros exitosamente añadidos");
                for (perro miperro : misPerros) {
                
        %>
   
        <!--  -->
                        <tr>
                            <td><%= miperro .getNombre() %></td>
                            <td><%= miperro .getRaza() %></td>
                            <td><%= miperro .getImagen()%></td>
                            <td><%= miperro .getPuntos() %></td>
                            <td><%= miperro .getEdad() %></td>
                            
                            <td>
                                <a href="SvPerro? id=<%= miperro.getNombre()%>"></a>
                                
                            </td>
                             <td>  <div class="btn-group me-2" role="group" aria-label="First group">
                                     <button type="button" class="btn btn-secondary"><i class="fa-solid fa-pen"></i></button>
                                    <button type="button" class="btn btn-secondary"><i class="fa-solid fa-eraser"></i></button>
                                  </div></td>
                        </tr>
           <%
                }
            } else {
                out.print("No hay Perros disponibles.");
            }
         %>
                    </tbody>
                </table>
     </div>
   </div>
    </div>
    </div>
                    
                    
                    
         <div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<%@include file="temps/footer.jsp" %>
