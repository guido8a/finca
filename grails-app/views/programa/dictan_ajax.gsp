<div class="col-md-1">
    <label for="profesor" class="col-md-1 control-label" style="text-align: right; margin-left: -20px">
        Profesor
    </label>
</div>
<div class="col-md-8">
    <g:select name="profesor" from="${tutor.Profesor.list([sort: 'apellido'])}"
              class="form-control input-sm required" optionValue="${{it.apellido + " - " + it.nombre}}"
              optionKey="id" value="${params.prof}"
    />
</div>

<div class="col-md-1">
    <a href="#" class="btn btn-xs btn-success" id="btnActual" style="margin-left: 40px">
        <i class="fa fa-sync"></i> Actualizar
    </a>
</div>
%{--<div class="col-md-1">--}%
    %{--<div class="btn-group">--}%
        %{--<a href="#" id="btnVerProfesor" class="btn btn-info">--}%
            %{--<i class="fa fa-user"></i> Profesor--}%
        %{--</a>--}%
    %{--</div>--}%
%{--</div>--}%

<script type="text/javascript">

    cargaTabla($("#profesor option:selected").val());

    $("#profesor").change(function () {
        var prof = $(this).val();
        if(prof) {
            cargaTabla(prof)
        }
    });

    $("#btnActual").click(function () {
        cargaTabla( $("#profesor option:selected").val() );
    });

</script>