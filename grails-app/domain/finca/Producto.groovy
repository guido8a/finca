package finca

class Producto {

    Familia familia
    String nombre
    String descripcion
    String sku
    int calibre
    int size
    int unindadesCaja
    String tipo
    String marca
    String etiqueta
    String organico
    String fairTrade
    int peso
    String empaque
    int cajasPalet

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
            calibre column: 'prodcalb'
            size column: 'prodsize'
            unindadesCaja column: 'produnbx'
            tipo column: 'prodtipo'
            marca column: 'prodbrnd'
            etiqueta column: 'prodlabl'
            organico column: 'prodorga'
            fairTrade column: 'prodfatr'
            peso column: 'prodpeso'
            empaque column: 'prodpack'
            cajasPalet column: 'prodcjpl'
            familia column: 'faml__id'
        }
    }
    static constraints = {
        nombre(size: 3..65, blank: false, nullable: false)
        descripcion(size: 0..255, blank: true, nullable: true)
        sku(size: 0..31, blank: true, nullable: true)
        calibre(blank: true, nullable: true)
        size(blank: true, nullable: true)
        tipo(size: 0..1, blank: true, nullable: true)
        marca(size: 0..31, blank: true, nullable: true)
        etiqueta(size: 0..31, blank: true, nullable: true)
        organico(size: 0..1, blank: true, nullable: true)
        fairTrade(size: 0..1, blank: true, nullable: true)
        peso(blank: true, nullable: true)
        empaque(size: 0..31, blank: true, nullable: true)
        unindadesCaja(blank: true, nullable: true)
        cajasPalet(blank: true, nullable: true)
        familia(blank: false, nullable: false)
    }

}