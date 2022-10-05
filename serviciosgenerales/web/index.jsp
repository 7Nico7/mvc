<%
if(session.getAttribute("usuario") == null){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios Generales</title>
        <link rel="stylesheet" type="text/css" href="pages/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">CGMAIG <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <br>
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="card-title">Iniciar sesion</h1>

                            <img src="imagen/escudo_de_armas.png"/>               

                            <form action="Validar" method="POST">
                                <div class="form-group">

                                    <input type="text" class="form-control" placeholder="Correo" name="correo" required>
                                </div>
                                <div class="form-group" align="center">
                                    <input type="password" class="form-control" placeholder="Contraseña" name="contra" required>
                                    <a href="?page=recuperar" class="btn">Recuperar contraseña</a>
                                </div>
                                <div class="form-group" align="center">
                                    <button name="accion" value="ingresar"  class="btn btn-primary">Ingresar</button>
                                    <div>
                                        <a class="btn" style="color:#007bff" data-bs-toggle="modal" data-bs-target="#exampleModal">Crear cuenta</a>
                                    </div>
                                </div>
                            </form>
                            ${msje} 
                        </div>
                    </div>
                </div>
            </div>
            <br>
        </div>
        <div>
            <section class="conten">
            </section>
        </div>



        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar Usuario</h5>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nombre Completo" name="nombre" id="nombre" required>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Correo" name="correo" id="correo" required>
                            </div>
                            <div class="form-group" align="center">
                                <input type="password" class="form-control" placeholder="Contraseña" name="contra" id="contra" required>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button class="btn btn-primary" onclick="guardar()">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function guardar() {
                var nombre = document.getElementById('nombre').value;
                var correo = document.getElementById('correo').value;
                var contra = document.getElementById('contra').value;
                var datos = 'accion=registrar' + '&nombre=' + nombre + '&correo=' + correo + '&contra=' + contra;
                $.ajax({
                    url: "Validar", type: 'POST', data: datos,
                    success: function (data) {
                        swal('Mensaje del sistema', data.trim(), 'success');
                        Limpiar();
                    }, error: function (xml, data) {
                        swal('Error!', 'ah ocurrido un error en la base de datos', 'error');
                    }
                });
            }

            function Limpiar() {
                $('#nombre').val("");
                $('#correo').val("");
                $('#contra').val("");
            }
        </script>



        <footer class="site-footer">
            <div class="container" align="center">
                <div class="row pt-2 mt-2 text-center">
                    <div class="col-md-12">
                        <img alt="firma blanco.png" src="imagen/firma_blanco.png" >
                    </div>

                    <div class="col-md-12"><br>
                        <p id="blanco"> Copyright &copy;2022</p>
                    </div>
                    <div class="col-md-12">
                        <strong>Coordinaci&oacute;n General de Modernizaci&oacute;n Administrativa e Innovaci&oacute;n Gubernamental</strong>
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
            img{
                display: block;
                margin: auto;
            }
            .card-title{
                text-align: center;
                color: black;
            }
            ;
            .container{
                align-content: center;
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