<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:else>
    <g:if test="${profesor?.id}">
        <div class="row">
            <div class="col-md-4 show-label">
                Id
            </div>
            <div class="col-md-6">
                <g:fieldValue bean="${profesor}" field="id"/>
            </div>
        </div>
    </g:if>
    <g:if test="${profesor?.nombre}">
        <div class="row">
            <div class="col-md-4 show-label">
                Nombre
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${profesor}" field="nombre"/> --}%
                <span>${profesor?.nombre}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${profesor?.apellido}">
        <div class="row">
            <div class="col-md-4 show-label">
                Apellido
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${profesor}" field="nombre"/> --}%
                <span>${profesor?.apellido}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${profesor?.mail}">
        <div class="row">
            <div class="col-md-4 show-label">
                Email
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${profesor}" field="nombre"/> --}%
                <span>${profesor?.mail}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${profesor?.extension}">
        <div class="row">
            <div class="col-md-4 show-label">
                Extension
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${profesor}" field="nombre"/> --}%
                <span>${profesor?.extension}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${profesor?.sexo}">
        <div class="row">
            <div class="col-md-4 show-label">
                Sexo
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${profesor}" field="nombre"/> --}%
                <span>${profesor?.sexo}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${profesor?.tipoProfesor}">
        <div class="row">
            <div class="col-md-4 show-label">
                Tipo Profesor
            </div>
            <div class="col-md-6">
                %{--<g:fieldValue bean="${profesor}" field="nombre"/> --}%
                <span>${profesor?.tipoProfesor?.descripcion}</span>
            </div>
        </div>
    </g:if>
</g:else>