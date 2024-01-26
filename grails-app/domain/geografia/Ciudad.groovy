package geografia

class Ciudad {

    Pais pais
    String numero
    String nombre

    static auditable = true

    static mapping = {
        table 'cdad'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'cdad__id'
            pais column: 'pais__id'
            numero column: 'cdadnmro'
            nombre column: 'cdadnmbr'
        }
    }
    static constraints = {
        pais(blank: false, nullable: false)
        numero(size: 1..4, blank: false, nullable: false)
        nombre(size: 3..63, blank: false, nullable: false)
    }

}