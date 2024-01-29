<%@ page import="geografia.Ciudad" %>

<div class="modal-contenido" style="height: 200px">
    <g:form class="form-horizontal" name="frmCdad" role="form" action="saveDia_ajax" method="POST">
        <g:hiddenField name="id" value="${ciudad?.id}"/>

        <div class="form-group ${hasErrors(bean: ciudad, field: 'nombre', 'error')}">
            <div class="row">
                <label for="numero" class="col-md-3 control-label">
                    Número de Ciudad
                </label>

                <div class="col-md-3">
                    <g:textField name="numero" maxlength="3" class="form-control required" value="${ciudad?.numero}"/>
                </div>
            </div>
        </div>

    %{--<div class="form-group keeptogether ${hasErrors(bean: ciudad, field: 'nombre', 'error')}">--}%
        <div class="form-group ${hasErrors(bean: proveedorInstance, field: 'pais', 'error')}">
            <div class="row">
                <label for="nombre" class="col-md-3 control-label">
                    Nombre
                </label>

                <div class="col-md-8">
                    <g:textField name="nombre" maxlength="61" class="form-control required"
                                 value="${ciudad?.nombre}"/>
                </div>
            </div>

        </div>

        <div class="form-group ${hasErrors(bean: proveedorInstance, field: 'pais', 'error')}">
            <div class="row">
                <label for="pais" class="col-md-3 control-label text-info required">
                    País
                </label>

                <span class="col-md-8">
                    <g:select id="pais" name="pais.id" from="${paises}"
                              value="${ciudad?.pais}" class="many-to-one form-control required"
                              noSelection="['null': 'Seleccione...']"/>
                </span>
            </div>
        </div>

    </g:form>
    <div class="col-md-12" style="text-align: end; margin-top: 10px">
        <button id="cerrar" class="btn btn-primary">Cancelar</button>
        <button id="grabar" class="btn btn-info">Grabar</button>
    </div>
</div>

<script type="text/javascript">


    $(".form-control").keydown(function (ev) {
        if (ev.keyCode == 13) {
            console.log("Llama a validar")
            $("#grabar").click()
            // Para no hacer que el enter haga algo adicional return false
            return false;
        }
        return true;
    });


    $("#grabar").click(function () {
        var nombre = $("#nombre").val();
        var numero = $("#numero").val();
        var url = "${createLink(controller: 'ciudad', action:'list')}"
        console.log("validando...")

        if (nombre == '') {
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                " Ingrese el nombre del dia y el numero")
        } else {
            submitForm();
            //$(".modal-dialog").hide()
            setTimeout(function () {

                location.reload(true)
            }, 300);
            //location.reload(true)
        }

    });

    $("#cerrar").click(function () {
        //location.href("${createLink(controller: 'facultad', action:'list')}")
        //true para que no haya intervalos de espera
        location.reload(true)
    });
</script>
