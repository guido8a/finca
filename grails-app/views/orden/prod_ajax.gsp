<div class="col-md-2">
    <label for="producto" class="control-label" style="text-align: right">
        Producto
    </label>
</div>

<div class="col-md-10">
    <g:select name="producto" from="${prod}" class="form-control input-sm required" style="margin-left: -30px; width: 500px;"
              optionValue="${{it.nombre + ' Size: ' + it.size + " U: " +  it.unindadesCaja + " W: " + it.peso +
                      " Packing: " + it.empaque + " Brand: " + it.marca}}"
              optionKey="id" noSelection="${[0:'Seleccione un producto ...']}"/>
</div>


<script type="text/javascript">

//    cargaTabla($("#curso option:selected").val());

//    $("#curso").change(function () {
//        var parl = $(this).val();
//        if (parl) {
//            cargaTabla(parl)
//        }
//    });
//
//    $("#btnActual").click(function () {
//        cargaTabla($("#curso option:selected").val());
//    });

</script>