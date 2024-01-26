package finca

class Orden {

    Cliente cliente
    Semana semana
    int cantidad

    static auditable = true

    static mapping = {
        table 'ordn'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'ordn__id'
            cliente column: 'clnt__id'
            semana column: 'smna__id'
            cantidad column: 'ordncntd'

        }
    }
    static constraints = {
        cliente(blank: false, nullable: false)
        semana(blank: false, nullable: false)
        cantidad(blank: false, nullable: false)
    }

}