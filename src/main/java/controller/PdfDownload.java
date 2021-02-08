package controller;

import bean.GetUserBean;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


public class PdfDownload extends AbstractITextPdfView{


    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {

            List<GetUserBean> userList = (List<GetUserBean>) model.get("userList");
//            System.out.println("stList in PdfDownload ==== "+ userList);

            PdfPTable table = new PdfPTable(8);
            table.setWidthPercentage(100.0f);
            table.setWidths(new float[] {2.0f, 2.0f, 2.0f, 2.0f, 2.0f, 2.0f,2.0f,2.0f});
            table.setSpacingBefore(10);

            // define font for table header row
            Font font = FontFactory.getFont(FontFactory.HELVETICA);
            font.setColor(BaseColor.WHITE);

            // define table header cell
            PdfPCell cell = new PdfPCell();
            cell.setBackgroundColor(BaseColor.BLACK);
            cell.setPadding(5);

            // write table header
            cell.setPhrase(new Phrase("FName", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("LName", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Year", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Email", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Phone", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Photo", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("UserID", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Roll", font));
            table.addCell(cell);

            // write table row data
            for (GetUserBean n : userList) {
                table.addCell(n.getFname());
                table.addCell(n.getLname());
                table.addCell(n.getReg_year());
                table.addCell(n.getEmail());
                table.addCell(n.getPhone());
                table.addCell(String.valueOf(n.getEncode_photo().getBytes()));
                table.addCell(n.getUser_id());
                table.addCell(n.getRoll());
            }

            doc.add(table);

        }catch (Exception e){
            System.out.println(e);
        }
    }
}

