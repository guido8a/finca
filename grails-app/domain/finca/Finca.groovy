package finca

import audita.Auditable
import geografia.Ciudad

class Finca implements Auditable{

    Ciudad ciudad
    String ruc
    String nombre
    String direccion
    String telefono
    String mail
    Date fechaInicio
    Date fechaFin

    static auditable = true

    static mapping = {
        table 'fnca'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'fnca__id'
            ciudad column: 'cdad__id'
            ruc column: 'fnca_ruc'
            nombre column: 'fncanmbr'
            direccion column: 'fncadire'
            telefono column: 'fncatelf'
            mail column: 'fncamail'
            fechaInicio column: 'fncafcin'
            fechaFin column: 'fncafcfn'
        }
    }
    static constraints = {
        ciudad(blank: false, nullable: false)
        ruc(size: 0..13, blank: false, nullable: false)
        nombre(size: 3..63, blank: false, nullable: false)
        direccion(size: 0..255, blank: true, nullable: true)
        telefono(size: 0..63, blank: true, nullable: true)
        mail(size: 0..63, blank: true, nullable: true)
        fechaInicio(blank: true, nullable: true)
        fechaFin(blank: true, nullable: true)
    }

}