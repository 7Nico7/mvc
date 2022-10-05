<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="row">
    <div class="col-md-1">
    </div>    
    <div class="col-md-5">
      <div class="row">
      <div class="col-lg-3 text-center">
        <a href='?page=adm-bienes' ><img src='resources/img/lista.png' class="bd-placeholder-img rounded-circle" width="90" height="90" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140" ></a>
        <h6>Bienes</h6>
      </div>
      <div class="col-lg-3  text-center">
        <a href='?page=adm-medidores'><img src='resources/img/medidor.jpg' class="bd-placeholder-img rounded-circle" width="90" height="90" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140" ></a>
        <h6>Medidores CFE</h6>        
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-3  text-center">
        <a href='?page=adm-vehiculos' ><img src='resources/img/vehiculo.png' class="bd-placeholder-img rounded-circle" width="90" height="90" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140" ></a>
        <h6>Vehiculos</h6>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-3  text-center">
        <a href='?page=adm-ubicaciones'><img src='resources/img/mapa.png' class="bd-placeholder-img rounded-circle" width="90" height="90" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140" ></a>
        <h6>Croquis</h6>        
      </div>
      <div class="col-lg-3  text-center">
        <a href='?page=adm-grafica'><img src='resources/img/grafica.png' class="bd-placeholder-img rounded-circle" width="90" height="90" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140" ></a>
        <h6>Graficas</h6>        
      </div>
    <div class="col-lg-3  text-center">
        <a href='?page=adm-usuario' ><img src='resources/img/usuarios.png' class="bd-placeholder-img rounded-circle" width="90" height="90" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140" ></a>
        <h6>Usuarios</h6>        
      </div>
    </div>
  </div>
      <div class="col-md-5">
        <div class="row">
          <h3>Mantenimientos cercanos</h3>
          <div id="c_list">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Ultimo mantenimiento</th>
                                <th>Proximo mantenimiento</th>
                                <th>Dias faltantes</th>
                                <th>Accion</th>
                                 </tr>
                            </thead>
                            <tbody>
                                                        </tbody>
        </div>
      </div>
    </div><!-- /.row -->
    </body>
</html>
