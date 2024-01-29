<%@ page import="finca.Semana" %>
<div class="container">

    <div style="width: 600px">
        <div class="col-md-10">
            <label>
                Seleccione la Semana a reportar
            </label>
            <g:select name="periodo" from="${finca.Semana.list([sort: 'fechaInicio'])}"
                      class="form-control input-sm required" optionValue="${{it.fechaInicio + " " + it.fechaFin}}" optionKey="id"
            />
        </div>

        %{--<div class="col-md-7">--}%
            %{--<label>--}%
                %{--Archivos separados--}%
            %{--</label>--}%
            %{--<input type="checkbox" id="separados">--}%
        %{--</div>--}%

    </div>

</div>