package finca

class ProductoController {

    def list(){

    }

    def tablaProductos_ajax(){
        def productos
        if(params.nombre){
            productos = Producto.findAllByNombreIlike('%' + params.nombre + '%').sort{it.nombre}
        }else{
            productos = Producto.list([sort: 'nombre'])
        }
        return[productos: productos]
    }

    def form_ajax() {
        def producto

        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
        }

        return[producto: producto]
    }

    def saveProducto_ajax(){
        def producto

        if(params.id){
            producto = Producto.get(params.id)
        }else{
            producto = new Producto()
        }

        producto.properties = params

        if(!producto.save(flush: true)){
            println("error al guardar el producto " + producto.errors)
            render "no_Error al guardar el producto"
        }else{
            render "ok_Producto guardado correctamente"
        }
    }

    def delete_ajax(){

        def producto = Producto.get(params.id)

        try{
            producto.delete(flush:true)
            render "ok_Borrado correctamente"
        }catch(e){
            println("Error al borrar el producto " + producto.errors)
            render "no_Error al borrar el producto"
        }
    }

    def show_ajax(){
        def producto = Producto.get(params.id)
        return[producto: producto]
    }

    def finca_ajax(){
        def producto = Producto.get(params.id)
        def productosxfinca = ProductoxFinca.findAllByProducto(producto)
        def fincas
        if(productosxfinca.size() > 0){
            fincas = Finca.findAllByIdNotInList(productosxfinca.finca.id)
        }else{
            fincas = Finca.list()
        }

        return [fincas: fincas]
    }

    def productosXfinca_ajax(){
        def producto = Producto.get(params.id)
        return[producto: producto]
    }

    def tablaFXC_ajax(){
        def producto = Producto.get(params.id)
        def productosxfinca = ProductoxFinca.findAllByProducto(producto)
        return[productos: productosxfinca]
    }

    def etiqueta_ajax(){
        def producto = Producto.get(params.producto)
        def finca = Finca.get(params.finca)
        def pxf

        if(params.id){
            pxf = ProductoxFinca.get(params.id)
        }else{
            pxf = new ProductoxFinca()
        }

        return[finca: finca, producto: producto, pxf: pxf]
    }

    def saveFXC_ajax(){
        def producto = Producto.get(params.producto)
        def finca = Finca.get(params.finca)
        def pxf
        if(params.id){
            pxf = ProductoxFinca.get(params.id)
        }else{
            pxf = new ProductoxFinca()
            pxf.producto = producto
            pxf.finca = finca
        }

        pxf.etiqueta = params.etiqueta

        if(!pxf.save(flush:true)){
            println(" " + pxf.errors)
            render "no_Error al guardar"
        }else{
            render "ok_Guardado correctamente"
        }
    }

    def deletePxF_ajax() {
        def pxf = ProductoxFinca.get(params.id)

        try{
            pxf.delete(flush: true)
            render "ok_Borrado correctamente"
        }catch(e){
            println("error al borrar " + pxf.errors)
            render "no_Error al borrar"
        }
    }

}
