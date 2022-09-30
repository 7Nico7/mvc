<%
if(session.getAttribute("usuario")!=null){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="pages/css/bootstrap.css">
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css">


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

        <style type="text/css">
            div#c_list {
                background: #fbfbfb;
                overflow-y: auto;
                overflow-x: hidden;
                max-height: 370px;
                border: 1px solid #e6e6e6;
                border-bottom: 0;
            }
            #c_list::-webkit-scrollbar {
                width: 8px;
            }
            #c_list::-webkit-scrollbar-thumb {
                background: #a1aebf;
                border-radius: 4px;
            }
            #c_list::-webkit-scrollbar-track {
                background: #e9edef;
            }
        </style>
        <div>
            <section class="conten">
            </section>
        </div>
        <footer class="site-footer">
            <div class="container" align="center">
                <div class="row pt-2 mt-2 text-center">
                    <div class="col-md-12">
                        <img alt="firma blanco.png" height="173" src="imagen/firma_blanco.png" width="100">
                    </div>

                    <div class="col-md-12"><br>
                        <p id="blanco"> Copyright &copy;2022</p>
                    </div>
                    <div class="col-md-12">
                        <strong>Coordinaci�n General de Modernizaci�n Administrativa e Innovaci�n Gubernamental</strong>
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
            /*footer{
              display: block;
            }
            
            @media (min-width: 768px) and (max-width: 1199px){
            #footer {
                margin-bottom: 48px;
            }}*/
        </style>
        <script type="text/javascript" src="main.js"></script>  
    </body>
</html>
<%
}else{
    response.sendRedirect("/serviciosgenerales/index.jsp");
}
%>