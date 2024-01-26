package pdf

import jxl.WorkbookSettings
import jxl.write.Label
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook
import org.apache.poi.hssf.usermodel.HSSFClientAnchor
import org.apache.poi.hssf.usermodel.HSSFPatriarch
import org.apache.poi.hssf.usermodel.HSSFSimpleShape
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.*
import org.apache.poi.xssf.usermodel.XSSFCellStyle
import org.apache.poi.xssf.usermodel.XSSFFont
import org.apache.poi.xssf.usermodel.XSSFWorkbook


class ReportesController {

    def dbConnectionService

    def reportes(){

    }


    def circulo () {

//        Workbook wb = new HSSFWorkbook()
//        OutputStream os = new FileOutputStream("Javatpoint.xls")
//        Sheet sheet = wb.createSheet("Sheet");
//        Row row = sheet.createRow(4); // Creating a row
//        Cell cell = row.createCell(1); // Creating a cell
//        HSSFPatriarch patriarch = (HSSFPatriarch) sheet.createDrawingPatriarch();
//        HSSFClientAnchor  a = new HSSFClientAnchor( 0, 0, 1023, 255, (short) 1, 0, (short) 1, 0 );
//        HSSFSimpleShape shape = patriarch.createSimpleShape(a);
//        shape.setShapeType(HSSFSimpleShape.OBJECT_TYPE_OVAL);
//                wb.write(os);



        Workbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet("Data Validation");
        HSSFPatriarch patriarch = (HSSFPatriarch) sheet.createDrawingPatriarch();
        HSSFClientAnchor a = new HSSFClientAnchor( 0, 0, 1023, 255, (short) 1, 0, (short) 2, 1 );
        HSSFSimpleShape shape1 = patriarch.createSimpleShape(a);
        shape1.setShapeType(HSSFSimpleShape.OBJECT_TYPE_OVAL);
        shape1.setLineStyleColor(10,10,10);
        shape1.setFillColor(90,10,200);
//            shape1.setLineWidth(HSSFShape.LINEWIDTH_ONE_PT * 3);
//            shape1.setLineStyle(HSSFShape.LINESTYLE_DOTSYS);
        FileOutputStream fileOut = new FileOutputStream("XLDrawingShape.xls");
        try {
            workbook.write(fileOut);
            fileOut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    def reporteFincaExcel(){

        def fincas = Finca.list().sort{it.nombre}

        //excel
        WorkbookSettings workbookSettings = new WorkbookSettings()
        workbookSettings.locale = Locale.default

        def file = File.createTempFile('myExcelDocument', '.xls')
        file.deleteOnExit()

        WritableWorkbook workbook = jxl.Workbook.createWorkbook(file, workbookSettings)
        WritableFont font = new WritableFont(WritableFont.ARIAL, 12)
        WritableCellFormat formatXls = new WritableCellFormat(font)

        def row = 0
        WritableSheet sheet = workbook.createSheet('finca', 0)
        WritableSheet sheet2 = workbook.createSheet('areasProduccion', 1)
        WritableSheet sheet3 = workbook.createSheet('trabajoFamiliar', 2)
        WritableSheet sheet4 = workbook.createSheet('manejoCultivos', 3)
        WritableSheet sheet5 = workbook.createSheet('manejoEnfermedades', 4)
        WritableSheet sheet6 = workbook.createSheet('controlPlagas', 5)
        WritableSheet sheet7 = workbook.createSheet('manejoForestal', 6)
        WritableSheet sheet8 = workbook.createSheet('manejoAnimales', 7)
        WritableSheet sheet9 = workbook.createSheet('cargos', 8)
        WritableSheet sheet10 = workbook.createSheet('obras', 9)
        WritableSheet sheet11 = workbook.createSheet('infraestructura', 10)
        WritableSheet sheet12 = workbook.createSheet('capacitacion', 11)
//        sheet.setRowView(4,34)


        //DATOS FINCA

        // fija el ancho de la columna
        sheet.setColumnView(0,30)
        sheet.setColumnView(1,30)
        sheet.setColumnView(2,30)
        sheet.setColumnView(3,30)
        sheet.setColumnView(4,30)
        sheet.setColumnView(5,30)
        sheet.setColumnView(6,30)
        sheet.setColumnView(7,30)
        sheet.setColumnView(8,30)
        sheet.setColumnView(9,30)
        sheet.setColumnView(10,30)
        sheet.setColumnView(11,30)
        sheet.setColumnView(12,30)
        sheet.setColumnView(13,30)
        sheet.setColumnView(14,30)
        sheet.setColumnView(15,30)
        sheet.setColumnView(16,30)
        sheet.setColumnView(17,30)
        sheet.setColumnView(18,30)
        sheet.setColumnView(19,30)
        sheet.setColumnView(20,30)
        sheet.setColumnView(21,30)
        sheet.setColumnView(22,30)
        sheet.setColumnView(23,30)
        sheet.setColumnView(24,30)
        sheet.setColumnView(25,30)
        sheet.setColumnView(26,30)
        sheet.setColumnView(27,30)
        sheet.setColumnView(28,30)
        sheet.setColumnView(29,30)
        sheet.setColumnView(30,30)
        sheet.setColumnView(31,30)
        sheet.setColumnView(32,30)
        sheet.setColumnView(33,30)
        sheet.setColumnView(34,30)
        sheet.setColumnView(35,30)
        sheet.setColumnView(36,30)
        sheet.setColumnView(37,30)
        sheet.setColumnView(38,30)
        sheet.setColumnView(39,30)
        sheet.setColumnView(40,30)
        sheet.setColumnView(41,30)
        sheet.setColumnView(42,30)
        sheet.setColumnView(43,30)
        sheet.setColumnView(44,30)
        sheet.setColumnView(45,30)
        sheet.setColumnView(46,30)
        sheet.setColumnView(47,30)
        sheet.setColumnView(48,30)
        sheet.setColumnView(49,30)
        sheet.setColumnView(50,30)
        sheet.setColumnView(51,30)
        sheet.setColumnView(52,30)

        WritableFont times16font = new WritableFont(WritableFont.TIMES, 11, WritableFont.BOLD, false);
        WritableFont times16fontNormal = new WritableFont(WritableFont.TIMES, 11, WritableFont.NO_BOLD, false);
        WritableCellFormat times16format = new WritableCellFormat(times16font);
        WritableCellFormat times16Normal = new WritableCellFormat(times16fontNormal);

//        autoSizeColumns(sheet, 10)

        def label
        def number
        def fila = 4;

        label = new Label(0, 1, "DATOS DE LA FINCA", times16format); sheet.addCell(label);
        label = new Label(0, 2, "", times16format); sheet.addCell(label);
        label = new Label(0, 3, "NOMBRE", times16format); sheet.addCell(label);
        label = new Label(1, 3, "CANTÓN", times16format); sheet.addCell(label);
        label = new Label(2, 3, "PARROQUIA", times16format); sheet.addCell(label);
        label = new Label(3, 3, "COMUNIDAD", times16format); sheet.addCell(label);
        label = new Label(4, 3, "ORGANIZACIÓN", times16format); sheet.addCell(label);
        label = new Label(5, 3, "INSTITUCIÓN DE APOYO", times16format); sheet.addCell(label);
        label = new Label(6, 3, "FECHA", times16format); sheet.addCell(label);
        label = new Label(7, 3, "PROPIETARIO", times16format); sheet.addCell(label);
        label = new Label(8, 3, "DELEGADO", times16format); sheet.addCell(label);
        label = new Label(9, 3, "PROMOTOR", times16format); sheet.addCell(label);
        label = new Label(10, 3, "DIRECCIÓN", times16format); sheet.addCell(label);
        label = new Label(11, 3, "ALTITUD", times16format); sheet.addCell(label);
        label = new Label(12, 3, "LONGITUD", times16format); sheet.addCell(label);
        label = new Label(13, 3, "LATITUD", times16format); sheet.addCell(label);
        label = new Label(14, 3, "ZONA", times16format); sheet.addCell(label);
        label = new Label(15, 3, "PLAN DE MANEJO", times16format); sheet.addCell(label);
        label = new Label(16, 3, "ACTIVIDAD AGRICOLA (%)", times16format); sheet.addCell(label);
        label = new Label(17, 3, "ACTIVIDAD PECUARIA (%)", times16format); sheet.addCell(label);
        label = new Label(18, 3, "JORNALEROS PERMANENTES", times16format); sheet.addCell(label);
        label = new Label(19, 3, "JORNALEROS TEMPORALES", times16format); sheet.addCell(label);
        label = new Label(20, 3, "ENTREVISTADOR", times16format); sheet.addCell(label);
        label = new Label(21, 2, "MANEJO DE SUELOS", times16format); sheet.addCell(label);
        label = new Label(21, 3, "PREPARACIÓN DEL SUELO", times16format); sheet.addCell(label);
        label = new Label(22, 3, "FERTILIZACIÓN DEL SUELO", times16format); sheet.addCell(label);
        label = new Label(23, 3, "FERTILIZACIÓN COMPLEMENTARIA", times16format); sheet.addCell(label);
        label = new Label(24, 3, "MANEJO DE RASTROJOS", times16format); sheet.addCell(label);
        label = new Label(25, 2, "MANEJO DE CULTIVOS", times16format); sheet.addCell(label);
        label = new Label(25, 3, "HACE ASOCIACIÓN DE CULTIVOS", times16format); sheet.addCell(label);
        label = new Label(26, 3, "HACE ROTACIÓN DE CULTIVOS", times16format); sheet.addCell(label);
        label = new Label(27, 3, "HACE SELECCIÓN DE SEMILLAS", times16format); sheet.addCell(label);
        label = new Label(28, 3, "USA SEMILLAS PROPIAS", times16format); sheet.addCell(label);
        label = new Label(29, 3, "USA SEMILLAS COMPRADAS", times16format); sheet.addCell(label);
        label = new Label(30, 3, "USA SEMILLAS DE INTERCAMBIO", times16format); sheet.addCell(label);
        label = new Label(31, 3, "REALIZA CALENDARIZACIÓN DE CULTIVOS", times16format); sheet.addCell(label);
        label = new Label(32, 3, "ÁREA DE INVERNADERO (M2)", times16format); sheet.addCell(label);

        label = new Label(33, 2, "MANEJO DEL AGUA", times16format); sheet.addCell(label);

        label = new Label(33, 3, "TIENE AGUA DE  RIEGO", times16format); sheet.addCell(label);
        label = new Label(34, 3, "PERTENECE A JUNTA RIEGO", times16format); sheet.addCell(label);
        label = new Label(35, 3, "FUENTE DE AGUA", times16format); sheet.addCell(label);
        label = new Label(36, 3, "INFR. DE RIEGO", times16format); sheet.addCell(label);

        label = new Label(37, 2, "MANEJO FORESTAL", times16format); sheet.addCell(label);
        label = new Label(37, 3, "ESPECIES FORESTALES", times16format); sheet.addCell(label);
        label = new Label(38, 3, "PÁRAMO O MONTE", times16format); sheet.addCell(label);

        label = new Label(39, 2, "MANEJO DE ANIMALES", times16format); sheet.addCell(label);
        label = new Label(39, 3, "FINCA PASTO", times16format); sheet.addCell(label);
        label = new Label(40, 3, "ABONA PASTOS CON", times16format); sheet.addCell(label);
        label = new Label(41, 3, "MANEJO DE PASTOS", times16format); sheet.addCell(label);
        label = new Label(42, 3, "INSALACIONES", times16format); sheet.addCell(label);
        label = new Label(43, 3, "SANITARIO", times16format); sheet.addCell(label);
        label = new Label(44, 3, "USA PRÁCTICAS ANCESTRALES", times16format); sheet.addCell(label);

        label = new Label(45, 2, "MANEJO DE AMBIENTE Y PRODUCCIÓN", times16format); sheet.addCell(label);
        label = new Label(45, 3, "BASURA %", times16format); sheet.addCell(label);
        label = new Label(46, 3, "AUTOCONSUMO %", times16format); sheet.addCell(label);
        label = new Label(47, 3, "VENTA %", times16format); sheet.addCell(label);
        label = new Label(48, 3, "DONDE VENDE", times16format); sheet.addCell(label);
        label = new Label(49, 3, "CADA QUE TIEMPO VENDE", times16format); sheet.addCell(label);

        label = new Label(50, 2, "PARTICIPACIÓN", times16format); sheet.addCell(label);
        label = new Label(50, 3, "MIEMBRO ACTIVO DE ORGANIZACIÓN", times16format); sheet.addCell(label);
        label = new Label(51, 2, "CRITERIO DEL PROMOTOR", times16format); sheet.addCell(label);
        label = new Label(51, 3, "LA FINCA SE CONSIDERA", times16format); sheet.addCell(label);


        fincas.each { f ->

            label = new Label(0, fila, (f?.nombre ? f?.nombre : ''), times16Normal); sheet.addCell(label);
            label = new Label(1, fila, (f?.parroquia?.canton?.nombre ? f?.parroquia?.canton?.nombre : ''), times16Normal); sheet.addCell(label);
            label = new Label(2, fila, (f?.parroquia?.nombre ? f?.parroquia?.nombre : ''), times16Normal); sheet.addCell(label);
            label = new Label(3, fila, (f?.comunidad ? f?.comunidad : ''), times16Normal); sheet.addCell(label);
            label = new Label(4, fila, (f?.organizacion ? f?.organizacion : ''), times16Normal); sheet.addCell(label);
            label = new Label(5, fila, (f?.institucion?.nombre ? f?.institucion?.nombre : ''), times16Normal); sheet.addCell(label);
            label = new Label(6, fila, (f?.fecha ? f?.fecha?.format("dd-MM-yyyy") : ''), times16Normal); sheet.addCell(label);
            label = new Label(7, fila, (f?.propietario ? f?.propietario : ''), times16Normal); sheet.addCell(label);
            label = new Label(8, fila, (f?.delegado ? f?.delegado : ''), times16Normal); sheet.addCell(label);
            label = new Label(9, fila, (f?.promotor ? f?.promotor : ''), times16Normal); sheet.addCell(label);
            label = new Label(10, fila, (f?.direccion ? f?.direccion : ''), times16Normal); sheet.addCell(label);
            number = new jxl.write.Number(11, fila, f?.altura ? f?.altura : 0); sheet.addCell(number);
            number = new jxl.write.Number(12, fila, f?.longitud ? f?.longitud : 0); sheet.addCell(number);
            number = new jxl.write.Number(13, fila, f?.latitud ? f?.latitud : 0); sheet.addCell(number);
            label = new Label(14, fila, (f?.zona ? f?.zona : ''), times16Normal); sheet.addCell(label);
            label = new Label(15, fila, (f?.plan ? f?.plan : ''), times16Normal); sheet.addCell(label);
            number = new jxl.write.Number(16, fila, f?.actvAgricola ? f?.actvAgricola : 0); sheet.addCell(number);
            number = new jxl.write.Number(17, fila, f?.actvPecuaria ? f?.actvPecuaria : 0); sheet.addCell(number);
            number = new jxl.write.Number(18, fila, f?.jornalerosPermanentes ? f?.jornalerosPermanentes : 0); sheet.addCell(number);
            number = new jxl.write.Number(19, fila, f?.jornalerosTemporales ? f?.jornalerosTemporales : 0); sheet.addCell(number);
            label = new Label(20, fila, (f?.entrevista ? f?.entrevista : ''), times16Normal); sheet.addCell(label);
            label = new Label(21, fila, (f?.preparacionSuelo ? f?.preparacionSuelo : ''), times16Normal); sheet.addCell(label);
            label = new Label(22, fila, (f?.fertilizantes ? f?.fertilizantes : ''), times16Normal); sheet.addCell(label);
            label = new Label(23, fila, (f?.fertilizacionComplementaria ? f?.fertilizacionComplementaria : ''), times16Normal); sheet.addCell(label);
            label = new Label(24, fila, (f?.manejoRastrojos ? f?.manejoRastrojos : ''), times16Normal); sheet.addCell(label);
            label = new Label(25, fila, (f?.asociacionCultivos ? f?.asociacionCultivos : ''), times16Normal); sheet.addCell(label);
            label = new Label(26, fila, (f?.rotacionCultivos ? f?.rotacionCultivos : ''), times16Normal); sheet.addCell(label);
            label = new Label(27, fila, (f?.seleccionSemillas ? f?.seleccionSemillas : ''), times16Normal); sheet.addCell(label);
            label = new Label(28, fila, (f?.semillaPropia ? f?.semillaPropia : ''), times16Normal); sheet.addCell(label);
            label = new Label(29, fila, (f?.semillaComprada ? f?.semillaComprada : ''), times16Normal); sheet.addCell(label);
            label = new Label(30, fila, (f?.semillaIntercambio ? f?.semillaIntercambio : ''), times16Normal); sheet.addCell(label);
            label = new Label(31, fila, (f?.calendarizacion ? f?.calendarizacion : ''), times16Normal); sheet.addCell(label);
            number = new jxl.write.Number(32, fila, f?.invernadero ? f?.invernadero : 0); sheet.addCell(number);

            label = new Label(33, fila, (f?.aguaRiego ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(34, fila, (f?.juntaAgua ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(35, fila, (f?.aguaFuente ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(36, fila, (f?.aguaInfraestructura ?: ''), times16Normal); sheet.addCell(label);

            label = new Label(37, fila, (f?.forestal ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(38, fila, (f?.monte ?: ''), times16Normal); sheet.addCell(label);

            label = new Label(39, fila, (f?.pasto ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(40, fila, (f?.pastoAbono ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(41, fila, (f?.manejoPasto ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(42, fila, (f?.instalaciones ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(43, fila, (f?.sanitario ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(44, fila, (f?.ancestrales ?: ''), times16Normal); sheet.addCell(label);

            label = new Label(45, fila, (f?.basura ?: ''), times16Normal); sheet.addCell(label);
            number = new jxl.write.Number(46, fila, f?.autoconsumo ? f?.autoconsumo : 0); sheet.addCell(number);
            number = new jxl.write.Number(47, fila, f?.venta ? f?.venta : 0); sheet.addCell(number);
            label = new Label(48, fila, (f?.lugarVenta ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(49, fila, (f?.fecuencia ?: ''), times16Normal); sheet.addCell(label);

            label = new Label(50, fila, (f?.estaoOrganizacion ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(51, fila, (f?.calificacion == 'P' ? 'En Proceso': f?.calificacion == 'T' ? 'En Transición' :
                    f?.calificacion == 'I' ? 'Inicio' : 'A'), times16Normal); sheet.addCell(label);
            fila++
        }

        //areas de produccion

        sheet2.setColumnView(0,30)
        sheet2.setColumnView(1,30)
        sheet2.setColumnView(2,30)
        sheet2.setColumnView(3,30)
        sheet2.setColumnView(4,30)
        sheet2.setColumnView(5,30)
        sheet2.setColumnView(6,30)

        def labelArea
        def numberArea
        def filaArea = 4

        labelArea = new Label(0, 1, "ÁREAS DE PRODUCCIÓN", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(0, 2, "", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(1, 3, "TIPO DE LOTE", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(2, 3, "REFERENCIA", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(3, 3, "ÁREA (%)", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(4, 3, "USO AGRÍCOLA (%)", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(5, 3, "USO PECUARIO (%)", times16format); sheet2.addCell(labelArea);
        labelArea = new Label(6, 3, "PENDIENTE (%)", times16format); sheet2.addCell(labelArea);

        fincas.each { f2->
            def areas = AreaProduccion.findAllByFinca(f2)

            areas.each {a->
                labelArea = new Label(0, filaArea, (a?.finca?.nombre ? a?.finca?.nombre : ''), times16Normal); sheet2.addCell(labelArea);
                labelArea = new Label(1, filaArea, (a?.tipoLote?.descripcion ? a?.tipoLote?.descripcion : ''), times16Normal); sheet2.addCell(labelArea);
                labelArea = new Label(2, filaArea, (a?.referencia ? a?.referencia : ''), times16Normal); sheet2.addCell(labelArea);
                numberArea = new jxl.write.Number(3, filaArea, a?.area ? a?.area : 0); sheet2.addCell(numberArea);
                numberArea = new jxl.write.Number(4, filaArea, a?.usoAgricola ? a?.usoAgricola : 0); sheet2.addCell(numberArea);
                numberArea = new jxl.write.Number(5, filaArea, a?.usoPecuario ? a?.usoPecuario : 0); sheet2.addCell(numberArea);
                numberArea = new jxl.write.Number(6, filaArea, a?.pendiente ? a?.pendiente : 0); sheet2.addCell(numberArea);
                filaArea++
            }
        }

        //trabajo familiar

        sheet3.setColumnView(0,30)
        sheet3.setColumnView(1,30)
        sheet3.setColumnView(2,30)
        sheet3.setColumnView(3,30)
        sheet3.setColumnView(4,30)
        sheet3.setColumnView(5,30)
        sheet3.setColumnView(6,30)

        def label3
        def number3
        def fila3 = 4

        label3 = new Label(0, 1, "TRABAJO FAMILIAR", times16format); sheet3.addCell(label3);
        label3 = new Label(0, 2, "", times16format); sheet3.addCell(label3);
        label3 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet3.addCell(label3);
        label3 = new Label(1, 3, "FAMILIAR", times16format); sheet3.addCell(label3);
        label3 = new Label(2, 3, "NÚMERO", times16format); sheet3.addCell(label3);
        label3 = new Label(3, 3, "ACTIVIDAD", times16format); sheet3.addCell(label3);
        label3 = new Label(4, 3, "TIPO", times16format); sheet3.addCell(label3);

        fincas.each { f3->
            def trabajos = TrabajoFamiliar.findAllByFinca(f3)

            trabajos.each {t->
                label3 = new Label(0, fila3, (t?.finca?.nombre ? t?.finca?.nombre : ''), times16Normal); sheet3.addCell(label3);
                label3 = new Label(1, fila3, (t?.familia?.descripcion ? t?.familia?.descripcion : ''), times16Normal); sheet3.addCell(label3);
                number3 = new jxl.write.Number(2, fila3, t?.numero ? t?.numero : 0); sheet3.addCell(number3);
                label3 = new Label(3, fila3, (t?.actividad ? t?.actividad : ''), times16Normal); sheet3.addCell(label3);
                label3 = new Label(4, fila3, (t?.tipo ? t?.tipo : ''), times16Normal); sheet3.addCell(label3);
                fila3++
            }
        }

        //manejo de cultivos

        sheet4.setColumnView(0,30)
        sheet4.setColumnView(1,30)
        sheet4.setColumnView(2,30)


        def label4
        def number4
        def fila4 = 4

        label4 = new Label(0, 1, "MANEJO DE CULTIVOS", times16format); sheet4.addCell(label4);
        label4 = new Label(0, 2, "", times16format); sheet4.addCell(label4);
        label4 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet4.addCell(label4);
        label4 = new Label(1, 3, "CULTIVO", times16format); sheet4.addCell(label4);
        label4 = new Label(2, 3, "ÁREA (M2)", times16format); sheet4.addCell(label4);

        fincas.each { f3->
            def cultivos = Cultivos.findAllByFinca(f3)

            cultivos.each {c->
                label4 = new Label(0, fila4, (c?.finca?.nombre ? c?.finca?.nombre : ''), times16Normal); sheet4.addCell(label4);
                label4 = new Label(1, fila4, (c?.planta?.descripcion ? c?.planta?.descripcion  : ''), times16Normal); sheet4.addCell(label4);
                number4 = new jxl.write.Number(2, fila4, c?.area ? c?.area : 0); sheet4.addCell(number4);
                fila4++
            }
        }

        //MANEJO DE ENFERMEDADES

        sheet5.setColumnView(0,30)
        sheet5.setColumnView(1,30)

        def label5
        def fila5 = 4

        label5 = new Label(0, 1, "MANEJO DE CULTIVOS", times16format); sheet5.addCell(label5);
        label5 = new Label(0, 2, "", times16format); sheet5.addCell(label5);
        label5 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet5.addCell(label5);
        label5 = new Label(1, 3, "ENFERMEDAD", times16format); sheet5.addCell(label5);

        fincas.each { f5->
            def enfermedades = ManejoEnfermedades.findAllByFinca(f5)

            enfermedades.each {e->
                label5 = new Label(0, fila5, (e?.finca?.nombre ? e?.finca?.nombre : ''), times16Normal); sheet5.addCell(label5);
                label5 = new Label(1, fila5, (e?.enfermedad?.descripcion ? e?.enfermedad?.descripcion  : ''), times16Normal); sheet5.addCell(label5);
                fila5++
            }
        }

        //CONTROL DE PLAGAS

        sheet6.setColumnView(0,30)
        sheet6.setColumnView(1,30)

        def label6
        def fila6 = 4

        label6 = new Label(0, 1, "MANEJO DE PLAGAS", times16format); sheet6.addCell(label6);
        label6 = new Label(0, 2, "", times16format); sheet6.addCell(label6);
        label6 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet6.addCell(label6);
        label6 = new Label(1, 3, "PLAGA", times16format); sheet6.addCell(label6);

        fincas.each { f6->
            def plagas = ManejoPlagas.findAllByFinca(f6)

            plagas.each {e->
                label6 = new Label(0, fila6, (e?.finca?.nombre ? e?.finca?.nombre : ''), times16Normal); sheet6.addCell(label6);
                label6 = new Label(1, fila6, (e?.plaga?.descripcion ? e?.plaga?.descripcion  : ''), times16Normal); sheet6.addCell(label6);
                fila6++
            }
        }

        //MANEJO FORESTAL

        sheet7.setColumnView(0,30)
        sheet7.setColumnView(1,30)

        def label7
        def fila7 = 4

        label7 = new Label(0, 1, "MANEJO FORESTAL", times16format); sheet7.addCell(label7);
        label7 = new Label(0, 2, "", times16format); sheet7.addCell(label7);
        label7 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet7.addCell(label7);
        label7 = new Label(1, 3, "SIEMBRA", times16format); sheet7.addCell(label7);

        fincas.each { f7->
            def siembras = Forestal.findAllByFinca(f7)

            siembras.each {s->
                label7 = new Label(0, fila7, (s?.finca?.nombre ? s?.finca?.nombre : ''), times16Normal); sheet7.addCell(label7);
                label7 = new Label(1, fila7, (s?.siembra?.descripcion ? s?.siembra?.descripcion : ''), times16Normal); sheet7.addCell(label7);
                fila7++
            }
        }

        //MANEJO DE ANIMALES

        sheet8.setColumnView(0,30)
        sheet8.setColumnView(1,30)
        sheet8.setColumnView(2,30)

        def label8
        def number8
        def fila8 = 4

        label8 = new Label(0, 1, "MANEJO DE ANIMALES", times16format); sheet8.addCell(label8);
        label8 = new Label(0, 2, "", times16format); sheet8.addCell(label8);
        label8 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet8.addCell(label8);
        label8 = new Label(1, 3, "ANIMAL", times16format); sheet8.addCell(label8);
        label8 = new Label(2, 3, "CANTIDAD", times16format); sheet8.addCell(label8);

        fincas.each { f8->
            def animales = ManejoAnimal.findAllByFinca(f8)

            animales.each {c->
                label8 = new Label(0, fila8, (c?.finca?.nombre ? c?.finca?.nombre : ''), times16Normal); sheet8.addCell(label8);
                label8 = new Label(1, fila8, (c?.animal?.descripcion ? c?.animal?.descripcion  : ''), times16Normal); sheet8.addCell(label8);
                number8 = new jxl.write.Number(2, fila8, c?.numero ? c?.numero : 0); sheet8.addCell(number8);
                fila8++
            }
        }

        //CARGOS

        sheet9.setColumnView(0,30)
        sheet9.setColumnView(1,30)

        def label9
        def fila9 = 4

        label9 = new Label(0, 1, "CARGOS", times16format); sheet9.addCell(label9);
        label9 = new Label(0, 2, "", times16format); sheet9.addCell(label9);
        label9 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet9.addCell(label9);
        label9 = new Label(1, 3, "CARGO", times16format); sheet9.addCell(label9);

        fincas.each { f7->
            def cargos = FincaCargo.findAllByFinca(f7)

            cargos.each {s->
                label9 = new Label(0, fila9, (s?.finca?.nombre ? s?.finca?.nombre : ''), times16Normal); sheet9.addCell(label9);
                label9 = new Label(1, fila9, (s?.cargo?.descripcion ? s?.cargo?.descripcion : ''), times16Normal); sheet9.addCell(label9);
                fila9++
            }
        }

        //OBRAS DE LA FINCA

        sheet10.setColumnView(0,30)
        sheet10.setColumnView(1,30)
        sheet10.setColumnView(2,30)

        def label10
        def fila10 = 4

        label10 = new Label(0, 1, "OBRAS DE LA FINCA", times16format); sheet10.addCell(label10);
        label10 = new Label(0, 2, "", times16format); sheet10.addCell(label10);
        label10 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet10.addCell(label10);
        label10 = new Label(1, 3, "OBRA", times16format); sheet10.addCell(label10);
        label10 = new Label(2, 3, "ESTADO", times16format); sheet10.addCell(label10);

        fincas.each { f7->
            def obras = ObrasFinca.findAllByFinca(f7)

            obras.each {s->
                label10 = new Label(0, fila10, (s?.finca?.nombre ? s?.finca?.nombre : ''), times16Normal); sheet10.addCell(label10);
                label10 = new Label(1, fila10, (s?.tipoObra?.descripcion ? s?.tipoObra?.descripcion : ''), times16Normal); sheet10.addCell(label10);
                label10 = new Label(2, fila10, (s?.estado ? (s?.estado == 'I' ? 'Iniciado' : (s?.estado == 'A' ? 'Avanzado' : 'Terminado')) : ''), times16Normal); sheet10.addCell(label10);
                fila10++
            }
        }

        //INFRAESTRUCTURA

        sheet11.setColumnView(0,30)
        sheet11.setColumnView(1,30)

        def label11
        def fila11 = 4

        label11 = new Label(0, 1, "INFRAESTRUCTURA", times16format); sheet11.addCell(label11);
        label11 = new Label(0, 2, "", times16format); sheet11.addCell(label11);
        label11 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet11.addCell(label11);
        label11 = new Label(1, 3, "INFRAESTRUCTURA", times16format); sheet11.addCell(label11);

        fincas.each { f7->
            def equipos = ManejoEquipo.findAllByFinca(f7)

            equipos.each {s->
                label11 = new Label(0, fila11, (s?.finca?.nombre ? s?.finca?.nombre : ''), times16Normal); sheet11.addCell(label11);
                label11 = new Label(1, fila11, (s?.equipo?.descripcion ? s?.equipo?.descripcion : ''), times16Normal); sheet11.addCell(label11);
                fila11++
            }
        }

        //CAPACITACION

        sheet12.setColumnView(0,30)
        sheet12.setColumnView(1,30)

        def label12
        def fila12 = 4

        label12 = new Label(0, 1, "CAPACITACIÓN", times16format); sheet12.addCell(label12);
        label12 = new Label(0, 2, "", times16format); sheet12.addCell(label12);
        label12 = new Label(0, 3, "NOMBRE DE LA FINCA", times16format); sheet12.addCell(label12);
        label12 = new Label(1, 3, "CURSOS DE CAPACITACIÓN", times16format); sheet12.addCell(label12);

        fincas.each { f7->
            def capacitaciones = FincaCapacitacion.findAllByFinca(f7)

            capacitaciones.each {s->
                label12 = new Label(0, fila12, (s?.finca?.nombre ? s?.finca?.nombre : ''), times16Normal); sheet12.addCell(label12);
                label12 = new Label(1, fila12, (s?.capacitacion?.descripcion ? s?.capacitacion?.descripcion : ''), times16Normal); sheet12.addCell(label12);
                fila12++
            }
        }

        workbook.write();
        workbook.close();
        def output = response.getOutputStream()
        def header = "attachment; filename=" + "reporteFincaExcel_" + new Date().format("dd-MM-yyyy") + ".xls";
        response.setContentType("application/octet-stream")
        response.setHeader("Content-Disposition", header);
        output.write(file.getBytes());
    }

    def reportePuntajesExcel(){

        def finca = Finca.get(params.id)

        def cn = dbConnectionService.getConnection()
        def sql = "select * from puntaje(${finca.id})"
        def res = cn.rows(sql.toString())

        //excel
        WorkbookSettings workbookSettings = new WorkbookSettings()
        workbookSettings.locale = Locale.default

        def file = File.createTempFile('myExcelDocument', '.xls')
        file.deleteOnExit()

        WritableWorkbook workbook = jxl.Workbook.createWorkbook(file, workbookSettings)
        WritableFont font = new WritableFont(WritableFont.ARIAL, 12)
        WritableCellFormat formatXls = new WritableCellFormat(font)

        def row = 0
        WritableSheet sheet = workbook.createSheet('puntajes', 0)

        //DATOS FINCA

        // fija el ancho de la columna
        sheet.setColumnView(0,30)
        sheet.setColumnView(1,30)
        sheet.setColumnView(2,30)

        WritableFont times16font = new WritableFont(WritableFont.TIMES, 11, WritableFont.BOLD, false);
        WritableFont times16fontNormal = new WritableFont(WritableFont.TIMES, 11, WritableFont.NO_BOLD, false);
        WritableCellFormat times16format = new WritableCellFormat(times16font);
        WritableCellFormat times16Normal = new WritableCellFormat(times16fontNormal);

//        autoSizeColumns(sheet, 10)

        def label
        def number
        def fila = 5;
        def total = 0

        label = new Label(0, 0, "SISTEMA DE LA MATA A LA OLLA", times16format); sheet.addCell(label);
        label = new Label(0, 1, "PUNTAJES", times16format); sheet.addCell(label);
        label = new Label(0, 2, "FINCA: ${finca?.nombre}", times16format); sheet.addCell(label);
        label = new Label(0, 3, " ", times16format); sheet.addCell(label);
        label = new Label(0, 4, "CONCEPTO", times16format); sheet.addCell(label);
        label = new Label(1, 4, "VALOR", times16format); sheet.addCell(label);
        label = new Label(2, 4, "PUNTAJE", times16format); sheet.addCell(label);

        res.each { p ->
            label = new Label(0, fila, (p?.pntodscr ?: ''), times16Normal); sheet.addCell(label);
            label = new Label(1, fila, (p?.pntovlor ?: ''), times16Normal); sheet.addCell(label);
            number = new jxl.write.Number(2, fila, p?.pntopnto ?: 0      ); sheet.addCell(number);
            total += (p?.pntopnto ?: 0)
            fila++
        }

        label = new Label(1, fila, "TOTAL", times16format); sheet.addCell(label);
        number = new jxl.write.Number(2, fila,total); sheet.addCell(number);

        workbook.write();
        workbook.close();
        def output = response.getOutputStream()
        def header = "attachment; filename=" + "reportePuntajesExcel_" + new Date().format("dd-MM-yyyy") + ".xls";
        response.setContentType("application/octet-stream")
        response.setHeader("Content-Disposition", header);
        output.write(file.getBytes());
    }

//    def reportePofesoresExcel () {
//        println("reportePofesoresExcel " + params)
//        def cn = dbConnectionService.getConnection()
//        def sql = ""
//        def prdo = Periodo.get(params.prdo)
//        def p_padre = prdo.tipo == 'I'? prdo.padre : 0
//        def p_hijo  = prdo.tipo == 'N'? Periodo.findByPadre(prdo) : 0
//        def fila = 4
//
//        XSSFWorkbook wb = new XSSFWorkbook()
//        XSSFCellStyle style = wb.createCellStyle();
//        XSSFFont font = wb.createFont();
//        font.setBold(true);
//        style.setFont(font);
//
//        XSSFCellStyle style2 = wb.createCellStyle();
//        XSSFFont font2 = wb.createFont();
//        font2.setBold(true);
//        style2.setFont(font2);
//        style2.setAlignment(HorizontalAlignment.CENTER);
//
//        XSSFCellStyle style3 = wb.createCellStyle();
//        XSSFFont font3 = wb.createFont();
//        style3.setWrapText(true);
//        style3.setFont(font3);
//        style3.setAlignment(HorizontalAlignment.LEFT);
//
//        XSSFCellStyle style4 = wb.createCellStyle();
//        XSSFFont font4 = wb.createFont();
//        style4.setWrapText(true);
//        style4.setFont(font4);
//        style4.setAlignment(HorizontalAlignment.RIGHT);
//
//        Sheet sheet = wb.createSheet("Período ${prdo.descripcion}")
//        sheet.setColumnWidth(0, 9 * 256);
//        sheet.setColumnWidth(1, 8 * 256);
//        sheet.setColumnWidth(2, 8 * 256);
//        sheet.setColumnWidth(3, 36 * 256);
//        sheet.setColumnWidth(4, 36 * 256);
//        sheet.setColumnWidth(5, 8 * 256);
//        sheet.setColumnWidth(6, 8 * 256);
//        sheet.setColumnWidth(7, 8 * 256);
//        sheet.setColumnWidth(8, 8 * 256);
//        sheet.setColumnWidth(9, 10 * 256);
//        sheet.setColumnWidth(10, 10 * 256);
//        sheet.setColumnWidth(11, 10 * 256);
//        sheet.setColumnWidth(12, 10 * 256);
//        sheet.setColumnWidth(13, 10 * 256);
//        sheet.setColumnWidth(14, 10 * 256);
//        sheet.setColumnWidth(15, 10 * 256);
//        sheet.setColumnWidth(16, 10 * 256);
//        sheet.setColumnWidth(17, 10 * 256);
//        sheet.setColumnWidth(18, 10 * 256);
//        sheet.setColumnWidth(19, 10 * 256);
//
//        Row row = sheet.createRow(0)
//        row.createCell(0).setCellValue("")
//        Row row2 = sheet.createRow(1)
//        if(params.profesor != 'null') {
//            def profesorNombre = Profesor.get(params.profesor)
//            row2.createCell(0).setCellValue("DOCENTE")
//            row2.createCell(1).setCellValue(profesorNombre?.apellido + " " + profesorNombre?.nombre)
//            row2.createCell(4).setCellValue("Período: ${prdo.descripcion}")
//        }else{
//            row2.createCell(1).setCellValue("LISTA DE DOCENTES")
//        }
//        row2.setRowStyle(style)
//        Row row4 = sheet.createRow(3)
//        row4.createCell(0).setCellValue("Fecha:")
//        row4.createCell(1).setCellValue(new Date().format("dd-MM-yyyy"))
////        row4.sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 3));
//        fila++
//
//        Row rowC1 = sheet.createRow(fila)
//        rowC1.createCell(0).setCellValue("Carrera")
//        rowC1.createCell(1).setCellValue("NRC")
//        rowC1.createCell(2).setCellValue("Código Banner")
//        rowC1.createCell(3).setCellValue("Nombre Asignatura o Actividad")
//        rowC1.createCell(4).setCellValue("Docente")
//        rowC1.createCell(5).setCellValue("Nivel")
//        rowC1.createCell(6).setCellValue("Paralelo")
//        rowC1.createCell(7).setCellValue("Teoría")
//        rowC1.createCell(8).setCellValue("Práctica")
//        rowC1.createCell(9).setCellValue("Horas Semana")
//        rowC1.createCell(10).setCellValue("Lunes ")
//        rowC1.createCell(11).setCellValue("Martes")
//        rowC1.createCell(12).setCellValue("Miércoles")
//        rowC1.createCell(13).setCellValue("Jueves")
//        rowC1.createCell(14).setCellValue("Viernes")
//        rowC1.createCell(15).setCellValue("Créditos")
//        rowC1.createCell(16).setCellValue("Factor Preparación")
//        rowC1.createCell(17).setCellValue("Horas Preparación")
//        rowC1.createCell(18).setCellValue("Horas gestión")
//        rowC1.createCell(19).setCellValue("Total horas")
//        rowC1.setRowStyle(style)
//        fila++
//
//        def profesor
//        def dicta
//        def gestion = []
//        def gestionN = []
//        def parl
//        def crso
//        def suma = 0
//
//        println "haciendo el reporte"
//
//        if(params.profesor != 'null'){
////            profesor = Profesor.get(params.profesor)
//            return reporteExcel(prdo?.id, params.profesor, false)
////            if(prdo.tipo == 'N'){
////                parl = Paralelo.findAllByPeriodo(prdo)
////                crso = Curso.findAllByParaleloInList(parl)
////                dicta = Dicta.findAllByProfesorAndCursoInList(profesor, crso)
////                gestion = Gestion.findAllByProfesorAndPeriodo(profesor, prdo)
////            } else {
////                parl = Paralelo.findAllByPeriodo(prdo.padre)
////                crso = Curso.findAllByParaleloInList(parl)
////                dicta = Dicta.findAllByProfesorAndCursoInList(profesor, crso)
////                gestionN = Gestion.findAllByProfesorAndPeriodo(profesor, prdo.padre)
////            }
////            println "dicta: $dicta"
////            gestion = Gestion.findAllByProfesorAndPeriodo(profesor, prdo)
//        }else{
////            return imprimeExcel(prdo?.id);
//            return reporteExcel(prdo?.id, 2, true)
////            parl = Paralelo.findAllByPeriodo(prdo)
////            crso = Curso.findAllByParaleloInList(parl)
////            dicta = Dicta.findAllByCursoInList(crso)
//        }
//
//        println "reporte unipersonal"
//        dicta.eachWithIndex { r, j ->
//            def respLunes = retornaHoras("lun", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
//            def respMartes = retornaHoras("mar", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
//            def respMiercoles = retornaHoras("mie", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
//            def respJueves = retornaHoras("jue", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
//            def respViernes = retornaHoras("vie", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
//
//            def horasAcad = 0
//
//            if(prdo.tipo == 'N') {
//                horasAcad = r?.curso?.asignatura?.creditos?.toInteger() +
//                        (r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble())
//            } else {
//                horasAcad = r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble()
//            }
//
//            Row rowF1 = sheet.createRow(fila)
//
//            Cell cell0 = rowF1.createCell(0);
//            cell0.setCellStyle(style3);
//            cell0.setCellValue(r?.curso?.asignatura?.carrera?.codigo?.toString());
//
//            Cell cell1 = rowF1.createCell(1);
//            cell1.setCellStyle(style3);
//            cell1.setCellValue(r?.curso?.nrc?.toString());
//
//            Cell cell2 = rowF1.createCell(2);
//            cell2.setCellStyle(style3);
//            cell2.setCellValue(r?.curso?.asignatura?.codigo?.toString());
//
//            Cell cell3 = rowF1.createCell(3);
//            cell3.setCellStyle(style3);
//            cell3.setCellValue(r?.curso?.asignatura?.nombre?.toString());
//
//            Cell cell4 = rowF1.createCell(4);
//            cell4.setCellStyle(style3);
//            cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())
//
//            Cell cell5 = rowF1.createCell(5);
//            cell5.setCellStyle(style3);
//            cell5.setCellValue(r?.curso?.asignatura?.nivel?.numero?.toString())
//
//            Cell cell6 = rowF1.createCell(6);
//            cell6.setCellStyle(style3);
//            cell6.setCellValue(r?.curso?.paralelo?.numero?.toString())
//
//            Cell cell7 = rowF1.createCell(7);
//            cell7.setCellStyle(style4);
//            cell7.setCellValue(r?.curso?.asignatura?.horasTeoria?.toInteger())
//
//            Cell cell8 = rowF1.createCell(8);
//            cell8.setCellStyle(style4);
//            cell8.setCellValue(r?.curso?.asignatura?.horasPractica?.toInteger())
//
//            Cell cell9 = rowF1.createCell(9);
//            cell9.setCellStyle(style4);
//            cell9.setCellValue((r?.curso?.asignatura?.horasPractica?.toInteger() ?: 0) + (r?.curso?.asignatura?.horasTeoria?.toInteger() ?: 0))
//
//            Cell cell10 = rowF1.createCell(10);
//            cell10.setCellStyle(style3);
//            cell10.setCellValue(respLunes);
//
//            Cell cell11 = rowF1.createCell(11);
//            cell11.setCellStyle(style3);
//            cell11.setCellValue(respMartes);
//
//            Cell cell12 = rowF1.createCell(12);
//            cell12.setCellStyle(style3);
//            cell12.setCellValue(respMiercoles);
//
//            Cell cell13 = rowF1.createCell(13);
//            cell13.setCellStyle(style3);
//            cell13.setCellValue(respJueves);
//
//            Cell cell14 = rowF1.createCell(14);
//            cell14.setCellStyle(style3);
//            cell14.setCellValue(respViernes);
//
//            Cell cell15 = rowF1.createCell(15);
//            cell15.setCellStyle(style4);
//            cell15.setCellValue(r?.curso?.asignatura?.creditos?.toDouble());
//
//            Cell cell16 = rowF1.createCell(16);
//            cell16.setCellStyle(style4);
//            cell16.setCellValue(r?.curso?.asignatura?.factorPreparacion?.toDouble());
//
//            Cell cell17 = rowF1.createCell(17);
//            cell17.setCellStyle(style4);
//            cell17.setCellValue(r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble());
//
//            Cell cell18 = rowF1.createCell(18);
//            cell18.setCellStyle(style4);
//            cell18.setCellValue(r?.curso?.asignatura?.horasGestion?.toDouble());
//
//            Cell cell19 = rowF1.createCell(19);
//            cell19.setCellStyle(style4);
//            cell19.setCellValue(horasAcad);
//
//            suma += horasAcad
//            fila++
//        }
//
//        gestion.eachWithIndex { r, j ->
//            Row rowF1 = sheet.createRow(fila)
//
//
//            Cell cell0 = rowF1.createCell(0);
//            cell0.setCellStyle(style3);
//            cell0.setCellValue(r?.asignatura?.carrera?.codigo?.toString());
//
//            Cell cell1 = rowF1.createCell(1);
//            cell1.setCellStyle(style3);
//            cell1.setCellValue("");
//
//            Cell cell2 = rowF1.createCell(2);
//            cell2.setCellStyle(style3);
//            cell2.setCellValue(r?.asignatura?.codigo?.toString());
//
//            Cell cell3 = rowF1.createCell(3);
//            cell3.setCellStyle(style3);
//            cell3.setCellValue(r?.asignatura?.nombre?.toString());
//
//            Cell cell4 = rowF1.createCell(4);
//            cell4.setCellStyle(style3);
//            cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())
//
//            Cell cell5 = rowF1.createCell(5);
//            cell5.setCellStyle(style3);
//            cell5.setCellValue(r?.asignatura?.nivel?.numero?.toString())
//
//            Cell cell6 = rowF1.createCell(6);
//            cell6.setCellStyle(style3);
//            cell6.setCellValue("")
//
//            Cell cell7 = rowF1.createCell(7);
//            cell7.setCellStyle(style4);
//            cell7.setCellValue("")
//
//            Cell cell8 = rowF1.createCell(8);
//            cell8.setCellStyle(style4);
//            cell8.setCellValue("")
//
//            Cell cell9 = rowF1.createCell(9);
//            cell9.setCellStyle(style4);
//            cell9.setCellValue((r?.asignatura?.horasGestion?.toDouble() ?: 0))
//
//            Cell cell10 = rowF1.createCell(10);
//            cell10.setCellStyle(style3);
//            cell10.setCellValue("");
//
//            Cell cell11 = rowF1.createCell(11);
//            cell11.setCellStyle(style3);
//            cell11.setCellValue("");
//
//            Cell cell12 = rowF1.createCell(12);
//            cell12.setCellStyle(style3);
//            cell12.setCellValue("");
//
//            Cell cell13 = rowF1.createCell(13);
//            cell13.setCellStyle(style3);
//            cell13.setCellValue("");
//
//            Cell cell14 = rowF1.createCell(14);
//            cell14.setCellStyle(style3);
//            cell14.setCellValue("");
//
//            Cell cell15 = rowF1.createCell(15);
//            cell15.setCellStyle(style4);
//            cell15.setCellValue(r?.hora?.toDouble()?:'');
//
//            Cell cell16 = rowF1.createCell(16);
//            cell16.setCellStyle(style4);
//            cell16.setCellValue(r?.asignatura?.factorPreparacion?.toDouble()?:'');
//
//            Cell cell17 = rowF1.createCell(17);
//            cell17.setCellStyle(style4);
//            cell17.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:'');
//
//            Cell cell18 = rowF1.createCell(18);
//            cell18.setCellStyle(style4);
//            cell18.setCellValue(r?.horas?.toDouble());
//
//            Cell cell19 = rowF1.createCell(19);
//            cell19.setCellStyle(style4);
//            cell19.setCellValue(r?.horas?.toDouble());
//
//            fila++
//            suma += r?.horas?.toDouble()
//        }
//
//        gestionN.eachWithIndex { r, j ->
//            Row rowF1 = sheet.createRow(fila)
//
//
//
//            Cell cell0 = rowF1.createCell(0);
//            cell0.setCellStyle(style3);
//            cell0.setCellValue(r?.asignatura?.carrera?.codigo?.toString());
//
//            Cell cell1 = rowF1.createCell(1);
//            cell1.setCellStyle(style3);
//            cell1.setCellValue("");
//
//            Cell cell2 = rowF1.createCell(2);
//            cell2.setCellStyle(style3);
//            cell2.setCellValue(r?.asignatura?.codigo?.toString());
//
//            Cell cell3 = rowF1.createCell(3);
//            cell3.setCellStyle(style3);
//            cell3.setCellValue(r?.asignatura?.nombre?.toString());
//
//            Cell cell4 = rowF1.createCell(4);
//            cell4.setCellStyle(style3);
//            cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())
//
//            Cell cell5 = rowF1.createCell(5);
//            cell5.setCellStyle(style3);
//            cell5.setCellValue(r?.asignatura?.nivel?.numero?.toString())
//
//            Cell cell6 = rowF1.createCell(6);
//            cell6.setCellStyle(style3);
//            cell6.setCellValue("")
//
//            Cell cell7 = rowF1.createCell(7);
//            cell7.setCellStyle(style4);
//            cell7.setCellValue("")
//
//            Cell cell8 = rowF1.createCell(8);
//            cell8.setCellStyle(style4);
//            cell8.setCellValue("")
//
//            Cell cell9 = rowF1.createCell(9);
//            cell9.setCellStyle(style4);
//            cell9.setCellValue((r?.asignatura?.horasGestion?.toDouble() ?: 0))
//
//            Cell cell10 = rowF1.createCell(10);
//            cell10.setCellStyle(style3);
//            cell10.setCellValue("");
//
//            Cell cell11 = rowF1.createCell(11);
//            cell11.setCellStyle(style3);
//            cell11.setCellValue("");
//
//            Cell cell12 = rowF1.createCell(12);
//            cell12.setCellStyle(style3);
//            cell12.setCellValue("");
//
//            Cell cell13 = rowF1.createCell(13);
//            cell13.setCellStyle(style3);
//            cell13.setCellValue("");
//
//            Cell cell14 = rowF1.createCell(14);
//            cell14.setCellStyle(style3);
//            cell14.setCellValue("");
//
//            Cell cell15 = rowF1.createCell(15);
//            cell15.setCellStyle(style4);
//            cell15.setCellValue(r?.hora?.toDouble()?:'');
//
//            Cell cell16 = rowF1.createCell(16);
//            cell16.setCellStyle(style4);
//            cell16.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());
//
//            Cell cell17 = rowF1.createCell(17);
//            cell17.setCellStyle(style4);
//            cell17.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());
//
//            Cell cell18 = rowF1.createCell(18);
//            cell18.setCellStyle(style4);
//            cell18.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());
//
//            Cell cell19 = rowF1.createCell(19);
//            cell19.setCellStyle(style4);
//            cell19.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());
//
//
////            rowF1.createCell(19).setCellValue(r?.hora.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble())
////            rowF1.setRowStyle(style3)
//
//            fila++
//            suma += r?.hora.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble()
//        }
//
////        suma = 41.2 //borrar
//
//        Row rowF1 = sheet.createRow(fila)
//        rowF1.createCell(18).setCellValue("Total")
//        rowF1.createCell(19).setCellValue(suma)
//        rowF1.setRowStyle(style)
//
//        fila++
//
//
//
//        if(suma > 40 && prdo.tipo == 'N') {
//            Row rowS = sheet.createRow(fila)
//            rowS.createCell(1).setCellValue("El valor de ${Math.round((suma - 40)*10)/10} horas, que sobrepasa a las " +
//                    "40 horas semanales, se compensará en el periodo \"${p_hijo?.descripcion}\" como " +
//                    "${Math.round((suma - 40)*(prdo.semanas/p_hijo.semanas)*10)/10} horas de trabajo")
//            rowS.setRowStyle(style)
//        }
//
//        if(prdo.tipo == 'I') {
//            sql = "select comphora from res_prdo_n(${profesor.id}, ${p_padre.id})"
//            println "sql para ${prdo.tipo}: $sql"
//            def hh = cn.rows(sql.toString())[0].comphora
//            Row rowS = sheet.createRow(fila)
//            rowS.createCell(1).setCellValue("Compensación del periodo \"${p_padre?.descripcion}\" ${hh} horas de trabajo")
//            rowS.createCell(16).setCellValue("Compensación periodo ${p_padre?.descripcion}")
//            rowS.createCell(19).setCellValue(hh)
//            rowS.setRowStyle(style)
//            Row rowS1 = sheet.createRow(fila + 1)
//            rowS1.createCell(17).setCellValue("Total del periodo")
//            rowS1.createCell(19).setCellValue(suma + hh)
//            rowS1.setRowStyle(style)
//        }
//
//        def output = response.getOutputStream()
//        def header = "attachment; filename=" + "profesores.xlsx";
//        response.setContentType("application/octet-stream")
//        response.setHeader("Content-Disposition", header);
//        wb.write(output)
//    }

    def reportePofesoresExcel () {
        println("reportePofesoresExcel " + params)
        def periodo = Periodo.get(params.prdo)
        def prof = Profesor.get(params.profesor)

        XSSFWorkbook wb = new XSSFWorkbook()
        XSSFCellStyle style = wb.createCellStyle();
        XSSFFont font = wb.createFont();
        font.setBold(true);
        style.setFont(font);

        XSSFCellStyle style2 = wb.createCellStyle();
        XSSFFont font2 = wb.createFont();
        font2.setBold(true);
        style2.setFont(font2);
        style2.setAlignment(HorizontalAlignment.CENTER);

        XSSFCellStyle style3 = wb.createCellStyle();
        XSSFFont font3 = wb.createFont();
        style3.setWrapText(true);
        style3.setFont(font3);
        style3.setAlignment(HorizontalAlignment.LEFT);

        XSSFCellStyle style4 = wb.createCellStyle();
        XSSFFont font4 = wb.createFont();
        style4.setWrapText(true);
        style4.setFont(font4);
        style4.setAlignment(HorizontalAlignment.RIGHT);

        Sheet sheet = wb.createSheet("Período ${periodo.descripcion}")

        sheet.setColumnWidth(0, 9 * 256);
        sheet.setColumnWidth(1, 8 * 256);
        sheet.setColumnWidth(2, 8 * 256);
        sheet.setColumnWidth(3, 36 * 256);
        sheet.setColumnWidth(4, 36 * 256);
        sheet.setColumnWidth(5, 8 * 256);
        sheet.setColumnWidth(6, 8 * 256);
        sheet.setColumnWidth(7, 8 * 256);
        sheet.setColumnWidth(8, 8 * 256);
        sheet.setColumnWidth(9, 10 * 256);
        sheet.setColumnWidth(10, 10 * 256);
        sheet.setColumnWidth(11, 10 * 256);
        sheet.setColumnWidth(12, 10 * 256);
        sheet.setColumnWidth(13, 10 * 256);
        sheet.setColumnWidth(14, 10 * 256);
        sheet.setColumnWidth(15, 10 * 256);
        sheet.setColumnWidth(16, 10 * 256);
        sheet.setColumnWidth(17, 10 * 256);
        sheet.setColumnWidth(18, 10 * 256);
        sheet.setColumnWidth(19, 10 * 256);

        Row row = sheet.createRow(0)
        row.createCell(0).setCellValue("")
        Row row2 = sheet.createRow(1)

        row2.createCell(0).setCellValue("DOCENTE")
        row2.createCell(1).setCellValue(prof?.apellido + " " + prof?.nombre)
        row2.createCell(4).setCellValue("Perìodo: ${periodo.descripcion}")

        row2.setRowStyle(style)
        Row row4 = sheet.createRow(3)
        row4.createCell(0).setCellValue("Fecha:")
        row4.createCell(1).setCellValue(new Date().format("dd-MM-yyyy"))

        def fila = 4

        if(params.profesor != 'null'){
            reporteExcel(sheet, params.prdo, params.profesor, false, style, style2, style3, style4, fila)
            def output = response.getOutputStream()
            def header = "attachment; filename=" + "profesor_${prof?.apellido + " " + prof?.nombre}.xlsx";
            response.setContentType("application/octet-stream")
            response.setHeader("Content-Disposition", header);
            wb.write(output)
            println "Salida"
            return
        }else{
            def profesores = Profesor.list([sort: 'apellido'])
            profesores.each { p ->
                fila = reporteExcel(sheet, params.prdo, p?.id, true, style, style2, style3, style4, fila)
                if(params.arch == 'true') {
                    reporteExcel(sheet, params.prdo, p?.id, true, style, style2, style3, style4, 4)
                    def file = new File("/tmp/profesor_${p?.apellido + "_" + p?.nombre}.xlsx")
                    FileOutputStream outputStream = new FileOutputStream(file)
                    wb.write(outputStream)
                }
            }

            if(params.arch == 'false') {
                println "Genera el archivo de todos los profesores --> ${params.arch}"
                def file = new File("/tmp/prog_acad_${params.prdo}.xlsx")
                FileOutputStream outputStream = new FileOutputStream(file)
                wb.write(outputStream)
            }


            flash.message = "Se han generado los archivos excel con los reportes de todos los profesores."
            flash.tipo = "info"
            flash.icon = "icon-warning"
            redirect(controller: "reportes", action: "reportes")
        }


//        println "--> ${profesor?.apellido + "_" + profesor?.nombre}"
//        if(generaArch) {
//            def file = new File("/tmp/profesor_${profesor?.apellido + "_" + profesor?.nombre}.xlsx")
//            FileOutputStream outputStream = new FileOutputStream(file)
//            wb.write(outputStream)
//        } else {
//            def output = response.getOutputStream()
//            def header = "attachment; filename=" + "profesor_${profesor?.apellido + " " + profesor?.nombre}.xlsx";
//            response.setContentType("application/octet-stream")
//            response.setHeader("Content-Disposition", header);
//            wb.write(output)
//        }

    }


    def retornaHoras(dia, nivel, paralelo, asignatura){
        def arreglo = []
        def cn = dbConnectionService.getConnection()
//        def sql = "select horadscr from hora where hora__id in (select substr(${dia},3,1)::int " +
//                "from horario(${nivel}, ${paralelo}, ${asignatura}) where length(${dia}) > 4) order by horanmro"
//        def sql = "select hora from horario(${nivel}, ${paralelo}, ${asignatura}) where length(${dia}) > 10 and " +
//                "split_part(${dia}, ';', 4) = 'S' order by hora"
        def sql = "select horadscr from hora where hora__id in (select split_part(mar, ';',2)::int " +
                "from horario(${nivel}, ${paralelo}, ${asignatura}) where length(${dia}) > 10 and " +
                "split_part(${dia}, ';', 4) = 'S') order by horanmro"
        if(asignatura == 86) {
            println "sql: $sql"
        }
        def resp = cn.rows(sql.toString())
        resp.each {
            arreglo.add(it.horadscr)
        }
        return horario(arreglo)
    }

    def horario(txto) {
        def primero = ""
        def ultimo = ""
        def retorna = ""
        if(txto.size() > 1) {
            primero = txto[0]
            ultimo = txto[-1]
        } else if(txto.size() == 1) {
            primero = txto[0]
            ultimo = txto[-1]
        }
        if((primero + ultimo) != "") {
            retorna = primero.split('-')[0] + "-" + ultimo.split('-')[1]
        }
        return retorna
    }

    def profesores_ajax(){

    }

    def horario_ajax(){

    }

    def paralelo_ajax(){
        def periodo = Periodo.get(params.periodo)
        def nivel = Nivel.get(params.nivel)
        def paralelos = Paralelo.findAllByPeriodoAndNivel(periodo, nivel)
        def asignaturas = Asignatura.findAllByNivel(nivel)
        return[paralelos: paralelos, asignaturas: asignaturas]
    }


    def reporteHorarioExcel(){
//        println("params hora excel " + params)
        def cn = dbConnectionService.getConnection()
        def asignatura = Asignatura.get(params.asignatura)
        def sql = "select * from horario(${asignatura.nivel.id}, ${params.paralelo}, ${params.asignatura})"
//        println("sql " + sql)
        def resp = cn.rows(sql.toString())
        def fila = 4

        def horr, prof

        XSSFWorkbook wb = new XSSFWorkbook()
        XSSFCellStyle style = wb.createCellStyle();
        XSSFFont font = wb.createFont();
        font.setBold(true);
        style.setFont(font);

        XSSFCellStyle style2 = wb.createCellStyle();
        XSSFFont font2 = wb.createFont();
        font2.setBold(true);
        style2.setFont(font2);
        style2.setAlignment(HorizontalAlignment.LEFT);

        XSSFCellStyle style3 = wb.createCellStyle();
        XSSFFont font3 = wb.createFont();
        style3.setWrapText(true);
        style3.setFont(font3);
        style3.setAlignment(HorizontalAlignment.LEFT);

        XSSFCellStyle style4 = wb.createCellStyle();
        XSSFFont font4 = wb.createFont();
        style4.setWrapText(true);
        style4.setFont(font4);
        style4.setAlignment(HorizontalAlignment.RIGHT);

        Sheet sheet = wb.createSheet("Horario")
        sheet.setColumnWidth(0, 30 * 256);
        sheet.setColumnWidth(1, 30 * 256);
        sheet.setColumnWidth(2, 30 * 256);
        sheet.setColumnWidth(3, 30 * 256);
        sheet.setColumnWidth(4, 30 * 256);
        sheet.setColumnWidth(5, 30 * 256);
        sheet.setColumnWidth(6, 30 * 256);
        sheet.setColumnWidth(7, 30 * 256);

        Row row = sheet.createRow(0)
        row.createCell(0).setCellValue("")
        Row row2 = sheet.createRow(1)
        row2.setRowStyle(style)
        Row row4 = sheet.createRow(3)
        row4.createCell(0).setCellValue("Fecha:")
        row4.createCell(1).setCellValue(new Date().format("dd-MM-yyyy"))
//        row4.sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 3));
        fila++

        Row rowC1 = sheet.createRow(fila)
        rowC1.createCell(0).setCellValue("Hora")
        rowC1.createCell(1).setCellValue("Lunes")
        rowC1.createCell(2).setCellValue("Martes")
        rowC1.createCell(3).setCellValue("Miércoles")
        rowC1.createCell(4).setCellValue("Jueves")
        rowC1.createCell(5).setCellValue("Viernes")
        rowC1.setRowStyle(style)
        fila++

        resp.eachWithIndex { r, j ->
            Row rowF1 = sheet.createRow(fila)
            rowF1.setHeight((short) 650)

            Cell cell0 = rowF1.createCell(0);
            cell0.setCellStyle(style3);
            Cell cell1 = rowF1.createCell(1);
            cell1.setCellStyle(style2);
            Cell cell2 = rowF1.createCell(2);
            cell2.setCellStyle(style2);
            Cell cell3 = rowF1.createCell(3);
            cell3.setCellStyle(style2);
            Cell cell4 = rowF1.createCell(4);
            cell4.setCellStyle(style2);
            Cell cell5 = rowF1.createCell(5);
            cell5.setCellStyle(style2);

            cell0.setCellValue(r?.hora?.toString());

            if(r?.lun?.size() > 7){
                horr = Horario.get(r?.lun?.split(';')[2])
                prof = Dicta.findByCurso(horr.curso)
                cell1.setCellValue("${horr.curso.asignatura.nombre} \n${prof.profesor.apellido} ${prof.profesor.nombre}");
            }else{
                cell1.setCellValue("")
            }

            if(r?.mar?.size() > 7){
                horr = Horario.get(r?.mar?.split(';')[2])
                prof = Dicta.findByCurso(horr.curso)
                cell2.setCellValue("${horr.curso.asignatura.nombre} \n${prof.profesor.apellido} ${prof.profesor.nombre}");
            }else{
                cell2.setCellValue("")
            }

            if(r?.mie?.size() > 7){
                horr = Horario.get(r?.mie?.split(';')[2])
                prof = Dicta.findByCurso(horr.curso)
                cell3.setCellValue("${horr.curso.asignatura.nombre} \n${prof.profesor.apellido} ${prof.profesor.nombre}");
            }else{
                cell3.setCellValue("")
            }

            if(r?.jue?.size() > 7){
                horr = Horario.get(r?.jue?.split(';')[2])
                prof = Dicta.findByCurso(horr.curso)
                cell4.setCellValue("${horr.curso.asignatura.nombre} \n${prof.profesor.apellido} ${prof.profesor.nombre}");
            }else{
                cell4.setCellValue("")
            }

            if(r?.vie?.size() > 7){
                horr = Horario.get(r?.vie?.split(';')[2])
                prof = Dicta.findByCurso(horr.curso)
                cell5.setCellValue("${horr.curso.asignatura.nombre} \n${prof.profesor.apellido} ${prof.profesor.nombre}");
            }else{
                cell5.setCellValue("")
            }

            fila++
        }

        def output = response.getOutputStream()
        def header = "attachment; filename=" + "horario.xlsx";
        response.setContentType("application/octet-stream")
        response.setHeader("Content-Disposition", header);
        wb.write(output)

    }

    def reportePeriodoExcel(){
        println("params periodo excel " + params)
        def cn = dbConnectionService.getConnection()

        def sql = "select carrnmbr, nveldscr, parlnmro, profapll, profnmbr, asignmbr from carr, nvel, " +
                "parl, dcta, prof, crso, asig where prdo__id = 2 and nvel.nvel__id = parl.nvel__id and " +
                "carr.carr__id = parl.carr__id and crso.parl__id = parl.parl__id and dcta.crso__id = crso.crso__id and " +
                "prof.prof__id = dcta.prof__id and asig.asig__id = crso.asig__id order by carr.carr__id, nvel.nvelnmro, parlnmro, profapll;"

        def resp = cn.rows(sql.toString())
        def fila = 4

        XSSFWorkbook wb = new XSSFWorkbook()
        XSSFCellStyle style = wb.createCellStyle();
        XSSFFont font = wb.createFont();
        font.setBold(true);
        style.setFont(font);

        XSSFCellStyle style2 = wb.createCellStyle();
        XSSFFont font2 = wb.createFont();
        font2.setBold(true);
        style2.setFont(font2);
        style2.setAlignment(HorizontalAlignment.CENTER);

        XSSFCellStyle style3 = wb.createCellStyle();
        XSSFFont font3 = wb.createFont();
        style3.setWrapText(true);
        style3.setFont(font3);
        style3.setAlignment(HorizontalAlignment.LEFT);

        XSSFCellStyle style4 = wb.createCellStyle();
        XSSFFont font4 = wb.createFont();
        style4.setWrapText(true);
        style4.setFont(font4);
        style4.setAlignment(HorizontalAlignment.RIGHT);

        Sheet sheet = wb.createSheet("Horario")
        sheet.setColumnWidth(0, 20 * 256);
        sheet.setColumnWidth(1, 20 * 256);
        sheet.setColumnWidth(2, 20 * 256);
        sheet.setColumnWidth(3, 20 * 256);
        sheet.setColumnWidth(4, 20 * 256);
        sheet.setColumnWidth(5, 20 * 256);
        sheet.setColumnWidth(6, 20 * 256);
        sheet.setColumnWidth(7, 40 * 256);

        Row row = sheet.createRow(0)
        row.createCell(0).setCellValue("")
        Row row2 = sheet.createRow(1)
        row2.setRowStyle(style)
        Row row4 = sheet.createRow(3)
        row4.createCell(0).setCellValue("Fecha:")
        row4.createCell(1).setCellValue(new Date().format("dd-MM-yyyy"))
//        row4.sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 3));
        fila++

        Row rowC1 = sheet.createRow(fila)
        rowC1.createCell(0).setCellValue("Carrera")
        rowC1.createCell(1).setCellValue("Nivel")
        rowC1.createCell(2).setCellValue("Paralelo")
        rowC1.createCell(3).setCellValue("Apellido")
        rowC1.createCell(4).setCellValue("Nombre")
        rowC1.createCell(5).setCellValue("Asignatura")
        rowC1.setRowStyle(style)
        fila++

        resp.eachWithIndex { r, j ->
            Row rowF1 = sheet.createRow(fila)
            rowF1.createCell(0).setCellValue(r?.carrnmbr?.toString())
            rowF1.createCell(1).setCellValue(r?.nveldscr?.toString())
            rowF1.createCell(2).setCellValue(r?.parlnmro?.toString())
            rowF1.createCell(3).setCellValue(r?.profapll?.toString())
            rowF1.createCell(4).setCellValue(r?.profnmbr?.toString())
            rowF1.createCell(5).setCellValue(r?.asignmbr?.toString())
            fila++
        }

        //escribe a archivo
//        def file = new File("/tmp/prueba.xlsx")
//        FileOutputStream outputStream = new FileOutputStream(file)
//        wb.write(outputStream)

        def output = response.getOutputStream()
        def header = "attachment; filename=" + "periodo.xlsx";
        response.setContentType("application/octet-stream")
        response.setHeader("Content-Disposition", header);
        wb.write(output)
    }


    def imprimeExcel (periodo) {
        println("imprime " + params)

        def cn = dbConnectionService.getConnection()
        def sql = ""
        def prdo = Periodo.get(periodo)
        def p_padre = prdo.tipo == 'I'? prdo.padre : 0
        def p_hijo  = prdo.tipo == 'N'? Periodo.findByPadre(prdo) : 0


        def profesores = Profesor.list()

        profesores.each { p->

            def fila = 4

            XSSFWorkbook wb = new XSSFWorkbook()
            XSSFCellStyle style = wb.createCellStyle();
            XSSFFont font = wb.createFont();
            font.setBold(true);
            style.setFont(font);

            XSSFCellStyle style2 = wb.createCellStyle();
            XSSFFont font2 = wb.createFont();
            font2.setBold(true);
            style2.setFont(font2);
            style2.setAlignment(HorizontalAlignment.CENTER);

            XSSFCellStyle style3 = wb.createCellStyle();
            XSSFFont font3 = wb.createFont();
            style3.setWrapText(true);
            style3.setFont(font3);
            style3.setAlignment(HorizontalAlignment.LEFT);

            XSSFCellStyle style4 = wb.createCellStyle();
            XSSFFont font4 = wb.createFont();
            style4.setWrapText(true);
            style4.setFont(font4);
            style4.setAlignment(HorizontalAlignment.RIGHT);

            Sheet sheet = wb.createSheet("Período ${prdo.descripcion}")
            sheet.setColumnWidth(0, 9 * 256);
            sheet.setColumnWidth(1, 8 * 256);
            sheet.setColumnWidth(2, 8 * 256);
            sheet.setColumnWidth(3, 36 * 256);
            sheet.setColumnWidth(4, 36 * 256);
            sheet.setColumnWidth(5, 8 * 256);
            sheet.setColumnWidth(6, 8 * 256);
            sheet.setColumnWidth(7, 8 * 256);
            sheet.setColumnWidth(8, 8 * 256);
            sheet.setColumnWidth(9, 10 * 256);
            sheet.setColumnWidth(10, 10 * 256);
            sheet.setColumnWidth(11, 10 * 256);
            sheet.setColumnWidth(12, 10 * 256);
            sheet.setColumnWidth(13, 10 * 256);
            sheet.setColumnWidth(14, 10 * 256);
            sheet.setColumnWidth(15, 10 * 256);
            sheet.setColumnWidth(16, 10 * 256);
            sheet.setColumnWidth(17, 10 * 256);
            sheet.setColumnWidth(18, 10 * 256);
            sheet.setColumnWidth(19, 10 * 256);

            Row row = sheet.createRow(0)
            row.createCell(0).setCellValue("")
            Row row2 = sheet.createRow(1)

            def profesorNombre = Profesor.get(p?.id)
            row2.createCell(0).setCellValue("DOCENTE")
            row2.createCell(1).setCellValue(profesorNombre?.apellido + " " + profesorNombre?.nombre)
            row2.createCell(4).setCellValue("Perìodo: ${prdo.descripcion}")

            row2.setRowStyle(style)
            Row row4 = sheet.createRow(3)
            row4.createCell(0).setCellValue("Fecha:")
            row4.createCell(1).setCellValue(new Date().format("dd-MM-yyyy"))
            fila++

            Row rowC1 = sheet.createRow(fila)
            rowC1.createCell(0).setCellValue("Carrera")
            rowC1.createCell(1).setCellValue("NRC")
            rowC1.createCell(2).setCellValue("Código Banner")
            rowC1.createCell(3).setCellValue("Nombre Asignatura o Actividad")
            rowC1.createCell(4).setCellValue("Docente")
            rowC1.createCell(5).setCellValue("Nivel")
            rowC1.createCell(6).setCellValue("Paralelo")
            rowC1.createCell(7).setCellValue("Teoría")
            rowC1.createCell(8).setCellValue("Práctica")
            rowC1.createCell(9).setCellValue("Horas Semana")
            rowC1.createCell(10).setCellValue("Lunes ")
            rowC1.createCell(11).setCellValue("Martes")
            rowC1.createCell(12).setCellValue("Miércoles")
            rowC1.createCell(13).setCellValue("Jueves")
            rowC1.createCell(14).setCellValue("Viernes")
            rowC1.createCell(15).setCellValue("Créditos")
            rowC1.createCell(16).setCellValue("Factor Preparación")
            rowC1.createCell(17).setCellValue("Horas Preparación")
            rowC1.createCell(18).setCellValue("Horas gestión")
            rowC1.createCell(19).setCellValue("Total horas")
            rowC1.setRowStyle(style)
            fila++

            def profesor
            def dicta
            def gestion = []
            def gestionN = []
            def parl
            def crso
            def suma = 0

            profesor = Profesor.get(p?.id)
            if(prdo.tipo == 'N'){
                parl = Paralelo.findAllByPeriodo(prdo)
                crso = Curso.findAllByParaleloInList(parl)
                dicta = Dicta.findAllByProfesorAndCursoInList(profesor, crso)
                gestion = Gestion.findAllByProfesorAndPeriodo(profesor, prdo)
            } else {
                parl = Paralelo.findAllByPeriodo(prdo.padre)
                crso = Curso.findAllByParaleloInList(parl)
                dicta = Dicta.findAllByProfesorAndCursoInList(profesor, crso)
                gestionN = Gestion.findAllByProfesorAndPeriodo(profesor, prdo.padre)
            }
            gestion = Gestion.findAllByProfesorAndPeriodo(profesor, prdo)

            dicta.eachWithIndex { r, j ->
                def respLunes = retornaHoras("lun", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respMartes = retornaHoras("mar", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respMiercoles = retornaHoras("mie", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respJueves = retornaHoras("jue", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respViernes = retornaHoras("vie", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)

                def horasAcad = 0

                if(prdo.tipo == 'N') {
                    horasAcad = r?.curso?.asignatura?.creditos?.toInteger() +
                            (r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble())
                } else {
                    horasAcad = r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble()
                }

                Row rowF1 = sheet.createRow(fila)

                Cell cell0 = rowF1.createCell(0);
                cell0.setCellStyle(style3);
                cell0.setCellValue(r?.curso?.asignatura?.carrera?.codigo?.toString());

                Cell cell1 = rowF1.createCell(1);
                cell1.setCellStyle(style3);
                cell1.setCellValue(r?.curso?.nrc?.toString());

                Cell cell2 = rowF1.createCell(2);
                cell2.setCellStyle(style3);
                cell2.setCellValue(r?.curso?.asignatura?.codigo?.toString());

                Cell cell3 = rowF1.createCell(3);
                cell3.setCellStyle(style3);
                cell3.setCellValue(r?.curso?.asignatura?.nombre?.toString());

                Cell cell4 = rowF1.createCell(4);
                cell4.setCellStyle(style3);
                cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())

                Cell cell5 = rowF1.createCell(5);
                cell5.setCellStyle(style3);
                cell5.setCellValue(r?.curso?.asignatura?.nivel?.numero?.toString())

                Cell cell6 = rowF1.createCell(6);
                cell6.setCellStyle(style3);
                cell6.setCellValue(r?.curso?.paralelo?.numero?.toString())

                Cell cell7 = rowF1.createCell(7);
                cell7.setCellStyle(style4);
                cell7.setCellValue(r?.curso?.asignatura?.horasTeoria?.toInteger())

                Cell cell8 = rowF1.createCell(8);
                cell8.setCellStyle(style4);
                cell8.setCellValue(r?.curso?.asignatura?.horasPractica?.toInteger())

                Cell cell9 = rowF1.createCell(9);
                cell9.setCellStyle(style4);
                cell9.setCellValue((r?.curso?.asignatura?.horasPractica?.toInteger() ?: 0) + (r?.curso?.asignatura?.horasTeoria?.toInteger() ?: 0))

                Cell cell10 = rowF1.createCell(10);
                cell10.setCellStyle(style3);
                cell10.setCellValue(respLunes);

                Cell cell11 = rowF1.createCell(11);
                cell11.setCellStyle(style3);
                cell11.setCellValue(respMartes);

                Cell cell12 = rowF1.createCell(12);
                cell12.setCellStyle(style3);
                cell12.setCellValue(respMiercoles);

                Cell cell13 = rowF1.createCell(13);
                cell13.setCellStyle(style3);
                cell13.setCellValue(respJueves);

                Cell cell14 = rowF1.createCell(14);
                cell14.setCellStyle(style3);
                cell14.setCellValue(respViernes);

                Cell cell15 = rowF1.createCell(15);
                cell15.setCellStyle(style4);
                cell15.setCellValue(r?.curso?.asignatura?.creditos?.toDouble());

                Cell cell16 = rowF1.createCell(16);
                cell16.setCellStyle(style4);
                cell16.setCellValue(r?.curso?.asignatura?.factorPreparacion?.toDouble());

                Cell cell17 = rowF1.createCell(17);
                cell17.setCellStyle(style4);
                cell17.setCellValue(r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble());

                Cell cell18 = rowF1.createCell(18);
                cell18.setCellStyle(style4);
                cell18.setCellValue(r?.curso?.asignatura?.horasGestion?.toDouble());

                Cell cell19 = rowF1.createCell(19);
                cell19.setCellStyle(style4);
                cell19.setCellValue(horasAcad);

                suma += horasAcad
                fila++
            }

            gestion.eachWithIndex { r, j ->
                Row rowF1 = sheet.createRow(fila)


                Cell cell0 = rowF1.createCell(0);
                cell0.setCellStyle(style3);
                cell0.setCellValue(r?.asignatura?.carrera?.codigo?.toString());

                Cell cell1 = rowF1.createCell(1);
                cell1.setCellStyle(style3);
                cell1.setCellValue("");

                Cell cell2 = rowF1.createCell(2);
                cell2.setCellStyle(style3);
                cell2.setCellValue(r?.asignatura?.codigo?.toString());

                Cell cell3 = rowF1.createCell(3);
                cell3.setCellStyle(style3);
                cell3.setCellValue(r?.asignatura?.nombre?.toString());

                Cell cell4 = rowF1.createCell(4);
                cell4.setCellStyle(style3);
                cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())

                Cell cell5 = rowF1.createCell(5);
                cell5.setCellStyle(style3);
                cell5.setCellValue(r?.asignatura?.nivel?.numero?.toString())

                Cell cell6 = rowF1.createCell(6);
                cell6.setCellStyle(style3);
                cell6.setCellValue("")

                Cell cell7 = rowF1.createCell(7);
                cell7.setCellStyle(style4);
                cell7.setCellValue("")

                Cell cell8 = rowF1.createCell(8);
                cell8.setCellStyle(style4);
                cell8.setCellValue("")

                Cell cell9 = rowF1.createCell(9);
                cell9.setCellStyle(style4);
                cell9.setCellValue((r?.asignatura?.horasGestion?.toDouble() ?: 0))

                Cell cell10 = rowF1.createCell(10);
                cell10.setCellStyle(style3);
                cell10.setCellValue("");

                Cell cell11 = rowF1.createCell(11);
                cell11.setCellStyle(style3);
                cell11.setCellValue("");

                Cell cell12 = rowF1.createCell(12);
                cell12.setCellStyle(style3);
                cell12.setCellValue("");

                Cell cell13 = rowF1.createCell(13);
                cell13.setCellStyle(style3);
                cell13.setCellValue("");

                Cell cell14 = rowF1.createCell(14);
                cell14.setCellStyle(style3);
                cell14.setCellValue("");

                Cell cell15 = rowF1.createCell(15);
                cell15.setCellStyle(style4);
                cell15.setCellValue(r?.hora?.toDouble()?:'');

                Cell cell16 = rowF1.createCell(16);
                cell16.setCellStyle(style4);
                cell16.setCellValue(r?.asignatura?.factorPreparacion?.toDouble()?:'');

                Cell cell17 = rowF1.createCell(17);
                cell17.setCellStyle(style4);
                cell17.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:'');

                Cell cell18 = rowF1.createCell(18);
                cell18.setCellStyle(style4);
                cell18.setCellValue(r?.horas?.toDouble());

                Cell cell19 = rowF1.createCell(19);
                cell19.setCellStyle(style4);
                cell19.setCellValue(r?.horas?.toDouble());

                fila++
                suma += r?.horas?.toDouble()
            }

            gestionN.eachWithIndex { r, j ->
                Row rowF1 = sheet.createRow(fila)

                Cell cell0 = rowF1.createCell(0);
                cell0.setCellStyle(style3);
                cell0.setCellValue(r?.asignatura?.carrera?.codigo?.toString());

                Cell cell1 = rowF1.createCell(1);
                cell1.setCellStyle(style3);
                cell1.setCellValue("");

                Cell cell2 = rowF1.createCell(2);
                cell2.setCellStyle(style3);
                cell2.setCellValue(r?.asignatura?.codigo?.toString());

                Cell cell3 = rowF1.createCell(3);
                cell3.setCellStyle(style3);
                cell3.setCellValue(r?.asignatura?.nombre?.toString());

                Cell cell4 = rowF1.createCell(4);
                cell4.setCellStyle(style3);
                cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())

                Cell cell5 = rowF1.createCell(5);
                cell5.setCellStyle(style3);
                cell5.setCellValue(r?.asignatura?.nivel?.numero?.toString())

                Cell cell6 = rowF1.createCell(6);
                cell6.setCellStyle(style3);
                cell6.setCellValue("")

                Cell cell7 = rowF1.createCell(7);
                cell7.setCellStyle(style4);
                cell7.setCellValue("")

                Cell cell8 = rowF1.createCell(8);
                cell8.setCellStyle(style4);
                cell8.setCellValue("")

                Cell cell9 = rowF1.createCell(9);
                cell9.setCellStyle(style4);
                cell9.setCellValue((r?.asignatura?.horasGestion?.toDouble() ?: 0))

                Cell cell10 = rowF1.createCell(10);
                cell10.setCellStyle(style3);
                cell10.setCellValue("");

                Cell cell11 = rowF1.createCell(11);
                cell11.setCellStyle(style3);
                cell11.setCellValue("");

                Cell cell12 = rowF1.createCell(12);
                cell12.setCellStyle(style3);
                cell12.setCellValue("");

                Cell cell13 = rowF1.createCell(13);
                cell13.setCellStyle(style3);
                cell13.setCellValue("");

                Cell cell14 = rowF1.createCell(14);
                cell14.setCellStyle(style3);
                cell14.setCellValue("");

                Cell cell15 = rowF1.createCell(15);
                cell15.setCellStyle(style4);
                cell15.setCellValue(r?.hora?.toDouble()?:'');

                Cell cell16 = rowF1.createCell(16);
                cell16.setCellStyle(style4);
                cell16.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                Cell cell17 = rowF1.createCell(17);
                cell17.setCellStyle(style4);
                cell17.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                Cell cell18 = rowF1.createCell(18);
                cell18.setCellStyle(style4);
                cell18.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                Cell cell19 = rowF1.createCell(19);
                cell19.setCellStyle(style4);
                cell19.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                fila++
                suma += r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble()
            }

            Row rowF1 = sheet.createRow(fila)
            rowF1.createCell(18).setCellValue("Total")
            rowF1.createCell(19).setCellValue(suma)
            rowF1.setRowStyle(style)

            fila++

            if(suma > 40 && prdo.tipo == 'N') {
                Row rowS = sheet.createRow(fila)
                rowS.createCell(1).setCellValue("El valor de ${Math.round((suma - 40)*10)/10} horas, que sobrepasa a las " +
                        "40 horas semanales, se compensará en el periodo \"${p_hijo?.descripcion}\" como " +
                        "${Math.round((suma - 40)*(prdo.semanas/p_hijo.semanas)*10)/10} horas de trabajo")
                rowS.setRowStyle(style)
            }

            if(prdo.tipo == 'I') {
                sql = "select comphora from res_prdo_n(${profesor.id}, ${p_padre.id})"
                println "sql para ${prdo.tipo}: $sql"
                def hh = cn.rows(sql.toString())[0].comphora
                Row rowS = sheet.createRow(fila)
                rowS.createCell(1).setCellValue("Compensación del periodo \"${p_padre?.descripcion}\" ${hh} horas de trabajo")
                rowS.createCell(16).setCellValue("Compensación periodo ${p_padre?.descripcion}")
                rowS.createCell(19).setCellValue(hh)
                rowS.setRowStyle(style)
                Row rowS1 = sheet.createRow(fila + 1)
                rowS1.createCell(17).setCellValue("Total del periodo")
                rowS1.createCell(19).setCellValue(suma + hh)
                rowS1.setRowStyle(style)
            }

//            def file = new File("/tmp/profesor_${profesor?.apellido + "_" + profesor?.nombre}.xlsx")
//            FileOutputStream outputStream = new FileOutputStream(file)
//            wb.write(outputStream)

            println "--> ${profesor?.apellido + "_" + profesor?.nombre}"
//            def output = response.getOutputStream()
//            def header = "attachment; filename=" + "profesor_${profesor?.apellido + " " + profesor?.nombre}.xlsx";
//            response.setContentType("application/octet-stream")
//            response.setHeader("Content-Disposition", header);
//            wb.write(output)

        }
//        render "se han generado los archivos excel con los reportes de todos los profesores"
        flash.message = "Se han generado los archivos excel con los reportes de todos los profesores."
        flash.tipo = "info"
        flash.icon = "icon-warning"
        redirect(controller: "reportes", action: "reportes")

    }

    def reporteExcel(sheet, prdo, prof, generaArch, style, style2, style3, style4, nmro) {
        println "genera excel para: prdo = $prdo y prof: $prof"

        def cn = dbConnectionService.getConnection()
        def sql = ""
        def periodo = Periodo.get(prdo)
        def p_padre = periodo.tipo == 'I'? periodo.padre : 0
        def p_hijo  = periodo.tipo == 'N'? Periodo.findByPadre(periodo) : 0

        def p = Profesor.get(prof)

        def fila = nmro   //4

//            XSSFWorkbook wb = new XSSFWorkbook()
//            XSSFCellStyle style = wb.createCellStyle();
//            XSSFFont font = wb.createFont();
//            font.setBold(true);
//            style.setFont(font);
//
//            XSSFCellStyle style2 = wb.createCellStyle();
//            XSSFFont font2 = wb.createFont();
//            font2.setBold(true);
//            style2.setFont(font2);
//            style2.setAlignment(HorizontalAlignment.CENTER);
//
//            XSSFCellStyle style3 = wb.createCellStyle();
//            XSSFFont font3 = wb.createFont();
//            style3.setWrapText(true);
//            style3.setFont(font3);
//            style3.setAlignment(HorizontalAlignment.LEFT);
//
//            XSSFCellStyle style4 = wb.createCellStyle();
//            XSSFFont font4 = wb.createFont();
//            style4.setWrapText(true);
//            style4.setFont(font4);
//            style4.setAlignment(HorizontalAlignment.RIGHT);
//
//            Sheet sheet = wb.createSheet("Período ${periodo.descripcion}")

//            sheet.setColumnWidth(0, 9 * 256);
//            sheet.setColumnWidth(1, 8 * 256);
//            sheet.setColumnWidth(2, 8 * 256);
//            sheet.setColumnWidth(3, 36 * 256);
//            sheet.setColumnWidth(4, 36 * 256);
//            sheet.setColumnWidth(5, 8 * 256);
//            sheet.setColumnWidth(6, 8 * 256);
//            sheet.setColumnWidth(7, 8 * 256);
//            sheet.setColumnWidth(8, 8 * 256);
//            sheet.setColumnWidth(9, 10 * 256);
//            sheet.setColumnWidth(10, 10 * 256);
//            sheet.setColumnWidth(11, 10 * 256);
//            sheet.setColumnWidth(12, 10 * 256);
//            sheet.setColumnWidth(13, 10 * 256);
//            sheet.setColumnWidth(14, 10 * 256);
//            sheet.setColumnWidth(15, 10 * 256);
//            sheet.setColumnWidth(16, 10 * 256);
//            sheet.setColumnWidth(17, 10 * 256);
//            sheet.setColumnWidth(18, 10 * 256);
//            sheet.setColumnWidth(19, 10 * 256);

//            Row row = sheet.createRow(0)
//            row.createCell(0).setCellValue("")
//            Row row2 = sheet.createRow(1)
//
//            def profesorNombre = Profesor.get(p?.id)
//            row2.createCell(0).setCellValue("DOCENTE")
//            row2.createCell(1).setCellValue(profesorNombre?.apellido + " " + profesorNombre?.nombre)
//            row2.createCell(4).setCellValue("Perìodo: ${periodo.descripcion}")
//
//            row2.setRowStyle(style)
//            Row row4 = sheet.createRow(3)
//            row4.createCell(0).setCellValue("Fecha:")
//            row4.createCell(1).setCellValue(new Date().format("dd-MM-yyyy"))
//            fila++

            Row rowC1 = sheet.createRow(fila)
            rowC1.createCell(0).setCellValue("Carrera")
            rowC1.createCell(1).setCellValue("NRC")
            rowC1.createCell(2).setCellValue("Código Banner")
            rowC1.createCell(3).setCellValue("Nombre Asignatura o Actividad")
            rowC1.createCell(4).setCellValue("Docente")
            rowC1.createCell(5).setCellValue("Nivel")
            rowC1.createCell(6).setCellValue("Paralelo")
            rowC1.createCell(7).setCellValue("Teoría")
            rowC1.createCell(8).setCellValue("Práctica")
            rowC1.createCell(9).setCellValue("Horas Semana")
            rowC1.createCell(10).setCellValue("Lunes ")
            rowC1.createCell(11).setCellValue("Martes")
            rowC1.createCell(12).setCellValue("Miércoles")
            rowC1.createCell(13).setCellValue("Jueves")
            rowC1.createCell(14).setCellValue("Viernes")
            rowC1.createCell(15).setCellValue("Créditos")
            rowC1.createCell(16).setCellValue("Factor Preparación")
            rowC1.createCell(17).setCellValue("Horas Preparación")
            rowC1.createCell(18).setCellValue("Horas gestión")
            rowC1.createCell(19).setCellValue("Total horas")
            rowC1.setRowStyle(style)
            fila++

            def profesor
            def dicta
            def gestion = []
            def gestionN = []
            def parl
            def crso
            def suma = 0

            profesor = Profesor.get(p?.id)
            if(periodo.tipo == 'N'){
                parl = Paralelo.findAllByPeriodo(periodo)
                crso = Curso.findAllByParaleloInList(parl)
                dicta = Dicta.findAllByProfesorAndCursoInList(profesor, crso)
                gestion = Gestion.findAllByProfesorAndPeriodo(profesor, periodo)
            } else {
                parl = Paralelo.findAllByPeriodo(periodo.padre)
                crso = Curso.findAllByParaleloInList(parl)
                dicta = Dicta.findAllByProfesorAndCursoInList(profesor, crso)
                gestionN = Gestion.findAllByProfesorAndPeriodo(profesor, periodo.padre)
            }
            gestion = Gestion.findAllByProfesorAndPeriodo(profesor, periodo)

            dicta.eachWithIndex { r, j ->
                def respLunes = retornaHoras("lun", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respMartes = retornaHoras("mar", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respMiercoles = retornaHoras("mie", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respJueves = retornaHoras("jue", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)
                def respViernes = retornaHoras("vie", r?.curso?.asignatura?.nivel?.id, r?.curso?.paralelo?.id, r?.curso?.asignatura?.id)

                def horasAcad = 0

                if(periodo.tipo == 'N') {
                    horasAcad = r?.curso?.asignatura?.creditos?.toInteger() +
                            (r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble())
                } else {
                    horasAcad = r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble()
                }

                Row rowF1 = sheet.createRow(fila)

                Cell cell0 = rowF1.createCell(0);
                cell0.setCellStyle(style3);
                cell0.setCellValue(r?.curso?.asignatura?.carrera?.codigo?.toString());

                Cell cell1 = rowF1.createCell(1);
                cell1.setCellStyle(style3);
                cell1.setCellValue(r?.curso?.nrc?.toString());

                Cell cell2 = rowF1.createCell(2);
                cell2.setCellStyle(style3);
                cell2.setCellValue(r?.curso?.asignatura?.codigo?.toString());

                Cell cell3 = rowF1.createCell(3);
                cell3.setCellStyle(style3);
                cell3.setCellValue(r?.curso?.asignatura?.nombre?.toString());

                Cell cell4 = rowF1.createCell(4);
                cell4.setCellStyle(style3);
                cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())

                Cell cell5 = rowF1.createCell(5);
                cell5.setCellStyle(style3);
                cell5.setCellValue(r?.curso?.asignatura?.nivel?.numero?.toString())

                Cell cell6 = rowF1.createCell(6);
                cell6.setCellStyle(style3);
                cell6.setCellValue(r?.curso?.paralelo?.numero?.toString())

                Cell cell7 = rowF1.createCell(7);
                cell7.setCellStyle(style4);
                cell7.setCellValue(r?.curso?.asignatura?.horasTeoria?.toInteger())

                Cell cell8 = rowF1.createCell(8);
                cell8.setCellStyle(style4);
                cell8.setCellValue(r?.curso?.asignatura?.horasPractica?.toInteger())

                Cell cell9 = rowF1.createCell(9);
                cell9.setCellStyle(style4);
                cell9.setCellValue((r?.curso?.asignatura?.horasPractica?.toInteger() ?: 0) + (r?.curso?.asignatura?.horasTeoria?.toInteger() ?: 0))

                Cell cell10 = rowF1.createCell(10);
                cell10.setCellStyle(style3);
                cell10.setCellValue(respLunes);

                Cell cell11 = rowF1.createCell(11);
                cell11.setCellStyle(style3);
                cell11.setCellValue(respMartes);

                Cell cell12 = rowF1.createCell(12);
                cell12.setCellStyle(style3);
                cell12.setCellValue(respMiercoles);

                Cell cell13 = rowF1.createCell(13);
                cell13.setCellStyle(style3);
                cell13.setCellValue(respJueves);

                Cell cell14 = rowF1.createCell(14);
                cell14.setCellStyle(style3);
                cell14.setCellValue(respViernes);

                Cell cell15 = rowF1.createCell(15);
                cell15.setCellStyle(style4);
                cell15.setCellValue(r?.curso?.asignatura?.creditos?.toDouble());

                Cell cell16 = rowF1.createCell(16);
                cell16.setCellStyle(style4);
                cell16.setCellValue(r?.curso?.asignatura?.factorPreparacion?.toDouble());

                Cell cell17 = rowF1.createCell(17);
                cell17.setCellStyle(style4);
                cell17.setCellValue(r?.curso?.asignatura?.creditos?.toInteger() * r?.curso?.asignatura?.factorPreparacion?.toDouble());

                Cell cell18 = rowF1.createCell(18);
                cell18.setCellStyle(style4);
                cell18.setCellValue(r?.curso?.asignatura?.horasGestion?.toDouble());

                Cell cell19 = rowF1.createCell(19);
                cell19.setCellStyle(style4);
                cell19.setCellValue(horasAcad);

                suma += horasAcad
                fila++
            }

            gestion.eachWithIndex { r, j ->
                Row rowF1 = sheet.createRow(fila)


                Cell cell0 = rowF1.createCell(0);
                cell0.setCellStyle(style3);
                cell0.setCellValue(r?.asignatura?.carrera?.codigo?.toString());

                Cell cell1 = rowF1.createCell(1);
                cell1.setCellStyle(style3);
                cell1.setCellValue("");

                Cell cell2 = rowF1.createCell(2);
                cell2.setCellStyle(style3);
                cell2.setCellValue(r?.asignatura?.codigo?.toString());

                Cell cell3 = rowF1.createCell(3);
                cell3.setCellStyle(style3);
                cell3.setCellValue(r?.asignatura?.nombre?.toString());

                Cell cell4 = rowF1.createCell(4);
                cell4.setCellStyle(style3);
                cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())

                Cell cell5 = rowF1.createCell(5);
                cell5.setCellStyle(style3);
                cell5.setCellValue(r?.asignatura?.nivel?.numero?.toString())

                Cell cell6 = rowF1.createCell(6);
                cell6.setCellStyle(style3);
                cell6.setCellValue("")

                Cell cell7 = rowF1.createCell(7);
                cell7.setCellStyle(style4);
                cell7.setCellValue("")

                Cell cell8 = rowF1.createCell(8);
                cell8.setCellStyle(style4);
                cell8.setCellValue("")

                Cell cell9 = rowF1.createCell(9);
                cell9.setCellStyle(style4);
                cell9.setCellValue((r?.asignatura?.horasGestion?.toDouble() ?: 0))

                Cell cell10 = rowF1.createCell(10);
                cell10.setCellStyle(style3);
                cell10.setCellValue("");

                Cell cell11 = rowF1.createCell(11);
                cell11.setCellStyle(style3);
                cell11.setCellValue("");

                Cell cell12 = rowF1.createCell(12);
                cell12.setCellStyle(style3);
                cell12.setCellValue("");

                Cell cell13 = rowF1.createCell(13);
                cell13.setCellStyle(style3);
                cell13.setCellValue("");

                Cell cell14 = rowF1.createCell(14);
                cell14.setCellStyle(style3);
                cell14.setCellValue("");

                Cell cell15 = rowF1.createCell(15);
                cell15.setCellStyle(style4);
                cell15.setCellValue(r?.hora?.toDouble()?:'');

                Cell cell16 = rowF1.createCell(16);
                cell16.setCellStyle(style4);
                cell16.setCellValue(r?.asignatura?.factorPreparacion?.toDouble()?:'');

                Cell cell17 = rowF1.createCell(17);
                cell17.setCellStyle(style4);
                cell17.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:'');

                Cell cell18 = rowF1.createCell(18);
                cell18.setCellStyle(style4);
                cell18.setCellValue(r?.horas?.toDouble());

                Cell cell19 = rowF1.createCell(19);
                cell19.setCellStyle(style4);
                cell19.setCellValue(r?.horas?.toDouble());

                fila++
                suma += r?.horas?.toDouble()
            }

            gestionN.eachWithIndex { r, j ->
                Row rowF1 = sheet.createRow(fila)

                Cell cell0 = rowF1.createCell(0);
                cell0.setCellStyle(style3);
                cell0.setCellValue(r?.asignatura?.carrera?.codigo?.toString());

                Cell cell1 = rowF1.createCell(1);
                cell1.setCellStyle(style3);
                cell1.setCellValue("");

                Cell cell2 = rowF1.createCell(2);
                cell2.setCellStyle(style3);
                cell2.setCellValue(r?.asignatura?.codigo?.toString());

                Cell cell3 = rowF1.createCell(3);
                cell3.setCellStyle(style3);
                cell3.setCellValue(r?.asignatura?.nombre?.toString());

                Cell cell4 = rowF1.createCell(4);
                cell4.setCellStyle(style3);
                cell4.setCellValue(r?.profesor?.apellido?.toString() + " " + r?.profesor?.nombre?.toString())

                Cell cell5 = rowF1.createCell(5);
                cell5.setCellStyle(style3);
                cell5.setCellValue(r?.asignatura?.nivel?.numero?.toString())

                Cell cell6 = rowF1.createCell(6);
                cell6.setCellStyle(style3);
                cell6.setCellValue("")

                Cell cell7 = rowF1.createCell(7);
                cell7.setCellStyle(style4);
                cell7.setCellValue("")

                Cell cell8 = rowF1.createCell(8);
                cell8.setCellStyle(style4);
                cell8.setCellValue("")

                Cell cell9 = rowF1.createCell(9);
                cell9.setCellStyle(style4);
                cell9.setCellValue((r?.asignatura?.horasGestion?.toDouble() ?: 0))

                Cell cell10 = rowF1.createCell(10);
                cell10.setCellStyle(style3);
                cell10.setCellValue("");

                Cell cell11 = rowF1.createCell(11);
                cell11.setCellStyle(style3);
                cell11.setCellValue("");

                Cell cell12 = rowF1.createCell(12);
                cell12.setCellStyle(style3);
                cell12.setCellValue("");

                Cell cell13 = rowF1.createCell(13);
                cell13.setCellStyle(style3);
                cell13.setCellValue("");

                Cell cell14 = rowF1.createCell(14);
                cell14.setCellStyle(style3);
                cell14.setCellValue("");

                Cell cell15 = rowF1.createCell(15);
                cell15.setCellStyle(style4);
                cell15.setCellValue(r?.hora?.toDouble()?:'');

                Cell cell16 = rowF1.createCell(16);
                cell16.setCellStyle(style4);
                cell16.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                Cell cell17 = rowF1.createCell(17);
                cell17.setCellStyle(style4);
                cell17.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                Cell cell18 = rowF1.createCell(18);
                cell18.setCellStyle(style4);
                cell18.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                Cell cell19 = rowF1.createCell(19);
                cell19.setCellStyle(style4);
                cell19.setCellValue(r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble());

                fila++
                suma += r?.hora?.toDouble() * r?.asignatura?.factorPreparacion?.toDouble()?:r?.hora?.toDouble()
            }

            Row rowF1 = sheet.createRow(fila)
            rowF1.createCell(18).setCellValue("Total")
            rowF1.createCell(19).setCellValue(suma)
            rowF1.setRowStyle(style)

            fila++

            if(suma > 40 && periodo.tipo == 'N') {
                Row rowS = sheet.createRow(fila)
                rowS.createCell(1).setCellValue("El valor de ${Math.round((suma - 40)*10)/10} horas, que sobrepasa a las " +
                        "40 horas semanales, se compensará en el periodo \"${p_hijo?.descripcion}\" como " +
                        "${Math.round((suma - 40)*(periodo.semanas/p_hijo.semanas)*10)/10} horas de trabajo")
                rowS.setRowStyle(style)
            }

            if(periodo.tipo == 'I') {
                sql = "select comphora from res_prdo_n(${profesor.id}, ${p_padre.id})"
                println "sql para ${periodo.tipo}: $sql"
                def hh = cn.rows(sql.toString())[0].comphora
                Row rowS = sheet.createRow(fila)
                rowS.createCell(1).setCellValue("Compensación del periodo \"${p_padre?.descripcion}\" ${hh} horas de trabajo")
                rowS.createCell(16).setCellValue("Compensación periodo ${p_padre?.descripcion}")
                rowS.createCell(19).setCellValue(hh)
                rowS.setRowStyle(style)
                Row rowS1 = sheet.createRow(fila + 1)
                rowS1.createCell(17).setCellValue("Total del periodo")
                rowS1.createCell(19).setCellValue(suma + hh)
                rowS1.setRowStyle(style)
            }


//        println "--> ${profesor?.apellido + "_" + profesor?.nombre}"
//        if(generaArch) {
//            def file = new File("/tmp/profesor_${profesor?.apellido + "_" + profesor?.nombre}.xlsx")
//            FileOutputStream outputStream = new FileOutputStream(file)
//            wb.write(outputStream)
//        } else {
//            def output = response.getOutputStream()
//            def header = "attachment; filename=" + "profesor_${profesor?.apellido + " " + profesor?.nombre}.xlsx";
//            response.setContentType("application/octet-stream")
//            response.setHeader("Content-Disposition", header);
//            wb.write(output)
//        }

        return fila
    }

}