

$('#myTab a').on('click', function (e) {
    e.preventDefault(),
            $(this).tab('show');
});


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



