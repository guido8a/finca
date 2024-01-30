package finca

class Orden {

    Cliente cliente
    Semana semana
    String estado  /* I ingresada, P en porceso, A aprobada*/

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
            estado column: 'ordnetdo'

        }
    }
    static constraints = {
        cliente(blank: false, nullable: false)
        semana(blank: false, nullable: false)
        estado(blank: false, nullable: false)
    }

}