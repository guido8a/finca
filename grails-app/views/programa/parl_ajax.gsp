<g:if test="${existe}">
    <table class="table-condensed table-bordered table-striped table-hover" style="margin-top: 20px; width: 100%">
        <thead style="text-align: center; background-color: #435a83; color: #fff;">
        <tr>

            <th width="9%">Hora</th>
            <g:each in="${dias}" var="d">
                <th width="13%">${d?.nombre}</th>
            </g:each>

        </tr>
        </thead>
        <tbody>
        <g:each in="${horario}" var="h">
            <tr data-id="${h?.lun}" >
            <td width="9%">${h?.hora}</td>

            <td width="10%" class="${h?.lun?.size() > 10 ? 'usado' : 'libre'}">
                ${h?.lun?.size() > 20 ? h?.lun : 'Libre'}
            </td>
            <td width="10%" class="${h?.mar?.size() > 10 ? 'usado' : 'libre'}">
                ${h?.mar?.size() > 20 ? h?.mar : 'Libre'}
            </td>
            <td width="10%" class="${h?.mie?.size() > 10 ? 'usado' : 'libre'}">
                ${h?.mie?.size() > 20 ? h?.mie : 'Libre'}
            </td>
            <td width="10%" class="${h?.jue?.size() > 10 ? 'usado' : 'libre'}">
                ${h?.jue?.size() > 20 ? h?.jue : 'Libre'}
            </td>
            <td width="10%" class="${h?.vie?.size() > 10 ? 'usado' : 'libre'}">
                ${h?.vie?.size() > 20 ? h?.vie : 'Libre'}
            </td>
            <td width="10%" class="${h?.sab?.size() > 10 ? 'usado' : 'libre'}">
                ${h?.sab?.size() > 20 ? h?.sab : 'Libre'}
            </td>
            <td width="10%" class="${h?.dom?.size() > 10 ? 'usado' : 'libre'}">
                ${h?.dom?.size() > 20 ? h?.dom : 'Libre'}
            </td>

        </g:each>

        </tr>
        </tbody>
    </table>
</g:if>
<g:else>
    <div class="alert alert-danger" style="text-align: center"> <i class="fa fa-exclamation-triangle fa-2x text-info"></i>
        <strong style="font-size: 14px"> No hay horario de este paralelo  </strong>
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
