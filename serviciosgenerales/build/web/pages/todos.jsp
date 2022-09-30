<%
if(session.getAttribute("usuario") != null){
%>
<!DOCTYPE html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" type="text/css" href="pages/css/bootstrap.css">

    <!-- JavaScript Bundle with Popper -->
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
    
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" type="text/css" href="js/dataTable.responsive.js">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>




</head>   
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="navbarSupportedContent">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <a class="navbar-brand" href="#">CGMAIG</a>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="principal.jsp">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Bienes
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ControllerBienes?selecciono=todos">Todos</a></li>
                            <li><a class="dropdown-item" href="ControllerBienes?selecciono=climas">Climas</a></li>
                            <li><a class="dropdown-item" href="ControllerBienes?selecciono=extintores">Extintores</a></li>
                            <li><a class="dropdown-item" href="ControllerBienes?selecciono=impresoras">Impresoras</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            CFE
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ControllerBienes?selecciono=todos">Medidores</a></li>
                            <li><a class="dropdown-item" href="ControllerBienes?selecciono=climas">Recibos</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Vehiculos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ControllerVehiculos?selecciono=vehiculos">Vehiculos</a></li>
                            <li><a class="dropdown-item" href="ControllerVehiculos?selecciono=gasolina">Carga de Gasolina</a></li>
                            <li><a class="dropdown-item" href="ControllerVehiculos?selecciono=servicios">Servicios</a></li>
                        </ul>
                    </li>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ControllerMantenimiento?selecciono=mantenimiento">Mantenimiento</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ControllerUsuarios">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ControllerPerfil">Perfil</a>
                    </li>
                </ul>
                <form action="Validar" method="POST">
                    <span class="text-white">Bienvenido ${usuario.nombre}</span>
                    <button name="accion" value="salir" align="center"  class="btn btn-danger ml-2">Cerrar Sesion</button>
                </form>
            </div>
        </div>
    </nav>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-16">
                <div class="card">
                    <div class="card-header text-right">
                        <a href="?page=adm-bienes&filtro=extintor" class="btn btn-sm btn-primary">Extintores</a>
                        <a href='?page=adm-bienes&filtro=climas' class="btn btn-sm btn-primary">Climas</a>
                        <a href='?page=adm-bienes&filtro=impresoras' class="btn btn-sm btn-primary">Impresoras</a> 
                        <a href='?page=adm-bienes' class="btn btn-sm btn-primary">Todos</a>
                        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Nuevo</button>
                        <a class="btn btn-sm btn-primary" href='?page=adm-pdf-bienes'target="_blank">Imprimir lista</a> 
                    </div>   
                    <div class=modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <!-- Nav tabs -->
                                <ul style="background-color:rgba(179,142,93,1)" class=" nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a style="color:black" class="nav-link active" id="objeto-tab" data-toggle="tab" href="#objeto" role="tab" aria-controls="objeto" aria-selected="true">Objeto</a>
                                    </li>
                                    <li class="nav-item">
                                        <a style="color:black" class="nav-link" id="ubicacion-tab" data-toggle="tab" href="#ubicacion" role="tab" aria-controls="ubicacion" aria-selected="false">Ubicaci?n</a>
                                    </li>
                                    <li class="nav-item">
                                        <a style="color:black" class="nav-link" id="mantenimiento-tab" data-toggle="tab" href="#mantenimiento" role="tab" aria-controls="mantenimiento" aria-selected="false">Mantenimiento</a>
                                    </li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="objeto" role="tabpanel" aria-labelledby="objeto-tab">
                                        <div class="card-body">
                                            <form method="POST">
                                                <div class="form-row">
                                                    <div class="form-group col-md-3">
                                                        <label>Descripci?n</label>
                                                        <input class="form-control" type="text" required="required" name='objetoDescripcion' id="descripcion"/>
                                                    </div>
                                                    <div class="form-group col-md-3">
                                                        <label>Marca</label>
                                                        <input class="form-control" type="text" required="required" name='marca' id='marca'/>
                                                    </div>
                                                    <div class="form-group col-md-3">
                                                        <label>Modelo</label>
                                                        <input class="form-control" type="text" required="required" id='modelo'name='modelo'/>

                                                    </div>
                                                    <div class="form-group col-md-3">
                                                        <label>Numero de serie</label>
                                                        <input class="form-control" type="text" required="required" name='serie' id="serie"/>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-3">
                                                        <label>Numero de inventario</label>
                                                        <input class="form-control" type="text" required="required" name='inventario' id="inventario"/>
                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label>Tipo bien</label>
                                                        <select name='tipoBien' id='tipoBien' class='form-control' required="required">
                                                            <option value='1' >Tipo</option>
                                                            <option value='climas' >Clima</option>
                                                            <option value='extintor' >Extintor</option>
                                                            <option value='impresora' >Impresora</option>
                                                        </select>                            
                                                    </div> 
                                                    <div class="form-group col-md-3">
                                                        <label>Fecha de Factura</label>
                                                        <input class="form-control" type="date" required="required" name='fechaFactura' id="fechaFactura"/>
                                                    </div>     
                                                    <div class="form-group col-md-3">
                                                        <label>Fecha de alta al Sistema</label>
                                                        <input class="form-control" type="date" required="required" name='fechaAltaSistema' id="fechaAltaSistema"/>
                                                    </div>  
                                                </div>
                                                <div class="form-row">

                                                    <div class="form-group col-md-2">
                                                        <label>Status</label>
                                                        <select align="center" name='status' id="status" class="form-control" required="required">
                                                            <option value="activo">Activo</option>
                                                            <option value=inactivo" >Inactivo</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cancelar</button>
                                                <button onclick="enviar()" class="btn btn-primary">Guardar</button>

                                            </form> 
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="ubicacion" role="tabpanel" aria-labelledby="ubicacion-tab">
                                        <form action="ControllerBienes" method="POST">
                                            <div class="card-body">

                                                <div class="form-row">
                                                    <div class="form-group col-md-3">
                                                        <label>Ubicaci?n</label>
                                                        <input class="form-control" type="text" required="required" name='ubicacion' id="ubicacion"/>
                                                    </div>
                                                    <div class="form-group col-md-3">
                                                        <label>Responsable</label>
                                                        <input class="form-control" type="text" required="required" name='responsable' id="responsable"/>
                                                    </div>
                                                    <div class="form-group col-md-3">
                                                        <label>Dependecia</label>
                                                        <input class="form-control" type="text" required="required" id='dependencia' name='dependencia'/>

                                                    </div>
                                                    <div class="form-group col-md-3">
                                                        <label>Departemento</label>
                                                        <input class="form-control" type="text" required="required" name='departamento' id="departamento"/>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>Observaciones</label>
                                                        <textarea class="form-control" id="ubicacionObservacion" name="ubicacionObservacion"></textarea>
                                                    </div>
                                                    <div class="form-group col-md-5">
                                                        <label>?rea</label>
                                                        <input class="form-control" type="text" name='area' id="area"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </form> 
                                    </div>
                                    <div class="tab-pane fade" id="mantenimiento" role="tabpanel" aria-labelledby="mantenimiento-tab">
                                        <div class="card-body">
                                            <form action="ControllerBienes" method="POST">

                                                <div class="form-row">
                                                    <div class="form-group col-md-3">
                                                        <label>Fecha de Mantenimiento</label>
                                                        <input class="form-control" type="date" required="required" name='fechaMantenimiento' value=''/>
                                                    </div>  
                                                    <div class="form-group col-md-4">
                                                        <label>Tipo de Mantenimiento</label>
                                                        <select name='tipoMantenimiento' id='' class='form-control'>
                                                            <option value='1' >Predictivo</option>
                                                            <option value='2' >Preventivo</option>
                                                            <option value='3' >Correctivo</option>
                                                        </select>                            
                                                    </div> 
                                                    <div class="form-group col-md-3">
                                                        <label>Falla comun</label>
                                                        <select name='fallas' id='' class='form-control'>
                                                            <option value='1' >No enfr?a</option>
                                                            <option value='2' >Falta de gas</option>
                                                            <option value='3' >Fuga</option>
                                                            <option value='4' >No enciende</option>
                                                        </select>                            
                                                    </div> 
                                                </div>
                                                <div class="form-row">

                                                    <div class="form-group col-md-8">
                                                        <label>Observaciones de Mantenimiento</label>
                                                        <textarea class="form-control" id="mantenimientObservacion"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleFormControlFile1">Subir video</label>
                                                    <input style="background-color:rgba(179,142,93,1)" type="file" class="form-control-file" id="exampleFormControlFile1">
                                                </div>
                                                <div align="center">
                                                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cancelar</button>
                                                    <button name="guardarBien" value="objeto" class="btn btn-primary">Guardar</button>
                                                </div>
                                            </form>                                                 
                                        </div>
                                    </div>
                                </div>
                                <!--                                 
                                <div class="card-header">
                                    <h4 style="color:white">Informaci?n del Objeto</h4>
                                </div> 
                                -->
                            </div>
                        </div>
                    </div>
                </div>

            </div>
               <div class="card-body">
                    <h5>${data[1]}</h5>
                    <table id="example" class="table table-bordered display nowrap" width="100%"></table>
                </div>

        </div>
    </div>

    <script>
        $('#myTab a').on('click', function (e) {
            e.preventDefault(),
                    $(this).tab('show');
        });
    </script>

    <script>
        function enviar() {
            var descripcion = document.getElementById("descripcion").value;
            var marca = document.getElementById("marca").value;
            var modelo = document.getElementById("modelo").value;
            var serie = document.getElementById("serie").value;
            var inventario = document.getElementById("inventario").value;
            var tipoBien = document.getElementById("tipoBien").value;
            var fechaFactura = document.getElementById("fechaFactura").value;
            var fechaAltaSistema = document.getElementById("fechaAltaSistema").value;
            var status = document.getElementById("status").value;
            var datos = "descripcion=" + descripcion + "&marca=" + marca + "&modelo=" + modelo + "&serie=" + serie + "&inventario=" + inventario + "&tipoBien=" + tipoBien + "&fechaFactura=" + fechaFactura + "&fechaAltaSistema=" + fechaAltaSistema + "&status=" + status;
            var respuesta;
            $.ajax({
                type: "post",
                url: "ControllerBienes",
                data: datos,
                success: function (resp) {
                    console.log("LA RESPUESTA DEL SERVIDOR " + resp);
                }
            });
            return false;
        }
    </script>

    <script>
/*
        $(document).ready(function () {
            $('#example').DataTable({
                data: data,
                columns: [
                    {data: 'cve_bienes'},
                    {data: 'marca'},
                    {data: 'modelo'},
                    {data: 'fecha_instalacion'},
                    {data: 'num_inventario'},
                    {data: 'status'}
                ]
            });
        });*/


            
            
    $(document).ready(function() {
        $('#example').DataTable({
            responsive: true,
            ajax: {
                url: 'ControllerBienes?selecciono=tabla',
                dataSrc: ''
            },
            columns: [
                {data: 'cve_bienes'},
                {data: 'marca'},
                {data: 'modelo'},
                {data: 'fecha_instalacion'},
                {data: 'num_inventario'},
                {data: 'status'}
            ]
            });
    } );  
 
    </script>

    <div>
        <section class="conten">
        </section>
    </div>
    <footer class="site-footer">
        <div class="container" align="center">
            <div class="row pt-2 mt-2 text-center">
                <div class="col-md-12">
                    <img alt="firma blanco.png" height="173" src="resources/img/firma_blanco.png" width="100">
                </div>

                <div class="col-md-12"><br>
                    <p id="blanco"> Copyright &copy;2022</p>
                </div>
                <div class="col-md-12">
                    <strong>Coordinaci?n General de Modernizaci?n Administrativa e Innovaci?n Gubernamental</strong>
                </div>

            </div>

        </div>
    </footer>
    <style type="text/css">
        .conten {
            background-color: #ffffff;
            margin: 1em;
            min-height: 10vh;
            padding: 1em;
        }
        .site-footer {
            padding: 1em 0;
            background: #2c2f33;
        }
        @media (min-width: 768px) {
            .site-footer {
                padding: 1em 0;
            }
        }

        #footer {
            background-color: #2d2d2d;
            padding: 11px 0;
            color: #ffffff;
            text-align: center;
        }
        #blanco{

            color: #ffffff;
        }

    </style>

</body>
</html>
<%
}else{
    response.sendRedirect("/serviciosgenerales/principal.jsp");
}
%>