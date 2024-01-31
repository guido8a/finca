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

    def saveFinca_ajax(){

        def finca

        if(params.fechaInicio){
            params.fechaInicio = new Date().parse("dd-MM-yyyy", params.fechaInicio)
        }

        if(params.fechaFin){
            params.fechaFin = new Date().parse("dd-MM-yyyy", params.fechaFin)
        }

        if(params.id){
            finca = Finca.get(params.id)
        }else{
            finca = new Finca()
        }

        finca.properties = params

        if(!finca.save(flush:true)){
            println("Error al guardar la finca " + finca.errors)
            render "no_Error al guardar la finca"
        }else{
            render "ok_Guardado correctamente"
        }
    }

    def delete_ajax(){

        def finca = Finca.get(params.id)

        try{
            finca.delete(flush:true)
            render "ok_Borrado correctamente"
        }catch(e){
            println("Error al borrar la finca " +  finca.errors)
            render "no_Error al borrar la finca"
        }
    }


}
