package finca

class Naviera {

    String nombre

    static auditable = true

    static mapping = {
        table 'navi'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'navi__id'
            nombre column: 'navinmbr'
        }
    }
    static constraints = {
        nombre(size: 1..63 ,blank: false, nullable: false)
    }

}