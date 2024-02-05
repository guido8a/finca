package finca


class ClienteController {

    def list() {
        def clientes = Cliente.list([sort: 'nombre'])
        return [clientes : clientes]
    }

    def form_ajax(){
        def cliente

        if(params.id){
            cliente = Cliente.get(params.id)
        }else{
            cliente = new Cliente()
        }

        return[cliente: cliente]
    }

    def saveCliente_ajax(){
        def cliente

        if(params.id){
            cliente = Cliente.get(params.id)
        }else{
            cliente = new Cliente()
        }

        cliente.properties = params

        if(!cliente.save(flush: true)){
            println("error al guardar el naviera " + cliente.errors)
            render "no_Error al guardar el cliente"
        }else{
            render "ok_Cliente guardado correctamente"
        }
    }

    def delete_ajax(){

        def cliente = Cliente.get(params.id)

        try{
            cliente.delete(flush:true)
            render "ok_Borrado correctamente"
        }catch(e){
            println("Error al borrar la cliente " + cliente.errors)
            render "no_Error al borrar el cliente"
        }
    }
}
