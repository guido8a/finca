package finca

class Distribucion {

    Finca finca
    DetalleOrden detalleOrden
    int cantidad
    int estado
    int diferencia

    static auditable = true

    static mapping = {
        table 'dsfn'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'dsfn__id'
            finca column: 'fnca__id'
            detalleOrden column: 'dtor__id'
            cantidad column: 'dsfncntd'
            estado column: 'dsfnestd'
            diferencia column: 'dsfndiff'
        }
    }
    static constraints = {
        finca(blank: false, nullable: false)
        detalleOrden(blank: false, nullable: false)
        cantidad(blank: false, nullable: false)
        estado(blank: false, nullable: false)
        diferencia(blank: true, nullable: true)
    }

}