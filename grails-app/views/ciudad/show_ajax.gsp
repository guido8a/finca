<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:else>
	<g:if test="${cdad?.numero}">
        <div class="row">
            <div class="col-md-4 show-label">
                Numero
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${cdad}" field="nombre"/> --}%
                <span>${cdad?.numero}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${cdad?.nombre}">
        <div class="row">
            <div class="col-md-4 show-label">
                Nombre
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${cdad}" field="nombre"/> --}%
                <span>${cdad?.nombre}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${cdad?.pais}">
        <div class="row">
            <div class="col-md-4 show-label">
                País
            </div>
            <div class="col-md-6">
                <g:fieldValue bean="${cdad}" field="pais"/>
            </div>
        </div>
    </g:if>
</g:else>