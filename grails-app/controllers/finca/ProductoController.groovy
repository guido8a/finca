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

}
