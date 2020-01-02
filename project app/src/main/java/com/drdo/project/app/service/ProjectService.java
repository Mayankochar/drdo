package com.drdo.project.app.service;

import com.drdo.project.app.entity.ComMember;
import com.drdo.project.app.entity.Contents;
import com.drdo.project.app.entity.FundDetail;
import com.drdo.project.app.entity.Project;
import com.drdo.project.app.repository.ProjectRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ProjectService {

    private Logger logger = LoggerFactory.getLogger(ProjectService.class);
    @Autowired
    private ProjectRepository projectRepository;

    private void setPDC(Project project, Boolean first){
        Calendar calendar = Calendar.getInstance();
        if (project.getSanctionDate()==null)return;
        if (first)
            calendar.setTime(project.getSanctionDate());
        else
            calendar.setTime(project.getPdc());
        logger.info(project.getDuration());
        calendar.add(Calendar.MONTH, Integer.parseInt(project.getDuration()));
        project.setPdc(calendar.getTime());
        project.getPdcList().add(project.getPdc());
    }

    public String add(Project project){
        Project foundProject = projectRepository.findByProjectNo(project.getProjectNo());
        if (foundProject==null){
            setPDC(project, true);
            projectRepository.save(project);
            return "success";
        }
        return "already exists";
    }

    public List<String> listProjects(){
        return projectRepository.findAllProjects();
    }

    public Project loadProject(String projectNo){
        return projectRepository.findByProjectNo(projectNo);
    }

    private String[] retrievefundTypeObject(HttpServletRequest request) {
        String fundType=request.getParameter("fundType");
        return fundType.split(",");
    }

    private String[] retrieveItemArray(HttpServletRequest request) {
        String item=request.getParameter("title");
        return item.split(",");
    }

    private String[] retrieveicArray(HttpServletRequest request) {
        String ic=request.getParameter("ic");
        return ic.split(",");
    }

    private String[] retrievefeArray(HttpServletRequest request) {
        String fe=request.getParameter("fe");
        return fe.split(",");
    }

    private String[] retrieveMinorHeadArray(HttpServletRequest request) {
        String minorHead=request.getParameter("minor_head");
        return minorHead.split(",");
    }

    private String[] retrieveObjectivesArray(HttpServletRequest request) {
        String objectives=request.getParameter("objectives");
        return objectives.split(",");
    }

    private String[] retrieveScopesArray(HttpServletRequest request) {
        String scopes=request.getParameter("scopes");
        return scopes.split(",");
    }

    private String[] retrieveDeliverablesArray(HttpServletRequest request) {
        String deliverables=request.getParameter("deliverables");
        return deliverables.split(",");
    }

    public void retrieveObject(HttpServletRequest request, Project project) {
        ArrayList<FundDetail> fundDetails = new ArrayList<>();
        String[] fundtypeArray = retrievefundTypeObject(request);
        String[] fundItem = retrieveItemArray(request);
        String[] fundIcArray = retrieveicArray(request);
        String[] fundFeArray = retrievefeArray(request);
        String[] fundMinorHeadArray = retrieveMinorHeadArray(request);
        String[] otherLabs = request.getParameter("otherLabs").split(",");
        int index = 0;
        logger.info(request.getParameter("fundType"));
        logger.info(request.getParameter("item"));
        logger.info(request.getParameter("fe"));
        logger.info(request.getParameter("ic"));
        logger.info(request.getParameter("minor_head"));
        for (String s: fundtypeArray){
            fundDetails.add(new FundDetail(Integer.parseInt(fundMinorHeadArray[index]), s, fundItem[index], Double.parseDouble(fundIcArray[index]), Double.parseDouble(fundFeArray[index])));
            index++;
        }
        project.setFundDetails(fundDetails);
        project.setDeliverables(Arrays.asList(retrieveDeliverablesArray(request)));
        project.setObjectives(Arrays.asList(retrieveObjectivesArray(request)));
        project.setScopes(Arrays.asList(retrieveScopesArray(request)));
        project.setOtherLabs(Arrays.asList(otherLabs));
        String[] microArray = request.getParameter("microtable").split(",");
        String[] macroArray = request.getParameter("macrotable").split(",");
        index = 0;
        for (int i = 0; i < microArray.length/3; i++){
            project.getMicroDetails().add(new Contents(Integer.parseInt(microArray[index]), microArray[index+1], microArray[index+2]));
            index += 3;
        }
        index = 0;
        for (int i = 0; i < macroArray.length/3; i++){
            project.getMacroDetails().add(new Contents(Integer.parseInt(macroArray[index]), macroArray[index+1], macroArray[index+2]));
            index += 3;
        }
    }

    public String update(Project project, HttpServletRequest request) throws ParseException {
        Project foundProject = projectRepository.findByProjectNo(request.getParameter("old_project_no"));
        if (foundProject!=null){
            logger.info(request.getParameter("PDC"));
            foundProject.update(request);
            if (foundProject.getTemporary()=='y')setPDC(foundProject, true);
            else setPDC(foundProject, false);
            foundProject.setTemporary('n');
            projectRepository.save(foundProject);
            return "success";
        }
        else return "project does not exist";
    }

    public void setCommittee(Project project, HttpServletRequest request){
        String[] pmrc = request.getParameter("pmrc1").split(",");
        String[] eb = request.getParameter("eb1").split(",");
        int index = 0;
        for (int i = 0; i < pmrc.length/5; i++){
            project.getPmrc().add(new ComMember(pmrc[index], pmrc[index+1], pmrc[index+2], pmrc[index+3], pmrc[index+4]));
            index += 5;
        }
        index = 0;
        for (int i = 0; i < eb.length/5; i++){
            project.getEb().add(new ComMember(eb[index], eb[index+1], eb[index+2], eb[index+3], eb[index+4]));
            index += 5;
        }
        projectRepository.save(project);
    }

    public String uploadFile(MultipartFile multipartFile, HttpServletRequest request) {
        if (multipartFile.isEmpty())return "failure";
        try{
            byte[] bytes = multipartFile.getBytes();
            String UPLOADED_FOLDER="src/main/webapp/downloads/pdf/";
            Path path = Paths.get(UPLOADED_FOLDER + request.getParameter("name")+".pdf");
            Files.write(path, bytes);
            return "success";
        }
        catch (Exception e){
            return "Exception failure"+e+" ";
        }
    }

    public void addMeeting(Project project, String date, String type) throws ParseException{
        Date dates = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        if (type.equalsIgnoreCase("pmrc")){
            project.getPmrcMeetings().add(dates);
        }
        else project.getEbMeetings().add(dates);
        projectRepository.save(project);
    }

    public void downloadFile(HttpServletRequest request, HttpServletResponse response){
        String fileName = request.getParameter("name");
        String dataDirectory = request.getServletContext().getRealPath("src/main/webapp/downloads/pdf/");
        //File file = new File(dataDirectory + fileName+".pdf");
        File file = new File("src/main/webapp/downloads/pdf/"+fileName+".pdf");
        response.setContentType("application/pdf");
        response.addHeader("Content-Disposition", "inline; filename="+fileName);
        response.setContentLength((int)file.length());
        try
        {
            BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(file));
            BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());

            byte[] buffer = new byte[1024];
            int bytesRead = 0;
            while ((bytesRead = inStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }
            outStream.flush();
            inStream.close();
        }
        catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}