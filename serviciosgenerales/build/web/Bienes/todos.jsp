<%
if(session.getAttribute("usuario") != null){
%>
<!DOCTYPE html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="../css/bootstrap.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="../js/jquery.dataTables.min.js"></script>


</head>   
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="?page=adm-inicio"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item">
                    <a class="nav-link" href="?page=adm-inicio">Inicio</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Bienes</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="Bienes?selecciono=climas">Climas</a>
                        <a class="dropdown-item" href="Bienes?selecciono=impresoras">Impresoras</a>
                        <a class="dropdown-item" href="Bienes?selecciono=extintores">Extintores</a>
                        <a class="dropdown-item" href="Bienes?selecciono=todos">Todos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> CFE</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="?page=adm-medidores">Medidores</a>
                        <a class="dropdown-item" href="?page=adm-recibos">Recibos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Vehiculos</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="?page=adm-vehiculos">Vehiculos</a>
                        <a class="dropdown-item" href="?page=adm-cargas">Cargas de Gasolina</a>
                        <a class="dropdown-item" href="?page=adm-servicio">Servicios</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?page=adm-mantenimiento">Mantenimiento</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="?page=adm-usuario">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?page=adm-perfil&id=4">Perfil</a>
                </li>
            </ul>
            <span class="navbar-text">Bienvenido Teresa Lopez</span>
            <a href="Autentica?accion=cerrar" class="btn btn-danger ml-2">Cerrar Sesion</a>
        </div>
    </nav>    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-16">
                <div class="card">
                    <div class="card-header text-right">
                        <a href="Bienes?selecciono=extintores" class="btn btn-sm btn-primary">Extintores</a>
                        <a href='Bienes?selecciono=climas' class="btn btn-sm btn-primary">Climas</a>
                        <a href='Bienes?selecciono=impresoras' class="btn btn-sm btn-primary">Impresoras</a> 
                        <a href='Bienes?selecciono=todos' class="btn btn-sm btn-primary">Todos</a>
                        <a class="btn btn-sm btn-primary" href='Bienes?selecciono=nuevo'>Nuevo</a>
                        <a class="btn btn-sm btn-primary" href='Bienes?selecciono=imprimir'target="_blank">Imprimir lista</a> 
                    </div>                    
                    <div class="card-body">
                        <h5>Listado de Bienes</h5>
                        <table id="example" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011-04-25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Garrett Winters</td>
                                    <td>Accountant</td>
                                    <td>Tokyo</td>
                                    <td>63</td>
                                    <td>2011-07-25</td>
                                    <td>$170,750</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <!-- borrar -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Borrar Bien</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="controllers/controller.bienes.php" method="post" id="form2">
                            <div class="form-group">
                                <h3 class="text-danger">¿Estas seguro de borrar este Bien?</h3>
                                <input id="inpborrar" type="hidden" name="id">
                                <input type="hidden" name="tipo" value="borrar">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-danger" form="form2">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function () {
            $('#example').DataTable();
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
                    <strong>Coordinación General de Modernización Administrativa e Innovación Gubernamental</strong>
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
<%
}else{
    response.sendRedirect("/serviciosgenerales/index.jsp");
}
%>