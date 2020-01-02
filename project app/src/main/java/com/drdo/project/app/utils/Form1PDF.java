package com.drdo.project.app.utils;

import com.drdo.project.app.entity.Contents;
import com.drdo.project.app.entity.FundDetail;
import com.drdo.project.app.entity.Project;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@SuppressWarnings(value = "all")
public class Form1PDF {
    private String username;
    private PdfPCell cell;
    private Logger logger = LoggerFactory.getLogger(Form1PDF.class);

    public void getPDF(Project project, HttpServletResponse response) throws IOException {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        OutputStream os;
        os = response.getOutputStream();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        Document document = new Document();
        try {
            response.setContentType("application/pdf");
            PdfWriter pdfWriter = PdfWriter.getInstance(document, byteArrayOutputStream);
            document.open();
            document.addCreationDate();
            document.addAuthor(username);
            document.addTitle(project.getProjectNo());
            Paragraph heading = new Paragraph("STATEMENT OF CASE FOR SANCTION OF PROJECT", new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD));
            heading.setAlignment(Element.ALIGN_CENTER);
            heading.setSpacingAfter(40);
            document.add(heading);
            PdfPTable pdfPTable = new PdfPTable(2);
            pdfPTable.setWidthPercentage(100);
            float[] columnWidths = {1f, 1f};
            pdfPTable.setWidths(columnWidths);
            cell = new PdfPCell(new Paragraph("Name of laboratory/establishment:"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getNodalLabName()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Title of the Project:"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getTitleOfProject()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Category:"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getProjectCategory()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Security classification of project:"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getProjectSecurityLevel()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            if (project.getProjectCategory().contains("Mission Mode")){
                cell = new PdfPCell(new Paragraph("GSQR/NSR/ASR No.:"));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setPaddingBottom(20);
                pdfPTable.addCell(cell);
                cell = new PdfPCell(new Paragraph(project.getGsqr()));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setPaddingBottom(20);
                pdfPTable.addCell(cell);
            }
            cell = new PdfPCell(new Paragraph("Cost (Rs. in Cr):"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getTotalCost() + " Total(FE)" + project.getForeignExchange()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Duration (in months):"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getDuration()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Is it a FYP Plan/LTTPP Project?"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getPlanningStatus()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            if (project.getPlanningStatus().equalsIgnoreCase("yes")){
                cell = new PdfPCell(new Paragraph("Please give Reference (please quote Page No., Table No., S.No. of FYP Document)"));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setPaddingBottom(20);
                pdfPTable.addCell(cell);
                cell = new PdfPCell(new Paragraph(""));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setPaddingBottom(20);
                pdfPTable.addCell(cell);
            }
            else {
                cell = new PdfPCell(new Paragraph("Please give Justification for undertaking the project"));
                cell.setBorder(Rectangle.NO_BORDER);
                pdfPTable.addCell(cell);
                cell = new PdfPCell(new Paragraph(""));
                cell.setBorder(Rectangle.NO_BORDER);
                pdfPTable.addCell(cell);
            }
            cell = new PdfPCell(new Paragraph("Is detailed feasibility study report enclosed?"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Yes/No"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Recommendation of Cluster Council/DMC?"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Yes/No"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Is PEARL Analysis Report enclosed?"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Yes/No"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Is Project Execution Plan attached?"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Yes/No"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Project Deliverables/Output:"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getDeliverables().toString()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph("Name of the Project Director/Programme Director:"));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            pdfPTable.addCell(cell);
            cell = new PdfPCell(new Paragraph(project.getDirector()));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setPaddingBottom(20);
            document.add(pdfPTable);
            Paragraph content = new Paragraph("CONTENTS", new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD));
            content.setAlignment(Element.ALIGN_CENTER);
            document.add(content);
            document.add(new Paragraph("Part-I (Macro Details)"));
            document.add(Chunk.NEWLINE);
            PdfPTable macro = new PdfPTable(3);
            macro.setWidthPercentage(80);
            float[] widths = {1f, 2f, 1f};
            macro.setWidths(widths);
            macro.addCell(new Paragraph("Para/Item Number"));
            macro.addCell(new Paragraph("Description"));
            macro.addCell(new Paragraph("Page Nos."));
            for (Contents c :project.getMacroDetails()){
                macro.addCell(new Paragraph(Integer.toString(c.getItemNumber())));
                macro.addCell(new Paragraph(c.getDescription()));
                macro.addCell(new Paragraph(c.getPageNo()));
            }
            document.add(macro);
            document.add(new Paragraph("Part-II (Micro Details)"));
            document.add(Chunk.NEWLINE);
            PdfPTable micro = new PdfPTable(3);
            micro.setWidthPercentage(80);
            micro.setWidths(widths);
            micro.addCell(new Paragraph("Para/Item Number"));
            micro.addCell(new Paragraph("Description"));
            micro.addCell(new Paragraph("Page Nos."));
            for (Contents c :project.getMicroDetails()){
                micro.addCell(new Paragraph(Integer.toString(c.getItemNumber())));
                micro.addCell(new Paragraph(c.getDescription()));
                micro.addCell(new Paragraph(c.getPageNo()));
            }
            document.add(micro);
            Paragraph part1 = new Paragraph("Part-I", new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD));
            part1.setAlignment(Element.ALIGN_CENTER);
            part1.setSpacingAfter(10);
            document.add(part1);
            PdfPTable part1Table = new PdfPTable(2);
            part1Table.setWidthPercentage(100);
            part1Table.getDefaultCell().setPaddingBottom(20);
            part1Table.getDefaultCell().setBorder(Rectangle.NO_BORDER);
            float[] width = {1f, 1f};
            part1Table.setWidths(width);
            part1Table.addCell(new Paragraph("Title of the Project"));
            part1Table.addCell(new Paragraph(project.getTitleOfProject()));
            part1Table.addCell(new Paragraph("Short Name or Acronym"));
            part1Table.addCell(new Paragraph(""));
            part1Table.addCell(new Paragraph("Title of the Programme (If Any)"));
            part1Table.addCell(new Paragraph(""));
            part1Table.addCell(new Paragraph("Objective"));
            part1Table.addCell(new Paragraph("Desirable/Essential"));
            part1Table.addCell(new Paragraph("Is it a Multi-lab Project?"));
            if (project.getOtherLabs().size()>0)
                part1Table.addCell(new Paragraph("Yes"));
            else
                part1Table.addCell(new Paragraph("No"));
            part1Table.addCell(new Paragraph("Please specify the User(s) (Please attach the GSQR/NSR/ASR for MM projects)"));
            part1Table.addCell(new Paragraph("Army/Air Force/Navy/Inter-services/DRDO"));
            part1Table.addCell(new Paragraph("Breakup of Cost (Rs. in Cr)"));
            part1Table.addCell(new Paragraph(""));
            document.add(part1Table);
            document.add(new Paragraph("Major Head-2080, Revenue"));
            document.add(Chunk.NEWLINE);
            PdfPTable revenue = new PdfPTable(4);
            revenue.getDefaultCell().setPaddingBottom(20);
            float[] fundWidth = {1f, 2f, 1f, 1f};
            revenue.setWidths(fundWidth);
            revenue.setWidthPercentage(80);
            revenue.addCell(new Paragraph("Minor Head"));
            revenue.addCell(new Paragraph("Heads of Expenditure"));
            revenue.addCell(new Paragraph("IC"));
            revenue.addCell(new Paragraph("FE"));
            double revenueSum=0;
            List<FundDetail> fundDetails = project.getFundDetails();
            for (FundDetail f:fundDetails){
                if (f.getType().contains("2080")){
                    revenueSum+=f.getIc();
                    revenue.addCell(new Paragraph(Integer.toString(f.getMinorHead())));
                    revenue.addCell(new Paragraph(f.getItem()));
                    revenue.addCell(new Paragraph(String.valueOf(f.getIc())));
                    revenue.addCell(new Paragraph(String.valueOf(f.getFe())));
                }
            }
            document.add(revenue);
            Paragraph revenueTotal = new Paragraph("Total (Revenue): " + revenueSum);
            revenueTotal.setSpacingAfter(20);
            document.add(revenueTotal);
            document.add(new Paragraph("Major Head-4076, Capital"));
            document.add(Chunk.NEWLINE);
            PdfPTable capital = new PdfPTable(4);
            float[] fundWidths = {1f, 2f, 1f, 1f};
            capital.setWidths(fundWidths);
            capital.getDefaultCell().setPaddingBottom(20);
            capital.setWidthPercentage(80);
            capital.addCell(new Paragraph("Minor Head"));
            capital.addCell(new Paragraph("Heads of Expenditure"));
            capital.addCell(new Paragraph("IC"));
            capital.addCell(new Paragraph("FE"));
            double capitalSum=0;
            for (FundDetail f:fundDetails){
                if (f.getType().contains("4076")){
                    capitalSum+=f.getIc();
                    capital.addCell(new Paragraph(Integer.toString(f.getMinorHead())));
                    capital.addCell(new Paragraph(f.getItem()));
                    capital.addCell(new Paragraph(String.valueOf(f.getIc())));
                    capital.addCell(new Paragraph(String.valueOf(f.getFe())));
                }
            }
            document.add(capital);
            document.add(new Paragraph("Total (Capital): " + capitalSum));
            document.add(new Paragraph("GRAND TOTAL (REVENUE + CAPITAL): " + (revenueSum + capitalSum)));
            document.add(new Paragraph("Note:", new Font(Font.FontFamily.HELVETICA,10, Font.ITALIC)));
            com.itextpdf.text.List note = new com.itextpdf.text.List(com.itextpdf.text.List.ORDERED);
            Font noteF = new Font(Font.FontFamily.HELVETICA ,10, Font.ITALIC);
            note.add(new ListItem("Details of the equipment, machinery and store costing more than Rs 50 lakh or 10% of the project cost- whichever is less to be provided" +
                    "as Annexure, giving cost, FE(if any), and the month/year of procurement during implementation of the project.", noteF));
            note.add(new ListItem("EPC approval along with project sanction is mandatory in MM projects and part of the main sanction file. For other categories," +
                    "the file for EPC approval may move in parallel with the project sanction file.", noteF));
            note.add(new ListItem("Project sanction file will not move for vehicle sanction to DHRD. This will be processed seperately only after project approval is accorded.", noteF));
            document.add(note);
            document.add(new Paragraph("Additional requirement of mechanical transport vehicles specific to the project, for equipment/developed systems" +
                    "and stores(with justification)"));
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("Proposed year wise financial committment/cash out flow (Rs in Cr)"));
            document.add(Chunk.NEWLINE);
            PdfPTable cashFlow = new PdfPTable(4);
            cashFlow.getDefaultCell().setPaddingBottom(20);
            float[] cwidth = {1f, 1f, 1f, 1f};
            cashFlow.setWidths(cwidth);
            cashFlow.setWidthPercentage(60);
            Font noteC = new Font(Font.FontFamily.HELVETICA ,12, Font.BOLD);
            Font noteT = new Font(Font.FontFamily.HELVETICA ,8, Font.BOLD);
            cashFlow.addCell(new Paragraph("Year", noteC));
            cashFlow.addCell(new Paragraph("IC", noteC));
            cashFlow.addCell(new Paragraph("FE", noteC));
            cashFlow.addCell(new Paragraph("Total", noteC));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            cashFlow.addCell(new Paragraph(" "));
            document.add(cashFlow);
            document.add(new Paragraph("Proposed project deliverables:"));
            com.itextpdf.text.List del = new com.itextpdf.text.List();
            del.add("No of prototypes for testing ________________");
            del.add("No of (type approved/qulified) deliverables _________________");
            document.add(del);
            document.add(new Paragraph("Any other information"));
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("List of enclosures"));
            com.itextpdf.text.List enclosures = new com.itextpdf.text.List(com.itextpdf.text.List.NUMERICAL);
            enclosures.add("___________________________________");
            enclosures.add("___________________________________");
            enclosures.add("___________________________________");
            enclosures.add("___________________________________");
            document.add(enclosures);
            Paragraph part2 = new Paragraph("Part-II", new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD));
            part2.setAlignment(Element.ALIGN_CENTER);
            part2.setSpacingAfter(10);
            document.add(part2);
            document.add(new Paragraph("1. Brief Technical appreciation(This should include objective, scope, relevances of the project to the charter of the Lab/Estt. and Mission in maximum 1 or 2 pages only).", noteC));
            com.itextpdf.text.List sub = new com.itextpdf.text.List(com.itextpdf.text.List.ORDERED);
            sub.add("Justification(need) for undertaking the project/programme along with the recommendation of the cluster council/DMC(please attach minutes) ");
            sub.add("Competence level/prelimenary work done to acquire the same. ");
            sub.add("Brief of PEARL analysis. Initial MRL indices at the time of undertaking the project and likely MRL levels at the time of closure of the project as accepted by Peer Review Committee. ");
            sub.add("Peer Review Committe recommendations (please enclose the approved copy of minutes of the peer review committtee meeting). ");
            sub.add("PERT/Gantt Charts. ");
            sub.add("Major milestones(not > 6) linking financial outlay and timelines. ");
            sub.add("Critical factors/technology involved. ");
            sub.add("High development risk areas and remedial actions proposed. ");
            sub.add("Plan of action for prototype development/execution plan. ");
            sub.add("Realisation Plan");
            sub.add("Testing Plan ");
            sub.add("Development Partners. ");
            sub.add("Production agencies proposed. ");
            sub.add("Costs benefit analysis/spin-off benefits. ");
            sub.add("Project management and monitoring structure proposed.");
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("2. If the project is to be executed by multiple laboratories, please outline the agreed work-packages between the various labs/estts. ", noteC));
            document.add(Chunk.NEWLINE);
            PdfPTable table1 = new PdfPTable(6);
            float[] w = {1f, 1f, 1f, 1f, 1f, 1f};
            table1.setWidths(w);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            table1.addCell(new Paragraph("S.No", noteT));
            table1.addCell(new Paragraph("Nature of Work", noteT));
            table1.addCell(new Paragraph("Lab/Estt.", noteT));
            table1.addCell(new Paragraph("Cost(Rs. in Cr)", noteT));
            table1.addCell(new Paragraph("PDC(in months)", noteT));
            table1.addCell(new Paragraph("Remarks", noteT));
            for (int i = 0; i < 18; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("3. List of major additional facilities(capital) required for the project \n" +
                    "    (Please highlight status of similar facilities existing with the laboratory as wekk as other RDO labs/estts. and why they cannot be utilized) ", noteC));
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.NUMERICAL);
            sub.add("___________________________________________________________________");
            sub.add("___________________________________________________________________");
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("4. Major training requirements", noteC));
            document.add(Chunk.NEWLINE);
            table1 = new PdfPTable(7);
            float[] w2 = {1f, 1f, 1f, 1f, 1f, 1f, 1f};
            table1.setWidths(w2);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            table1.addCell(new Paragraph("S.No", noteT));
            table1.addCell(new Paragraph("Discipline/area for training", noteT));
            table1.addCell(new Paragraph("Agency contacted", noteT));
            table1.addCell(new Paragraph("No of Personnel proposed to be trained", noteT));
            table1.addCell(new Paragraph("Duration", noteT));
            table1.addCell(new Paragraph("Cost", noteT));
            table1.addCell(new Paragraph("Remarks", noteT));
            for (int i = 0; i < 21; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("5. Details of Sub-Projects/Work Packages(Seperate Tables) ", noteC));
            table1 = new PdfPTable(6);
            document.add(Chunk.NEWLINE);
            table1.setWidths(w);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            table1.addCell(new Paragraph("S.No", noteT));
            table1.addCell(new Paragraph("Title of Sub-Project", noteT));
            table1.addCell(new Paragraph("Objectives and scope of work", noteT));
            table1.addCell(new Paragraph("*DRDO Lab.Estt.", noteT));
            table1.addCell(new Paragraph("Cost(Rs in Cr)", noteT));
            table1.addCell(new Paragraph("PDC(in months)", noteT));
            for (int i = 0; i < 18; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
            sub.add("*Sub-Projects can be gien to DRDO labs only. However, work packages can be given to other Govt. agencies like DAE, DoS, Council of Scientific and Industrial Research(CSIR), ISRO etc. Proposals of     Sub-Projects/Work Packages duly signed by competent authority should be submitted along with the main proposal. ");
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("6. Details of CARS ", noteC));
            document.add(Chunk.NEWLINE);
            table1 = new PdfPTable(7);
            table1.setWidths(w2);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            table1.addCell(new Paragraph("S.No", noteT));
            table1.addCell(new Paragraph("Name of Institute/Agency", noteT));
            table1.addCell(new Paragraph("Area where R&D is required", noteT));
            table1.addCell(new Paragraph("Cost", noteT));
            table1.addCell(new Paragraph("PDC", noteT));
            table1.addCell(new Paragraph("Confidence level of the agency", noteT));
            table1.addCell(new Paragraph("Remarks", noteT));
            for (int i = 0; i < 21; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
            sub.add("Note: Correspondence made with the agencies contacted for undertaking the research activity and their willingness for the same should be enclosed.. ");
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("7. Details of Consulatancy requirements ", noteC));
            table1 = new PdfPTable(6);
            document.add(Chunk.NEWLINE);
            table1.setWidths(w);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            table1.addCell(new Paragraph("S.No", noteT));
            table1.addCell(new Paragraph("Discipline/Area", noteT));
            table1.addCell(new Paragraph("Agency", noteT));
            table1.addCell(new Paragraph("Cost", noteT));
            table1.addCell(new Paragraph("Confidence level of the agency", noteT));
            table1.addCell(new Paragraph("Remarks", noteT));
            for (int i = 0; i < 18; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
            sub.add("Note: Correspondence nade with the agency contacted for offering consultancy and their willingness for the sme shoukd be enclosed. ");
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("8. Details of additional manpower requirements ", noteC));
            document.add(Chunk.NEWLINE);
            table1 = new PdfPTable(6);
            table1.setWidths(w);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            table1.addCell(new Paragraph("S.No", noteT));
            table1.addCell(new Paragraph("Discipline/Rank", noteT));
            table1.addCell(new Paragraph("Discipline", noteT));
            table1.addCell(new Paragraph("Number(s)", noteT));
            table1.addCell(new Paragraph("Period/Duration", noteT));
            table1.addCell(new Paragraph("Remarks", noteT));
            for (int i = 0; i < 18; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
            sub.add("Note: Addtional manpower requirement should be in consonance with the manpower roadmap submitted to DHRD. Demand for additional manpower will acccrue negative score and will lead towards less chances of project sanction. ");
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("9. Details of additional building space requirement", noteC));
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.ORDERED);
            sub.add("(Funds for construction of building shoukd be booked under the Major Head-4076(Capital)/Sub Head-111(Works)");
            sub.add("(AE's should be obtained from concerned CCE/DCW&E and appended with the proposal)");
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("10. Any other information(Important for the project but not covered above). ", noteC));
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("11. Comments of Project Director with signature and date ", noteC));
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("12. Following detials need to be certified by Lab Director ", noteC));
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.ORDERED);
            sub.add("Manpower of Lab:\t        \tDRDS- \t        \tDRTC -  ");
            sub.add("Details of the ongoing Projects/Programmes of the lab in hand:");
            document.add(sub);
            table1 = new PdfPTable(8);
            float[] w3 = {1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
            table1.setWidths(w3);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            document.add(Chunk.NEWLINE);
            table1.addCell(new Paragraph("S.No", noteT));
            table1.addCell(new Paragraph("Title of the project", noteT));
            table1.addCell(new Paragraph("Project No", noteT));
            table1.addCell(new Paragraph("Cost(in Cr) Original/Current", noteT));
            table1.addCell(new Paragraph("Date of Sanction", noteT));
            table1.addCell(new Paragraph("PDC Original/Current", noteT));
            table1.addCell(new Paragraph("Name of project director", noteT));
            table1.addCell(new Paragraph("Status of Completion (Deisgn/Realisation/Testing stage)", noteT));
            for (int i = 0; i < 24; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
            sub.add("Recommendation of Lab Director with signature/date.");
            sub.add(Chunk.NEWLINE);
            sub.add(Chunk.NEWLINE);
            sub.add(Chunk.NEWLINE);
            sub.add(Chunk.NEWLINE);
            sub.add(Chunk.NEWLINE);
            document.add(sub);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("13. Attribute Table as filled by Director(PM) of cluster DG during Annual Selection of Projects ", noteC));
            table1 = new PdfPTable(8);
            table1.setWidths(w3);
            table1.setWidthPercentage(90);
            table1.getDefaultCell().setPaddingBottom(20);
            document.add(Chunk.NEWLINE);
            table1.addCell(new Paragraph("1", noteT));
            table1.addCell(new Paragraph("2", noteT));
            table1.addCell(new Paragraph("3", noteT));
            table1.addCell(new Paragraph("4", noteT));
            table1.addCell(new Paragraph("5", noteT));
            table1.addCell(new Paragraph("6", noteT));
            table1.addCell(new Paragraph("7", noteT));
            table1.addCell(new Paragraph("8", noteT));
            table1.addCell(new Paragraph("Project Name", noteT));
            table1.addCell(new Paragraph("Alignment with Lab's Mandate/Mission\n" +
                    "\n" +
                    "(0-5)", noteT));
            table1.addCell(new Paragraph("Core Competence of Lab\n" +
                    "\n" +
                    "(0-5)", noteT));
            table1.addCell(new Paragraph("Alignment with DRDO's LTTPP\n" +
                    "\n" +
                    "(0-5)", noteT));
            table1.addCell(new Paragraph("Project Output - S&T merit (for TD/S&T projects)\n" +
                    "\n" +
                    "(1 - 5)\n" +
                    "\n" +
                    "1. low impact\n" +
                    "5. high imapact/high use", noteT));
            table1.addCell(new Paragraph("Project Output - Potentianl for transisition to next Category/ToT(for TD/MM projects)\n" +
                    "\n" +
                    "(1 - 5)", noteT));
            table1.addCell(new Paragraph("Need for additional HR\n" +
                    "\n" +
                    "(0 to -5)", noteT));
            table1.addCell(new Paragraph("Total Score\n" +
                    "\n" +
                    "(Sum of Col 1-7)", noteT));
            for (int i = 0; i < 24; i++)
                table1.addCell(new Paragraph(" "));
            document.add(table1);
            document.add(Chunk.NEWLINE);
            document.add(new Paragraph("14. Recommendations of concerned Cluster DG with signature and date.", noteC));
            sub = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
            sub.add(Chunk.NEWLINE);
            sub.add(Chunk.NEWLINE);
            sub.add(Chunk.NEWLINE);
            sub.add(Chunk.NEWLINE);
            sub.add(new Paragraph("Note: Cluster DG will offer his comments/recommendations taking a holistic view on necessity, availability of technology/expertise, manpower, resource availability " +
                    "and overall possibility of successful execution of the project/programme within project timelines. ", new Font(Font.FontFamily.HELVETICA, Font.ITALIC)));
            document.add(sub);
            document.close();
            pdfWriter.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        response.setContentLength(byteArrayOutputStream.size());
        response.setHeader("Content-Disposition", "attachment; filename=" + project.getProjectNo() + ".pdf");
        byteArrayOutputStream.writeTo(os);
        if (os!=null){
            os.flush();
            os.close();
        }
    }
}

