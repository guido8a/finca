<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:else>
    <g:if test="${dia?.id}">
        <div class="row">
            <div class="col-md-4 show-label">
                Id
            </div>
            <div class="col-md-6">
                <g:fieldValue bean="${dia}" field="id"/>
            </div>
        </div>
    </g:if>
	<g:if test="${dia?.numero}">
        <div class="row">
            <div class="col-md-4 show-label">
                Numero
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${dia}" field="nombre"/> --}%
                <span>${dia?.numero}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${dia?.nombre}">
        <div class="row">
            <div class="col-md-4 show-label">
                Nombre
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${dia}" field="nombre"/> --}%
                <span>${dia?.nombre}</span>
            </div>
        </div>
    </g:if>
</g:else>