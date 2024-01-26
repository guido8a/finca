package finca

class ProductoxFinca {

    Finca finca
    Producto producto
    String etiqueta

    static auditable = true

    static mapping = {
        table 'prfn'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'prfn__id'
            finca column: 'fnca__id'
            producto column: 'prod__id'
            etiqueta column: 'prfnetqt'
        }
    }
    static constraints = {
        finca(blank: false, nullable: false)
        producto(blank: false, nullable: false)
        etiqueta(size: 0..63, blank: true, nullable: true)
    }

}