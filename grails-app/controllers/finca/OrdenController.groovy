package finca

class OrdenController {

    def dbConnectionService

    def list(){
        def orden = Orden.list().sort{it.numero}
        return[orden: orden]
    }
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

        if(dtor?.estado != '1'){
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
        }else{
            render "no_La orden ya se encuentra registrada"
        }


    }

    def borrarProducto_ajax(){
        def dtor = DetalleOrden.get(params.id)

        try{
            dtor.delete(flush:true)
            render "ok_Producto borrado exitosamente"
        }catch(e){
            println("error al borrar el orden " + dtor.errors)
            render "no"
        }
    }

    def tablaOrden_ajax(){
        def cn = dbConnectionService.getConnection()
        def smna = Semana.get(params.smna)
        def ordn = Orden.findAllBySemana(smna)
        def sql = ""
        def detalle = []

        if(ordn.size() > 1) {
            flash.message("Error")
        } else if(ordn.size() == 1){
            sql = "select * from orden(1, ${ordn[0]?.semana.id})"
//            println "sql. $sql"
            detalle = cn.rows(sql.toString())
        }

        return [detalle: detalle, ordn: ordn, smna: smna]
    }

    def ordenDeCompra() {
        def clnt = Cliente.get(1)

        [cliente: clnt]
    }

    def prod_ajax(){
        println "prod_ajax: $params"
        def faml = Familia.get(params.faml)
        def prod   = Producto.findAllByFamilia(faml)
        return[prod: prod]
    }

    def distribuir_ajax(){
        def dtor = DetalleOrden.get(params.id)
        return[detalle: dtor]
    }

    def estimado_ajax(){
        def dtor = DetalleOrden.get(params.id)
        def detallesFincas = DetalleFinca.findAllByDetalleOrden(dtor)
        def estimado = detallesFincas.size() > 0 ? detallesFincas*.cantidad.sum() : 0
        def diferencia= dtor.cantidad - estimado?.toInteger()
        return[detalles: detallesFincas, estimado: estimado, diferencia: diferencia]
    }

    def fincas_ajax(){
        def dtor = DetalleOrden.get(params.id)
        def detallesFincas = DetalleFinca.findAllByDetalleOrden(dtor)
        def fincas = (detallesFincas.size() > 0 ? Finca.findAllByIdNotInList(detallesFincas*.finca*.id) : Finca.list([sort: 'nombre']))
        return [fincas: fincas]
    }

    def tablaDistribuir_ajax(){
        def dtor = DetalleOrden.get(params.id)
        def detallesFincas = DetalleFinca.findAllByDetalleOrden(dtor)
        return[detalles: detallesFincas]
    }

    def saveDistribuir_ajax(){

        println("params " + params)

        def dtor = DetalleOrden.get(params.dtor)
        def finca = Finca.get(params.finca)
        def detallesFincas = DetalleFinca.findAllByDetalleOrden(dtor)
        def estimado
        def diferencia
        def detalle

            if(params.id){
                def detallesOtros = DetalleFinca.findAllByDetalleOrdenAndIdNotEqual(dtor, params.id)
                estimado = detallesOtros.size() > 0 ? detallesOtros*.cantidad.sum() : 0
                estimado = estimado + params.cantidad.toInteger()
                diferencia= dtor.cantidad - estimado?.toInteger()

//                if(diferencia < 0){
//                    render "no_La cantidad ingresada es mayor a la diferencia disponible"
//                    return true
//                }else{
                    detalle = DetalleFinca.get(params.id)
//                }
            }else{

                estimado = detallesFincas.size() > 0 ? detallesFincas*.cantidad.sum() : 0
                diferencia= dtor.cantidad - estimado?.toInteger()

//                if(params.cantidad.toInteger() > diferencia){
//                    render "no_La cantidad ingresada es mayor a la diferencia disponible"
//                    return true
//                }else{

                    if(finca in detallesFincas.finca){
                        render "no_La finca ya contiene una cantidad ingresada"
                        return true
                    }else{
                        detalle = new DetalleFinca()
                        detalle.detalleOrden = dtor
                        detalle.finca = finca
                    }

//                }

            }

            detalle.cantidad = params.cantidad.toInteger()
            detalle.diferencia = (detalle?.estimado ?: 0) - params.cantidad.toInteger()

            if(!detalle.save(flush: true)){
                println("Error al guardar " + detalle.errors)
                render "no_Error al guardar"
            }else{
                render "ok_Guardado correctamente"
            }
    }

//    def saveDistribuir_ajax(){
//        def dtor = DetalleOrden.get(params.id)
//        def finca = Finca.get(params.finca)
//
//        def detalle = new DetalleFinca()
//        detalle.detalleOrden = dtor
//        detalle.finca = finca
//        detalle.cantidad = params.cantidad.toInteger()
//        detalle.diferencia = (detalle?.estimado ?: 0) - params.cantidad.toInteger()
//
//        if(!detalle.save(flush: true)){
//            println("Error al guardar " + detalle.errors)
//            render "no_Error al guardar"
//        }else{
//            render "ok_Guardado correctamente"
//        }
//    }

    def borrarDistribuir_ajax(){
        def detalle = DetalleFinca.get(params.id)

        if(detalle){
            try{
                detalle.delete(flush:true)
                render "ok_Borrado correctamente"
            }catch(e){
                println("Error al borrar " + detalle.errors)
                render "no_Error al borrar"
            }
        }else{
            render "no_Error al borrar"
        }
    }

    def registrarOrden_ajax() {
        def orden = DetalleOrden.get(params.id)
        if(orden){
            orden.estado = (orden.estado == '1' ? (orden.estado = '0') : (orden.estado = '1'))
            if(!orden.save(flush:true)){
                render "no_Error al registrar"
            }else{
                render "ok_Guardado correctamente"
            }
        }else{
            render "no_Error al registrar"
        }
    }

}
