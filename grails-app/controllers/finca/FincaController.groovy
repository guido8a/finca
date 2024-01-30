package finca


class FincaController {

    def list() {

    }

    def form_ajax(){
        def finca

        if(params.id){
            finca = Finca.get(params.id)
        }else{
            finca = new Finca()
        }

        return[finca: finca]
    }

    def tablaFincas_ajax(){
        def fincas
        if(params.nombre){
            fincas = Finca.findAllByNombreIlike('%' + params.nombre + '%').sort{it.nombre}
        }else{
            fincas = Finca.list([sort: 'nombre'])
        }
        return[fincas: fincas]
    }


}
