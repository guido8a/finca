
<%@ page contentType="text/html" %>

<html>
<head>
    <meta name="layout" content="main"/>
    <title>Reportes</title>

    <style type="text/css">

    .tab-content, .left, .right {
        height : 500px;
    }

    .tab-content {
        background    : #EEEEEE;
        border-left   : solid 1px #DDDDDD;
        border-bottom : solid 1px #DDDDDD;
        border-right  : solid 1px #DDDDDD;
        padding-top   : 10px;
    }

    .descripcion {
        /*margin-left : 20px;*/
        font-size : 12px;
        border    : solid 2px cadetblue;
        padding   : 0 10px;
        margin    : 0 10px 0 0;
    }

    .info {
        font-style : italic;
        color      : navy;
    }

    .descripcion h4 {
        color      : cadetblue;
        text-align : center;
    }

    .left {
        width : 600px;
        text-align: justify;
        /*background : red;*/
    }

    .right {
        width       : 300px;
        margin-left : 20px;
        padding: 20px;
        /*background  : blue;*/
    }

    .fa-ul li {
        margin-bottom : 10px;
    }

    .example_c {
        color: #808b9d !important;
        /*text-transform: uppercase;*/
        text-decoration: none;
        background: #ffffff;
        padding: 20px;
        border: 4px solid #78b665 !important;
        display: inline-block;
        transition: all 0.4s ease 0s;
    }

    .example_c:hover {
        color: #ffffff !important;
        background: #f6b93b;
        border-color: #f6b93b !important;
        transition: all 0.4s ease 0s;
    }


    .mensaje {
        color: #494949 !important;
        /*text-transform: uppercase;*/
        text-decoration: none;
        background: #ffffff;
        padding: 20px;
        border: 4px solid #f6b93b !important;
        display: inline-block;
        transition: all 0.4s ease 0s;
    }

    </style>


</head>

<body>

<elm:flashMessage tipo="${flash.tipo}" icon="${flash.icon}"
                  clase="${flash.clase}">${flash.message}</elm:flashMessage>

<g:set var="iconGen" value="fa fa-cog"/>
<g:set var="iconEmpr" value="fa fa-building-o"/>

<ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#generales">Reportes</a></li>
</ul>

<div class="tab-content">
    <div id="generales" class="tab-pane fade in active">

        <div class="row">
            <div class="col-md-12 col-xs-5">
                <p>
                    <a href="#" id="btnProfesoresExcel" class="btn btn-info btn-ajax example_c item" texto="fnca">
                        <i class="fa fa-file-excel fa-4x text-success"></i>
                        <br/> Reporte
                    </a>
                </p>

            </div>
        </div>


    </div>

    <div id="tool" style="margin-left: 350px; width: 300px; height: 160px; display: none;padding:25px;"
         class="ui-widget-content ui-corner-all mensaje">
    </div>

</div>

<div id="fnca" style="display:none">
    <h3>Reporte Excel de órdenes de compra</h3><br>
    <p>Listado de órdenes</p>
</div>

<div id="envíos" style="display:none">
    <h3>Reporte Excel de envíos</h3><br>
    <p>Horario</p>
</div>



<script type="text/javascript">

    $("#btnProfesoresExcel").click(function () {

        $.ajax({
            type    : "POST",
            url: "${createLink(action:'profesores_ajax')}",
            data    : {},
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgImpProfesores",
                    title   : "Reporte",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        guardar  : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-print'></i> Reporte",
                            className : "btn-success",
                            callback  : function () {
                                var profesor = $("#profesor option:selected").val();
                                var prdo = $("#periodo option:selected").val();
                                var arch = $("#separados").is(":checked")
                                location.href="${createLink(controller: 'reportes', action: 'reportePofesoresExcel')}?profesor=" +
                                    profesor + "&prdo=" + prdo + "&arch=" + arch
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    });

    $("#btnHorarioExcel").click(function () {
        $.ajax({
            type    : "POST",
            url: "${createLink(action:'horario_ajax')}",
            data    : {},
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgImpHorario",
                    title   : "Reporte de horario",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        guardar  : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-print'></i> Imprimir",
                            className : "btn-success",
                            callback  : function () {
                                var paralelo = $("#paralelo option:selected").val();
                                var asignatura = $("#asignatura option:selected").val();
                                if(paralelo){
                                    location.href="${createLink(controller: 'reportes', action: 'reporteHorarioExcel')}?paralelo=" + paralelo + "&asignatura=" + asignatura
                                }else{
                                    bootbox.alert( '<div style="text-align: center">' + '<i class="fa fa-exclamation-triangle fa-2x text-danger"></i>'  + '<strong style="font-size: 14px">' + "Seleccione un paralelo" +  '</strong>' + '</div>')
                                    return false
                                }
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    });

    $("#btnPeriodoExcel").click(function () {
        location.href="${createLink(controller: 'reportes', action: 'reportePeriodoExcel')}"
    });

    function prepare() {
        $(".fa-ul li span").each(function () {
            var id = $(this).parents(".tab-pane").attr("id");
            var thisId = $(this).attr("id");
            $(this).siblings(".descripcion").addClass(thisId).addClass("ui-corner-all").appendTo($(".right." + id));
        });
    }

    $(function () {
        prepare();
        $(".fa-ul li span").hover(function () {
            var thisId = $(this).attr("id");
            $("." + thisId).removeClass("hide");
        }, function () {
            var thisId = $(this).attr("id");
            $("." + thisId).addClass("hide");
        });
    });

    $(document).ready(function () {
        $('.item').hover(function () {
            $('#tool').html($("#" + $(this).attr('texto')).html());
            $('#tool').show();
        }, function () {
            $('#tool').hide();
        });
    });
</script>
</body>
</html>
