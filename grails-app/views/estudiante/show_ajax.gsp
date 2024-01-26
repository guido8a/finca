<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:else>
    <g:if test="${estudiante?.id}">
        <div class="row">
            <div class="col-md-2 show-label">
                Id
            </div>
            <div class="col-md-8">
                <g:fieldValue bean="${estudiante}" field="id"/>
            </div>
        </div>
    </g:if>
    <g:if test="${estudiante?.nombre}">
        <div class="row">
            <div class="col-md-2 show-label">
                Nombre
            </div>
            <div class="col-md-8">
                %{--<g:fieldValue bean="${estudiante}" field="nombre"/> --}%
                <span>${estudiante?.nombre}</span>
            </div>
        </div>
    </g:if>
     <g:if test="${estudiante?.apellido}">
        <div class="row">
            <div class="col-md-2 show-label">
                Apellido
            </div>
            <div class="col-md-8">
                %{--<g:fieldValue bean="${estudiante}" field="nombre"/> --}%
                <span>${estudiante?.apellido}</span>
            </div>
        </div>
    </g:if>
     <g:if test="${estudiante?.mail}">
        <div class="row">
            <div class="col-md-2 show-label">
                Correo
            </div>
            <div class="col-md-8">
                %{--<g:fieldValue bean="${estudiante}" field="nombre"/> --}%
                <span>${estudiante?.mail}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${estudiante?.sexo}">
        <div class="row">
            <div class="col-md-2 show-label">
                Sexo
            </div>
            <div class="col-md-8">
                %{--<g:fieldValue bean="${estudiante}" field="nombre"/> --}%
                <span>${estudiante?.sexo}</span>
            </div>
        </div>
    </g:if>
</g:else>