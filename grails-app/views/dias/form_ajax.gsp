
    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmDias" role="form" action="saveDia_ajax" method="POST">
            <g:hiddenField name="id" value="${dias?.id}"/>
            <div class="form-group keeptogether ${hasErrors(bean: dias, field: 'nombre', 'error')}">
                <span class="grupo">
                    <label for="numero" class="col-md-2 control-label">
                        Número de Día
                    </label>

                    <div class="col-md-8">
                        <g:textField name="numero" maxlength="3" class="form-control input-sm required" value="${dias?.numero}"/>
                    </div>
                </span>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: dias, field: 'nombre', 'error')}">
                <span class="grupo">
                    <label for="nombre" class="col-md-2 control-label">
                        Nombre
                    </label>

                    <div class="col-md-8">
                        <g:textField name="nombre" maxlength="61" class="form-control input-sm required"
                                     value="${dias?.nombre}"/>
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
                // Para no hacer que el enter haga algo adicional return false
                return false;
            }
            return true;
        });


        $("#grabar").click(function () {
            var nombre = $("#nombre").val();
            var numero = $("#numero").val();
            var url = "${createLink(controller: 'dias', action:'list')}"
            console.log("validando...")

            if(nombre == ''){
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                    " Ingrese el nombre del dia y el numero")
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
            //location.href("${createLink(controller: 'facultad', action:'list')}")
            //true para que no haya intervalos de espera
            location.reload(true)
        });
    </script>
