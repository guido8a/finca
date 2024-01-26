package utilitarios


class HerramientasController {

    def herramienta() {


    }

    def periodo_ajax(){
        def periodo = Periodo.get(params.periodo)
        def periodoFinal = Periodo.list([sort: 'descripcion']) - periodo
        return [periodoFinal: periodoFinal]
    }
}
