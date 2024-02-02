package finca

class Familia {

    String descripcion

    static auditable = true

    static mapping = {
        table 'faml'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'faml__id'
            descripcion column: 'famldscr'
        }
    }
    static constraints = {
        descripcion(size: 1..31 ,blank: false, nullable: false)
    }

}