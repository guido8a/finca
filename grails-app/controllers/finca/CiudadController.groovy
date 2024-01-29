package finca

import geografia.Ciudad

class CiudadController {

    def list(){
        def ciudad = Ciudad.list().sort{it.numero}
        return[ciudad: ciudad]
    }
     def form_ajax(){

        def ciudad
         def countries = [] as SortedSet

         Locale.availableLocales*.displayCountry.each {
             if (it) {
                 countries << it
             }
         }

        if(params.id){
            ciudad = Ciudad.get(params.id)
        }else{
            ciudad = new Ciudad()
        }

        return[ciudad: ciudad, paises: countries]
    }

    def saveDia_ajax(){
        println "guarda Dia. Paràmetros: $params"
        def ciudad

        if(params.id){
            ciudad = Ciudad.get(params.id)
        }else{
            ciudad = new Ciudad()
        }

        ciudad.properties = params
        ciudad.pais = params."pais.id"
        if(!ciudad.save(flush:true)){
            println("error al guardar la ciudad " + ciudad.errors)
            render "no"
        }else{
            println "errores: ${ciudad.errors}"
            render "ok"
        }
    }
    def delete_ajax(){
        def ciudad = Ciudad.get(params.id)

        try{
            // con el lazy tiene algo q ver
            ciudad.delete(flush:true)
            render "ok"
        }catch(e){
            println("error al borrar el ciudad " + ciudad.errors)
            render "no"
        }
    }

    def show_ajax() {
        def cdad = Ciudad.get(params.id)
        return [cdad: cdad]
    }

}
