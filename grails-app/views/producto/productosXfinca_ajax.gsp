<div class="row">
    <div class="col-md-2 show-label">
        Finca
    </div>

    <div id="divFincas">

    </div>

    <a href="#" class="btn btn-success btnSeleccionar">
        <i class="fa fa-plus"></i> Seleccionar
    </a>

    <div id="divTablaFXC" style="margin-top: 10px;margin-left: 10px; margin-right: 10px">

    </div>

</div>


<script type="text/javascript">

    var dsf;

    cargarFincas();

    function cargarFincas(){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'producto', action:'finca_ajax')}",
            data: {
                id: '${producto?.id}'
            },
            success: function (msg) {
                $("#divFincas").html(msg);
            } //success
        });
    }

    cargarFXC();

    function cargarFXC(){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'producto', action:'tablaFXC_ajax')}",
            data: {
                id: '${producto?.id}'
            },
            success: function (msg) {
                $("#divTablaFXC").html(msg);
            } //success
        });
    }

    function cargarFormEtiqueta(id){
        var title = "Etiqueta";
        var producto = '${producto?.id}';
        var finca = $("#finca option:selected").val();

        if(finca  || id){
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'producto', action:'etiqueta_ajax')}",
                data: {
                    producto: producto,
                    finca: finca,
                    id: id
                },
                success: function (msg) {
                    dsf = bootbox.dialog({
                        title: title,
                        closeButton: false,
                        message: msg,
                        buttons: {
                            aceptar: {
                                label: "Cerrar",
                                className: "btn-primary",
                                callback: function () {
                                }
                            }
                        }
                    }); //dialog
                } //successJava
            });
        }else{
            bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + "Seleccione una finca" + '</strong>');
            return false;
        }
    }


    $(".btnSeleccionar").click(function () {
        cargarFormEtiqueta()
    });

    function cerrarDsf(){
        dsf.modal("hide")
    }

</script>