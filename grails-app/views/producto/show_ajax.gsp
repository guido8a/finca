    <g:if test="${producto?.nombre}">
        <div class="row">
            <div class="col-md-2 show-label">
                Nombre
            </div>
            <div class="col-md-6">
                <span >${producto?.nombre}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.descripcion}">
        <div class="row">
            <div class="col-md-2 show-label">
                Descripción
            </div>
            <div class="col-md-6">
                <span >${producto?.descripcion}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.sku}">
        <div class="row">
            <div class="col-md-2 show-label">
                Sku
            </div>
            <div class="col-md-6">
                <span>${producto?.sku}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.marca}">
        <div class="row">
            <div class="col-md-2 show-label">
                Marca
            </div>
            <div class="col-md-6">
                <span >${producto?.marca}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.etiqueta}">
        <div class="row">
            <div class="col-md-2 show-label">
                Etiqueta
            </div>
            <div class="col-md-6">
                <span >${producto?.etiqueta}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.empaque}">
        <div class="row">
            <div class="col-md-2 show-label">
                Empaque
            </div>
            <div class="col-md-6">
                <span >${producto?.empaque}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.calibre}">
        <div class="row">
            <div class="col-md-2 show-label">
               Calibre
            </div>
            <div class="col-md-6">
                <span >${producto?.calibre}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.size}">
        <div class="row">
            <div class="col-md-2 show-label">
                Size
            </div>
            <div class="col-md-6">
                <span >${producto?.size}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.peso}">
        <div class="row">
            <div class="col-md-2 show-label">
                Peso
            </div>
            <div class="col-md-6">
                <span >${producto?.peso}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.unindadesCaja}">
        <div class="row">
            <div class="col-md-2 show-label">
                Unidades
            </div>
            <div class="col-md-6">
                <span >${producto?.unindadesCaja}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.cajasPalet}">
        <div class="row">
            <div class="col-md-2 show-label">
                Palet
            </div>
            <div class="col-md-6">
                <span >${producto?.cajasPalet}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.tipo}">
        <div class="row">
            <div class="col-md-2 show-label">
                Tipo
            </div>
            <div class="col-md-6">
                <span >${producto?.tipo == 0 ? 'NO' : 'SI'}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.organico}">
        <div class="row">
            <div class="col-md-2 show-label">
                Orgánico
            </div>
            <div class="col-md-6">
                <span >${producto?.organico == 0 ? 'NO' : 'SI'}</span>
            </div>
        </div>
    </g:if>
    <g:if test="${producto?.fairTrade}">
        <div class="row">
            <div class="col-md-2 show-label">
                Fair Trade
            </div>
            <div class="col-md-6">
                <span >${producto?.fairTrade == 0 ? 'NO' : 'SI'}</span>
            </div>
        </div>
    </g:if>
