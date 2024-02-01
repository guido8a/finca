<div class="row">

    <g:hiddenField name="id" value="${pxf?.id}"/>

    <div class="col-md-2 show-label">
        Etiqueta
    </div>

    <div class="col-md-6">
        <g:textField name="etiqueta" value="${pxf?.etiqueta}"  class="form-control" />
    </div>

    <a href="#" class="btn btn-success btnGuardarEtiqueta">
        <i class="fa fa-save"></i> Guardar
    </a>

</div>

<script type="text/javascript">


    $(".btnGuardarEtiqueta").click(function () {
        var producto = '${producto?.id}';
        var finca = '${finca?.id}';
        var id = $("#id").val();
        var etiqueta = $("#etiqueta").val();
        var dialog = cargarLoader("Guardando...");
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'producto', action: 'saveFXC_ajax')}",
            data    : {
                producto : producto,
                finca : finca,
                etiqueta: etiqueta,
                id: id
            },
            success : function (msg) {
                dialog.modal('hide');
                var parts = msg.split("_");
                if(parts[0] === 'ok'){
                    log(parts[1], "success");
                    cerrarDsf();
                    cargarFXC();
                    cargarFincas();
                }else{
                    bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                    return false;
                }
            }
        });
    })



</script>