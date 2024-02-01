package finca


class NavieraController {

    def list(){

    }

    def form_ajax(){
        def naviera

        if(params.id){
            naviera = Naviera.get(params.id)
        }else{
            naviera = new Naviera()
        }

        return[naviera: naviera]
    }

    def tablaNaviera_ajax(){
        def navieras
        if(params.nombre){
            navieras = Naviera.findAllByNombreIlike('%' + params.nombre + '%').sort{it.nombre}
        }else{
            navieras = Naviera.list([sort: 'nombre'])
        }
        return[navieras: navieras]
    }

    def saveNaviera_ajax(){
        def naviera

        if(params.id){
            naviera = Naviera.get(params.id)
        }else{
            naviera = new Naviera()
        }

        naviera.properties = params

        if(!naviera.save(flush: true)){
            println("error al guardar el naviera " + naviera.errors)
            render "no_Error al guardar la naviera"
        }else{
            render "ok_Naviera guardado correctamente"
        }
    }

    def delete_ajax(){

        def  naviera = Naviera.get(params.id)

        try{
            naviera.delete(flush:true)
            render "ok_Borrado correctamente"
        }catch(e){
            println("Error al borrar la naviera " + naviera.errors)
            render "no_Error al borrar la naviera"
        }
    }
}
