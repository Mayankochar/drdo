package com.drdo.project.app.utils;

import com.drdo.project.app.entity.Project;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

@SuppressWarnings(value = "all")
public class Form7PDF {

    private String username;
    private PdfPCell cell;
    private Logger logger = LoggerFactory.getLogger(Form1PDF.class);

    public void getPDF(Project project, HttpServletResponse response, HttpServletRequest request) throws IOException, DocumentException {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        OutputStream os;
        os = response.getOutputStream();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        Document document = new Document();
        response.setContentType("application/pdf");
        PdfWriter pdfWriter = PdfWriter.getInstance(document, byteArrayOutputStream);
        document.open();
        document.addCreationDate();
        document.addAuthor(username);
        document.addTitle(project.getProjectNo() + " PDC Extension");
        Paragraph heading = new Paragraph("STATEMENT OF CASE FOR PDC EXTENSION", new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD));
        heading.setAlignment(Element.ALIGN_CENTER);
        heading.setSpacingAfter(40);
        document.add(heading);
        PdfPTable pdfPTable = new PdfPTable(2);
        pdfPTable.setWidthPercentage(100);
        float[] columnWidths = {1f, 1f};
        pdfPTable.setWidths(columnWidths);
        cell = new PdfPCell(new Paragraph("1. Title of the Project"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph(project.getTitleOfProject()));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("2. Project/Programme no."));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph(project.getProjectNo()));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("3. Name of Lab"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph(project.getNodalLabName()));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("4. Sponsoring Agency"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph(request.getParameter("Sponsoring_Agency")));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("5. Sanction Cost (in Cr)"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("IC: " + String.valueOf(project.getTotalCost()) + "(FE)" + String.valueOf(project.getForeignExchange())));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("6. Date of Initiation"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph(String.valueOf(project.getSanctionDate())));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("7. Amount spent so far (in Cr)"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("Spent \t - IC" + request.getParameter("Amount_Spent_So_Far_Spent_IC")+ "(FE" + request.getParameter("Amount_Spent_So_Far_Spent_FE") +") \n\nCommitted - IC" + request.getParameter("Amount_Spent_So_Far_Commited_IC") +" (FE" + request.getParameter("Amount_Spent_So_Far_Commited_FE")+") \n\nIn Pipeline - IC" + request.getParameter("Amount_Spent_So_Far_Pipeline_IC") +" (FE" + request.getParameter("Amount_Spent_So_Far_Pipeline_FE") +")"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph("8. PDC Original (subsequent if any)"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        if (project.getPdcList().size()>1){
            for (Date d : project.getPdcList()){
                cell = new PdfPCell(new Paragraph(String.valueOf(d)));
                cell.setPaddingBottom(20);
                cell.setBorder(Rectangle.NO_BORDER);
                pdfPTable.addCell(cell);
            }
        }
        cell = new PdfPCell(new Paragraph("9. Work done so far with milestones achieved"));
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        cell = new PdfPCell(new Paragraph());
        cell.setPaddingBottom(20);
        cell.setBorder(Rectangle.NO_BORDER);
        pdfPTable.addCell(cell);
        document.add(pdfPTable);
        List list = new List(List.ORDERED);
        list.setFirst(10);
        list.add(new ListItem("Re-allocation of funds"));
        List sublist = new List(false, true, 30);
        sublist.add("Details of head-wise funds to be re-allocated");
        sublist.add("Reasons/Justification for re-allocation of funds (Point-wise justifiable and defendable reasons may be highlited)");
        sublist.add("Recommendations of highest monitoring committee for re-allocation of funds");
        sublist.add("Details of project monitoring committees meetings planned as per the Govt. letter vis-a-vis held along with their respective minutes");
        sublist.add("Remedial steps undertaken to avoid further re-allocation in future");
        list.add(sublist);
        document.add(list);
        list = new List(List.ORDERED);
        list.setFirst(11);
        list.add(new ListItem("Cost enhancement"));
        sublist = new List(false, true, 30);
        sublist.add("Proposed project cost (Cr)");
        sublist.add("Head-wise details of enhanced/proposed project cost (Cr)");
        sublist.add("Reasons/justification for cost enhancement (Point-wise justifiable and defendable reasons may be highlighted)");
        sublist.add("Recommendation of highest monitoring committee for cost enhancement (please append the minutes)");
        sublist.add("Supporting documents (budgetary quotes, email quotes etc) for cost enhancement");
        sublist.add("Details of project monitoring committees meetings planned vis-a-vis held as per the Govt. letter (please append the minutes)");
        sublist.add("Remedial steps undertaken to avoid further cost enhancement in future");
        list.add(sublist);
        document.add(list);
        Paragraph paragraph = new Paragraph("12. General assessment of status (health) of project (views of the project leader/project Director may be brought out)");
        document.add(paragraph);
        paragraph = new Paragraph("13. Check list for submission of case for re-allocation of funds/cost enhancement duly signed by competent Authority (Enclosed/Not Enclosed)");
        document.add(paragraph);
        paragraph = new Paragraph("Approved/Not Approved", new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD));
        paragraph.setAlignment(Element.ALIGN_CENTER);
        paragraph.setSpacingAfter(50);
        document.add(paragraph);
        paragraph = new Paragraph("(Laboratory Director)", new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD));
        paragraph.setAlignment(Element.ALIGN_CENTER);
        paragraph.setSpacingAfter(100);
        document.add(paragraph);
        paragraph = new Paragraph("(Competent Authority)", new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD));
        paragraph.setAlignment(Element.ALIGN_CENTER);
        document.add(paragraph);
        paragraph = new Paragraph("Note: In case of re-allocation of funds of the project/programme, case files need not be routed through DP&C.", new Font(Font.FontFamily.HELVETICA, 10, Font.BOLDITALIC));
        document.add(paragraph);
        document.close();
        pdfWriter.close();
        response.setContentLength(byteArrayOutputStream.size());
        response.setHeader("Content-Disposition", "attachment; filename=" + project.getProjectNo() + "Form7.pdf");
        byteArrayOutputStream.writeTo(os);
        if (os!=null){
            os.flush();
            os.close();
        }
    }
}
