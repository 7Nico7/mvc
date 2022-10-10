package Model;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Registrar {

    public static void climas() throws FileNotFoundException, IOException  {
        FileInputStream archivo = new FileInputStream("C:\\CLIMAS-2022 vigente.xlsx");
        XSSFWorkbook libro = new XSSFWorkbook(archivo);
        XSSFSheet hoja = libro.getSheetAt(2);
        int numero_filas = hoja.getLastRowNum();

        for (int x = 0; x <= numero_filas; x++) {
            Row fila = hoja.getRow(x);
            int numero_columnas = fila.getLastCellNum();
            for (int y = 0; y < numero_columnas; y++) {
                Cell celda = fila.getCell(y);

                switch ((celda.getCellType()).toString()) {
                    case "NUMERIC":
                        System.err.print(celda.getNumericCellValue() + " ");
                        break;
                    case "STRING":
                        System.err.print(celda.getStringCellValue() + " ");
                        break;
                }
            }
            
            System.out.println("");

        }
    }

    public static void main(String[] args) throws FileNotFoundException, IOException {
        climas();
    }

}
