<g:if test="${existe}">
    <table class="table table-condensed table-bordered table-striped table-hover" style="margin-top: 20px; width: 100%">
        <thead style="text-align: center">
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


            %{--<g:if test="${h?.mar?.size() > 10}">--}%
                %{--<td width="10%" data-id="${h?.mar}"  class="${h?.mar?.split(';').size() > 1 ? 'otro' : 'usado'}">--}%
                    %{--${h.mar}--}%
                %{--</td>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
                %{--<td width="10%" class="horas libre"--}%
                    %{--data-dia="${h?.mar}" data-hora="${h?.mar}">--}%
                    %{--Libre--}%
                %{--</td>--}%
            %{--</g:else>--}%

            %{--<g:if test="${h?.mie?.size() > 10}">--}%
                %{--<td width="10%" data-id="${h?.mie}"  class="${h?.mie?.split(';').size() > 1 ? 'otro' : 'usado'}">--}%
                    %{--${h.mie}--}%
                %{--</td>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
                %{--<td width="10%" class="horas libre"--}%
                    %{--data-dia="${h?.mie}" data-hora="${h?.mie}">--}%
                    %{--Libre--}%
                %{--</td>--}%
            %{--</g:else>--}%

            %{--<g:if test="${h?.jue?.size() > 10}">--}%
                %{--<td width="10%" data-id="${h?.jue}"  class="${h?.jue?.split(';').size() > 1 ? 'otro' : 'usado'}">--}%
                    %{--${h.jue}--}%
                %{--</td>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
                %{--<td width="10%" class="horas libre"--}%
                    %{--data-dia="${h?.jue}" data-hora="${h?.jue}">--}%
                    %{--Libre--}%
                %{--</td>--}%
            %{--</g:else>--}%

            %{--<g:if test="${h?.vie?.size() > 10}">--}%
                %{--<td width="10%" data-id="${h?.vie}"  class="${h?.vie?.split(';').size() > 1 ? 'otro' : 'usado'}">--}%
                    %{--${h.vie}--}%
                %{--</td>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
                %{--<td width="10%" class="horas libre"--}%
                    %{--data-dia="${h?.vie}" data-hora="${h?.vie}">--}%
                    %{--Libre--}%
                %{--</td>--}%
            %{--</g:else>--}%

            %{--<g:if test="${h?.sab?.size() > 10}">--}%
                %{--<td width="10%" data-id="${h?.sab}"  class="${h?.sab?.split(';').size() > 1 ? 'otro' : 'usado'}">--}%
                    %{--${h.sab}--}%
                %{--</td>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
                %{--<td width="10%" class="horas libre"--}%
                    %{--data-dia="${h?.sab}" data-hora="${h?.sab}">--}%
                    %{--Libre--}%
                %{--</td>--}%
            %{--</g:else>--}%

            %{--<g:if test="${h?.dom?.size() > 10}">--}%
                %{--<td width="10%" data-id="${h?.dom}"  class="${h?.dom?.split(';').size() > 1 ? 'otro' : 'usado'}">--}%
                    %{--${h.dom}--}%
                %{--</td>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
                %{--<td width="10%" class="horas libre"--}%
                    %{--data-dia="${h?.dom}" data-hora="${h?.dom}">--}%
                    %{--Libre--}%
                %{--</td>--}%
            %{--</g:else>--}%

        </g:each>

        </tr>
        </tbody>
    </table>
</g:if>
<g:else>
    <div class="alert alert-danger" style="text-align: center"> <i class="fa fa-exclamation-triangle fa-2x text-info"></i>
        <strong style="font-size: 14px"> No se ha programado a este profesor  </strong>
    </div>
</g:else>


