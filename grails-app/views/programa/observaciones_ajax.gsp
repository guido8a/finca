<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmObservaciones" role="form" action="saveObservaciones_ajax" method="POST">
        <g:hiddenField name="id" value="${gestion?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: gestion, field: 'observaciones', 'error')}">
                <div class="col-md-12">
                    <g:textArea name="observaciones" maxlength="255" class="form-control" style="resize: none; height: 100px" value="${gestion?.observaciones}"/>
                </div>
        </div>
    </g:form>
</div>