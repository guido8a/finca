package finca

class Producto {

    String nombre
    String descripcion
    String sku
    int calb
    int size
    int unbx
    String tipo
    String brnd
    String labl
    String orga
    String fatr
    int peso
    String pack
    String cjpl

    static auditable = true

    static mapping = {
        table 'prod'
        cache usage: 'read-write', include: 'non-lazy'
        id generator: 'identity'
        version false

        columns {
            id column: 'prod__id'
            nombre column: 'prodnmbr'
            descripcion column: 'proddscr'
            sku column: 'prod_sku'
            calb column: 'prodcalb'
            size column: 'prodsize'
            unbx column: 'produnbx'
            brnd column: 'prodbrnd'
            labl column: 'prodlabl'
            orga column: 'prodorga'
            fatr column: 'prodfatr'
            peso column: 'prodpeso'
            pack column: 'prodpack'
            cjpl column: 'prodcjpl'
        }
    }
    static constraints = {
        nombre(size: 3..65, blank: false, nullable: false)
        descripcion(size: 0..255, blank: true, nullable: true)
        sku(size: 0..31, blank: true, nullable: true)
        calb(blank: true, nullable: true)
        size(blank: true, nullable: true)
        unbx(blank: true, nullable: true)
        tipo(size: 0..1, blank: true, nullable: true)
        brnd(size: 0..31, blank: true, nullable: true)
        labl(size: 0..31, blank: true, nullable: true)
        orga(size: 0..1, blank: true, nullable: true)
        fatr(size: 0..1, blank: true, nullable: true)
        peso(blank: true, nullable: true)
        pack(size: 0..31, blank: true, nullable: true)
        cjpl(blank: true, nullable: true)
    }

}