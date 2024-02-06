package finca

class DetalleFinca {

    Finca finca
    DetalleOrden detalleOrden
    int cantidad
    int estimado
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
            estimado column: 'dsfnestd'
            diferencia column: 'dsfndiff'
        }
    }
    static constraints = {
        finca(blank: false, nullable: false)
        detalleOrden(blank: false, nullable: false)
        cantidad(blank: false, nullable: false)
        estimado(blank: true, nullable: true)
        diferencia(blank: true, nullable: true)
    }

}