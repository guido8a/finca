    <table class="table-condensed table-bordered table-striped table-hover" style="margin-top: 20px">
        <thead style="text-align: center">
        <tr>

            <th>Hora</th>
            <g:each in="${dias}" var="d">
                <th>${d?.nombre }</th>
            </g:each>

        </tr>
        </thead>
        <tbody>
        <g:each in="${horas}" var="hora">
            <tr data-id="${hora?.id}" >
                <td width="15%">${hora?.descripcion}</td>

                <g:each in="${dias}" var="d">
                %{--<<g:if test="${[1].contains(d.id.toInteger() )}">--}%
                %{--<g:if test="${(horario.dias.id).contains(d.id.toLong()) && (horario.hora.id).contains( hora.id.toLong())}">--}%
                    %{--horario.find { it.id == '2_2'}.asig--}%
                %{--"${clases.find { it.id == d.id + '_' + hora.id}?.asig?.size() > 0}"--}%
                <g:set var="h_id" value="${clases.find { it.id == d.id + '_' + hora.id}?.id_horr}"/>
                <g:if test="${clases.find { it.id == d.id + '_' + hora.id}?.asig?.size() > 0}">
                %{--<g:if test="${horario.dias.id == d.id && (horario.hora.id == hora.id)}"> --}%
                    <td width="10%" data-id="${horario?.id}" class="usado"><i class="fa fa-check"></i>

                    <a href="#" data-hora="${h_id}" class="btn-danger btn-sm btn-borra-hora btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                        %{--<br>${clases.find { it.id == d.id + '_' + hora.id}?.asig}--}%
                    </td>
                </g:if>
                <g:else>
                    <td width="10%" data-id="${hora?.numero}_1" class="horas libre"
                        data-dia="${d.id}" data-hora="${hora.id}">
                       Libre
                       ${d.id}:${hora.id}
                    </td>
                </g:else>
            </g:each>


        </tr>
    </g:each>
    </tbody>
</table>

<script type="text/javascript">
    $(".horas").click(function () {
        var dias = $(this).data("dia");
        var hora = $(this).data("hora");
        console.log("dia:", dias)
        creaHora(dias, hora)
    });

    $(".btn-borra-hora").click(function () {
        var id = $(this).data("hora");
        console.log("horario id:", id)
        borraHora(id)
    });

</script>
