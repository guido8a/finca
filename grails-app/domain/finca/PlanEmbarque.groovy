package finca

class PlanEmbarque {

    Naviera naviera
    Orden orden
    int cantidad

    static auditable = true

    static mapping = {
        table 'shpl'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'shpl__id'
            naviera column: 'navi__id'
            orden column: 'ordn__id'
            cantidad column: 'shplcntd'
        }
    }
    static constraints = {
        naviera(blank: false, nullable: false)
        orden(blank: false, nullable: false)
        cantidad(blank: false, nullable: false)
    }

}