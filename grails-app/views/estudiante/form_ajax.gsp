
    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmEstudiante" role="form" action="saveEstudiante_ajax" method="POST">
            <g:hiddenField name="id" value="${estudiante?.id}"/>

            <div class="form-group keeptogether ${hasErrors(bean: estudiante, field: 'nombre', 'error')}">
                <span class="grupo">
                    <label for="nombre" class="col-md-2 control-label">
                        Nombre
                    </label>
                    <div class="col-md-8">
                        <g:textField name="nombre" maxlength="61" class="form-control input-sm required"
                                     value="${estudiante?.nombre}"/>
                    </div>

                    <label for="apellido" class="col-md-2 control-label">
                        Apellido
                    </label>
                    <div class="col-md-8">
                        <g:textField name="apellido" maxlength="61" class="form-control input-sm required"
                                     value="${estudiante?.apellido}"/>
                    </div>

                    <label for="mail" class="col-md-2 control-label">
                        Mail
                    </label>
                    <div class="col-md-8">
                        <g:textField name="mail" maxlength="61" class="form-control input-sm required"
                                     value="${estudiante?.mail}"/>
                    </div>

                    <label for="sexo" class="col-md-2 control-label">
                        Sexo
                    </label>
                    <div class="col-md-8">
                        <g:select name="sexo" from="${['M', 'F']}" style="border:solid 2px black;" class="form-control input-sm required"
                                value="${estudiante?.sexo}"/>
                    </div>
                </span>

            </div>
        </g:form>
        <div class="col-md-12" style="text-align: end">
            <button id="cerrar" class="btn btn-primary"> Cancelar</button>
            <button id="grabar" class="btn btn-info"> Grabar</button>
        </div>
    </div>

    <script type="text/javascript">
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                console.log("Llama a validar")
                $("#grabar").click()
                return false;
            }
            return true;
        });


        $("#grabar").click(function () {
            var nombre = $("#nombre").val();
            var apellido = $('#apellido').val();
            var mail = $('#mail').val();
            var sexo = $('#sexo').val();
            var url = "${createLink(controller: 'estudiante', action:'list')}"
            console.log("validando...")

            if(nombre == '' || apellido == '' || mail == '' || sexo == ''){
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                    " Llene todos los campos")
            }else{
                submitForm();
                //$(".modal-dialog").hide()
                setTimeout(function () {

                    location.reload(true)
                }, 300);
                //location.reload(true)
            }

        });

        $("#cerrar").click(function () {
            //location.href("${createLink(controller: 'estudiante', action:'list')}")
            location.reload(true)
        });
    </script>
