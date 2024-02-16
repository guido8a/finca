package finca

import seguridad.Persona

class DistribucionController {

    def dbConnectionService

    def form_ajax(){

        def orden
        def countries = [] as SortedSet

        Locale.availableLocales*.displayCountry.each {
            if (it) {
                countries << it
            }
        }

        if(params.id){
            orden = Orden.get(params.id)
        }else{
            orden = new Orden()
        }

        return[orden: orden, paises: countries]
    }

    def save_ajax(){
        println "save. Parámetros: $params"
        def smna = Semana.get(params.smna)
        def prod = Producto.get(params.prod)
        def orden = Orden.findBySemana(smna)
        def dtor = DetalleOrden.findByOrdenAndProducto(orden, prod) //hacer get con ID

        if(!orden){
            orden = new Orden()
            orden.semana = smna
            orden.cliente = Cliente.get(1)
            orden.estado = 'I'
        }

        try {
            orden.save(flush: true)
        } catch (e) {
            println("error al crear la orden " + orden.errors)
        }

        if(!dtor){
            dtor = new DetalleOrden()
        }

        dtor.orden = orden
        dtor.producto = Producto.get( params.prod.toInteger() )
        dtor.cantidad = params.cntd.toInteger()

        if(!dtor.save(flush:true)){
            println("error al guardar el detalle de la orden " + dtor.errors)
            render "no"
        }else{
            render "ok_Producto actualizado exitosamente"
        }
    }

    def tablaFinca_ajax(){
//        println "tablaFinca: ${params}"
        def cn = dbConnectionService.getConnection()
        def smna = Semana.get(params.smna)
        def ordn = Orden.findAllBySemana(smna)
        def usro = Persona.get(session.usuario.id)
        def sql = ""
        def detalle = []

//        println "ordn: ${ordn.size()}"
        if(ordn.size() > 1) {
            flash.message("Error")
        } else if(ordn.size() == 1){
            sql = "select * from fincas(1, ${ordn[0]?.semana?.id}, ${usro?.finca?.id})"
            println "sql. $sql"
            detalle = cn.rows(sql.toString())
        }

//        println "--> $detalle"
        return [detalle: detalle, ordn: ordn, smna: smna]
    }

    def confirma() {
        def usro = Persona.get(session.usuario.id)
        println "usuario: $usro"

        [usro: usro]
    }

    def confirmar_ajax(){
        def detalle = DetalleFinca.get(params.id)
        return [detalle: detalle]
    }

    def estimadoConfirmar_ajax(){
        def detalleFincas = DetalleFinca.get(params.id)
        def diferencia = detalleFincas.estimado -  detalleFincas.cantidad
        return[detalle: detalleFincas, diferencia: diferencia]
    }

    def saveConfirmar_ajax() {
        def detalleFincas = DetalleFinca.get(params.id)

        if(detalleFincas){
            detalleFincas.estimado = params.cantidad.toInteger()
            detalleFincas.diferencia = params.cantidad.toInteger() -  detalleFincas.cantidad
        }else{
            render "no_Error al guardar la cantidad"
        }
    }


}
