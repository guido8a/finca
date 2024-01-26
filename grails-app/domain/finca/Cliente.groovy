package finca

import geografia.Ciudad

class Cliente {

    Ciudad ciudad
    String nombre
    String mail

    static auditable = true

    static mapping = {
        table 'clnt'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'clnt__id'
            ciudad column: 'cdad__id'
            nombre column: 'clntnmbr'
            mail column: 'clntmail'
        }
    }
    static constraints = {
        mail(size: 1..63, blank: false, nullable: false)
        nombre(size: 3..127, blank: false, nullable: false)
    }

}