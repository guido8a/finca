<%@ page import="tutor.Periodo" %>
<div class="container">

    <div style="width: 600px">
        <div class="col-md-4">
            <label>
                Periodo
            </label>
            <g:select name="periodo" from="${tutor.Periodo.list([sort: 'descripcion'])}"
                      class="form-control input-sm required" optionValue="descripcion" optionKey="id"
            />
        </div>
        <div class="col-md-7">
            <label>
                Docente
            </label>
            <g:select name="profesor" from="${tutor.Profesor.list().sort{it.apellido}}" class="form-control"
                      optionKey="id" optionValue="${{it.apellido + " " + it.nombre}}" noSelection="[null: 'TODOS']" />
        </div>

        <div class="col-md-7">
            <label>
                Archivos separados
            </label>
            <input type="checkbox" id="separados">
        </div>

    </div>

</div>