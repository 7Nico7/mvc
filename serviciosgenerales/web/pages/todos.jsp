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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.js"></script>



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
            <div class="col-md-16">
                <div class="card">
                    <div class="card-header text-right">
                        <a href="ControllerBienes?selecciono=extintores" class="btn btn-sm btn-primary">Extintores</a>
                        <a href='ControllerBienes?selecciono=climas' class="btn btn-sm btn-primary">Climas</a>
                        <a href='ControllerBienes?selecciono=impresoras' class="btn btn-sm btn-primary">Impresoras</a> 
                        <a href='ControllerBienes?selecciono=todos' class="btn btn-sm btn-primary">Todos</a>
                        <a href='ControllerBienes?selecciono=nuevo' class="btn btn-sm btn-primary">Nuevo</a>
                        <a class="btn btn-sm btn-primary" href='?page=adm-pdf-bienes'target="_blank">Imprimir lista</a> 
                    </div>   
                </div>

                <h5>${data[1]}</h5>
                <table id="example" class="table table-bordered display nowrap" width="100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Fecha de instalacion</th>
                            <th>Numero de Inventario</th>
                            <th>serie</th>
                            <th>unidad</th>
                            <th>Estado</th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
        </div>
    </div>


    <script>
        $(document).ready(function () {
            $('#example').DataTable({
                responsive: true,
                data: ${data[0]},
                columns: [
                    {data: 'cve_bienes'},
                    {data: 'marca'},
                    {data: 'modelo'},
                    {data: 'fecha_instalacion'},
                    {data: 'num_inventario'},
                    {data: 'serie'},
                    {data: 'unidad'},
                    {data: 'status'}
                ]
            });
        });
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