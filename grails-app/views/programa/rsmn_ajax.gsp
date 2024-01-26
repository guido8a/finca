<g:if test="${existe}">
    <div class="col-md-6">
        <table class="table table-condensed table-bordered table-striped table-hover" style="margin-top: 20px; width: 100%">
            <thead style="text-align: center">
            <tr>
                <th width="50%">Docente</th>
                <th width="10%">Clase</th>
                <th width="10%">Prep.</th>
                <th width="10%">Gestión</th>
                <th width="10%">Total</th>
                <th width="10%">Comp.</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${prdoN}" var="pn">
                <tr class="${pn?.tppr__id == 3 ? 'text-success' : (pn?.tppr__id == 2 ? 'text-info' : (pn?.tppr__id == 4  ? 'text-danger' : '') )}">
                    <td>${pn?.profnmbr}</td>
                    <td>${pn?.comphrcl}</td>
                    <td>${pn?.comphrpp}</td>
                    <td>${pn?.comphrgs}</td>
                    <td class="text-info"><strong>${pn?.comptotl}</strong></td>
                    <td>${pn?.comphora}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <table class="table table-condensed table-bordered table-striped table-hover" style="margin-top: 20px; width: 100%">
            <thead style="text-align: center">
            <tr>
                <th width="52%">Docente</th>
                %{--<th width="10%">Clase</th>--}%
                <th width="12%">Prep.</th>
                <th width="12%">Gestión</th>
                <th width="12%">Comp.</th>
                <th width="12%">Total</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${prdoI}" var="pn">
                <tr class="${pn?.tppr__id == 3 ? 'text-success' : (pn?.tppr__id == 2 ? 'text-info' : (pn?.tppr__id == 4  ? 'text-danger' : '') )}">
                    <td>${pn?.profnmbr}</td>
                    %{--<td>${pn?.comphrcl}</td>--}%
                    <td>${pn?.comphrpp}</td>
                    <td>${pn?.comphrgs}</td>
                    <td>${pn?.comphora}</td>
                    <td class="text-info"><strong>${pn?.comptotl}</strong></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</g:if>
<g:else>
    <div class="alert alert-danger" style="text-align: center"> <i class="fa fa-exclamation-triangle fa-2x text-info"></i>
        <strong style="font-size: 14px"> No hay datos de este periodo</strong>
    </div>
</g:else>


<script type="text/javascript">
    $(".horas").click(function () {
        var dias = $(this).data("dia");
        var hora = $(this).data("hora");
        console.log("dia:", dias, 'hora: ', hora)
        creaHora(dias, hora)
    });

    $(".btn-borra-hora").click(function () {
        var id = $(this).data("hora");
        console.log("horario id:", id)
        borraHora(id)
    });

</script>
