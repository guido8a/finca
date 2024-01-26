<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:else>
    <g:if test="${asignatura?.id}">
        <div class="row">
            <div class="col-md-4 show-label">
                Id
            </div>
            <div class="col-md-6">
                <g:fieldValue bean="${asignatura}" field="id"/>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.carrera}">
        <div class="row">
            <div class="col-md-4 show-label">
                Carrera
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.carrera}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.nivel}">
        <div class="row">
            <div class="col-md-4 show-label">
                Nivel
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.nivel}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.tipoActividad}">
        <div class="row">
            <div class="col-md-4 show-label">
                Tipo de Actividad
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.tipoActividad}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.codigo}">
        <div class="row">
            <div class="col-md-4 show-label">
                Codigo
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.codigo}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.nombre}">
        <div class="row">
            <div class="col-md-4 show-label">
                Nombre
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.nombre}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.creditos}">
        <div class="row">
            <div class="col-md-4 show-label">
                Creditos
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.creditos}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.horasTeoria}">
        <div class="row">
            <div class="col-md-4 show-label">
                Horas Teoriacas
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.horasTeoria}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.horasTeoria}">
        <div class="row">
            <div class="col-md-4 show-label">
                Horas Teoricas
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.horasTeoria}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.horasPractica}">
        <div class="row">
            <div class="col-md-4 show-label">
                Horas Practicas
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.horasPractica}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${asignatura?.factorPreparacion}">
        <div class="row">
            <div class="col-md-4 show-label">
                Factor Preparación
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.factorPreparacion}</span>
            </div>
        </div>

    </g:if>
    <g:if test="${asignatura?.horasGestion}">
        <div class="row">
            <div class="col-md-4 show-label">
                Horas Gestión
            </div>
            <div class="col-md-6">
                <span style="background-color: #ddd">${asignatura?.horasGestion}</span>
            </div>
        </div>
    </g:if>
</g:else>