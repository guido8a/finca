package finca

class OrdenController {

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
        println "tablaOrdn: ${params}"
        def smna = Semana.get(params.smna)
        def ordn = Orden.findAllBySemana(smna)
        def detalle

        if(ordn.size() > 1) {
            flash.message("Error")
        } else {
            detalle = DetalleOrden.findAllByOrden(ordn, [sort: 'producto.nombre'])
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
        def dtor = DetalleOrden.get(params.id)
        def finca = Finca.get(params.finca)
        def detallesFincas = DetalleFinca.findAllByDetalleOrden(dtor)
        def estimado = detallesFincas.size() > 0 ? detallesFincas*.cantidad.sum() : 0
        def diferencia= dtor.cantidad - estimado?.toInteger()

        if(params.cantidad.toInteger() > diferencia){
            render "no_La cantidad ingresada es mayor a la diferencia disponible"
            return true
        }else{
            def detalle = new DetalleFinca()
            detalle.detalleOrden = dtor
            detalle.finca = finca
            detalle.cantidad = params.cantidad.toInteger()

            if(!detalle.save(flush: true)){
                println("Error al guardar " + detalle.errors)
                render "no_Error al guardar"
            }else{
                render "ok_Guardado correctamente"
            }
        }
    }

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

}
