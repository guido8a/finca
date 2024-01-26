package finca

class DetalleOrden {

    Orden orden
    Producto producto
    int cantidad

    static auditable = true

    static mapping = {
        table 'dtor'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'dtor__id'
            orden column: 'ordn__id'
            producto column: 'prod__id'
            cantidad column: 'dtorcntd'

        }
    }
    static constraints = {
        orden(blank: false, nullable: false)
        producto(blank: false, nullable: false)
        cantidad(blank: false, nullable: false)
    }

}