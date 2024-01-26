<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:else>
    <g:if test="${tipoActividad?.id}">
        <div class="row">
            <div class="col-md-2 show-label">
                Id
            </div>
            <div class="col-md-8">
                <g:fieldValue bean="${tipoActividad}" field="id"/>
            </div>
        </div>
    </g:if>
    <g:if test="${tipoActividad?.descripcion}">
        <div class="row">
            <div class="col-md-2 show-label">
                Descripción
            </div>
            <div class="col-md-8">
                %{--<g:fieldValue bean="${tipoActividad}" field="nombre"/> --}%
                <span>${tipoActividad?.descripcion}</span>
            </div>
        </div>
    </g:if>
</g:else>