/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.ObjectDTO;
import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.models.TeamDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author HP
 */
public class ImportExcel {

    public static final int COLUMN_INDEX_ID = 0;
    public static final int COLUMN_INDEX_EMAIL = 1;
    public static final int COLUMN_INDEX_NAME = 2;
    public static final int COLUMN_INDEX_IMAGE = 3;
    public static final int COLUMN_INDEX_TEAM = 4;

    public static void main(String[] args) throws IOException, SQLException {        

    }

    public static void addToDatabase(String path) throws IOException, SQLException{
        final String excelFilePath = path;
//        final String excelFilePath = "D:/FPT University/CN5/SWP391/student.xlsx";
        final List<ObjectDTO> objects = readExcel(excelFilePath);
        TeamDAO team = new TeamDAO();
        UserDAO user = new UserDAO();
        StudentDAO student = new StudentDAO();

        for (ObjectDTO object : objects) {
            UUID uuid = UUID.randomUUID();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String createDate = now.toString();
            String teamId = uuid.toString();

            if (team.getTeamByName(object.getTeam()) == null) {
                team.insertTeam(new TeamDTO(teamId, object.getTeam()));
            }
            if (student.getStudent(object.getId()) == null) {

                student.insertStudent(new StudentDTO(object.getId(), object.getName(), "1", object.getImage(), team.getTeamByName(object.getTeam()).getTeamID()));
                user.addUser(new UserDTO(object.getId(), object.getName(), createDate, 2, object.getImage(), object.getEmail(), "123456", null, 1));
            }
            System.out.println(object);
        }
    }
    public static List<ObjectDTO> readExcel(String excelFilePath) throws FileNotFoundException, IOException {
        List<ObjectDTO> listObject = new ArrayList<>();

        InputStream inputStream = new FileInputStream(new File(excelFilePath));

        Workbook workBook = getWorkbook(inputStream, excelFilePath);

        Sheet sheet = workBook.getSheetAt(0);

        Iterator<Row> iterator = sheet.iterator();
        while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            if (nextRow.getRowNum() == 0) {
                continue;
            }

            Iterator<Cell> cellIterator = nextRow.cellIterator();

            ObjectDTO object = new ObjectDTO();

            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                Object cellValue = getCellValue(cell);
                if (cellValue == null || cellValue.toString().isEmpty()) {
                    continue;
                }
                int columnIndex = cell.getColumnIndex();
                switch (columnIndex) {
                    case COLUMN_INDEX_ID:
                        String id = (String) getCellValue(cell);
                        object.setId(id);
                        break;
                    case COLUMN_INDEX_EMAIL:
                        String email = (String) getCellValue(cell);
                        object.setEmail(email);
                        break;
                    case COLUMN_INDEX_NAME:
                        String name = (String) getCellValue(cell);
                        object.setName(name);
                        break;
                    case COLUMN_INDEX_IMAGE:
                        String image = (String) getCellValue(cell);
                        object.setImage(image);
                        break;
                    case COLUMN_INDEX_TEAM:
                        String teamName = (String) getCellValue(cell);
                        object.setTeam(teamName);
                        break;
                    default:
                        break;
                }

            }
            listObject.add(object);
        }
        workBook.close();
        inputStream.close();

        return listObject;
    }

    private static Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws IOException {
        Workbook workbook = null;
        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(inputStream);
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook(inputStream);
        } else {
            throw new IllegalArgumentException("The specified file is not Excel file");
        }

        return workbook;
    }

    private static Object getCellValue(Cell cell) {
        CellType cellType = cell.getCellType();
        Object cellValue = null;
        switch (cellType) {
            case BOOLEAN:
                cellValue = cell.getBooleanCellValue();
                break;
            case FORMULA:
                Workbook workbook = cell.getSheet().getWorkbook();
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                cellValue = evaluator.evaluate(cell).getNumberValue();
                break;
            case NUMERIC:
                cellValue = cell.getNumericCellValue();
                break;
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case _NONE:
            case BLANK:
            case ERROR:
                break;
            default:
                break;
        }

        return cellValue;
    }

}
