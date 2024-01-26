package geografia

class Pais {

    String numero
    String nombre

    static auditable = true

    static mapping = {
        table 'pais'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'pais__id'
            numero column: 'paisnmro'
            nombre column: 'paisnmbr'
        }
    }
    static constraints = {
        numero(size: 1..2, blank: false, nullable: false)
        nombre(size: 3..63, blank: false, nullable: false)
    }

}