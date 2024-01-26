<div class="col-md-12">
    <div class="col-md-1">
        <label>
            Paralelo
        </label>
    </div>
    <div class="col-md-4" >
        <g:select name="paralelo" from="${paralelos}" optionKey="id" optionValue="numero" class="form-control" />
    </div>
</div>

<div class="col-md-12 hidden" style="margin-top: 13px">
    <div class="col-md-1">
        <label>
            Asignatura
        </label>
    </div>
    <div class="col-md-4" id="divAsignatura">
        <g:select name="asignatura" from="${asignaturas}" optionKey="id" optionValue="nombre" class="form-control" />
    </div>
</div>





