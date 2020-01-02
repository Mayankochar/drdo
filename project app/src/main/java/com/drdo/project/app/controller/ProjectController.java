package com.drdo.project.app.controller;

import com.drdo.project.app.entity.Project;
import com.drdo.project.app.service.ProjectService;
import com.drdo.project.app.utils.Form1PDF;
import com.drdo.project.app.utils.Form6PDF;
import com.drdo.project.app.utils.Form7PDF;
import com.itextpdf.text.DocumentException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

    private Logger logger = LoggerFactory.getLogger(ProjectController.class);

    @Autowired
    private ProjectService projectService;

    @GetMapping(value = "/")
    public String loadHome(){
        return "index";
    }

    @GetMapping(value = "/form1")
    public String loadForm1(Model model){
        model.addAttribute("project", new Project());
        model.addAttribute("objectives", new ArrayList<String>());
        model.addAttribute("scope", new ArrayList<String>());
        model.addAttribute("dynamicdeliverables", new ArrayList<String>());
        model.addAttribute("otherLabs", new ArrayList<String>());
        return "form1";
    }

    @PostMapping(value = "/add")
    public ModelAndView addProject(@ModelAttribute("project") Project project, ModelAndView modelAndView, HttpServletResponse response) {
        String message = projectService.add(project);
        modelAndView.addObject("message", message);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @PostMapping(value = "/getForm1PDF")
    public void getForm1PDF(@ModelAttribute Project project, HttpServletResponse response, HttpServletRequest request){
        projectService.retrieveObject(request, project);
        Form1PDF form1PDF = new Form1PDF();
        try {
            if(projectService.add(project).equals("success"))
                form1PDF.getPDF(project, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @GetMapping(value = "/getList")
    public String listProject(Model model){
        model.addAttribute("list", projectService.listProjects());
        return "list";
    }

    @PostMapping(value = "/getDetails")
    public String details(@RequestParam String projectNo, Model model){
        model.addAttribute("project", projectService.loadProject(projectNo));
        return "details";
    }

    @GetMapping(value = "/updateDetails")
    public String updateDetails(@RequestParam String projectNo, Model model){
        model.addAttribute("project", projectService.loadProject(projectNo));
        return "updateDetails";
    }

    @PostMapping(value = "/update")
    public ModelAndView update(@ModelAttribute Project project, ModelAndView modelAndView, HttpServletRequest request) throws ParseException{
        String message = projectService.update(project, request);
        modelAndView.addObject("message", message);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @GetMapping(value = "/form6")
    public String loadForm6(@RequestParam("projectNo") String projectNo, Model model){
        model.addAttribute("project", projectService.loadProject(projectNo));
        return "form6";
    }

    @PostMapping(value = "/getForm6PDF")
    public void getForm6PDF(HttpServletRequest request, HttpServletResponse response){
        Form6PDF form6PDF = new Form6PDF();
        try{
            form6PDF.getPDF(projectService.loadProject(request.getParameter("projectNo")), response, request);
        }catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @GetMapping(value = "/form7")
    public String loadForm7(@RequestParam("projectNo") String projectNo, Model model){
        model.addAttribute("project", projectService.loadProject(projectNo));
        return "form7";
    }

    @PostMapping(value = "/getForm7PDF")
    public void getForm7PDF(HttpServletRequest request, HttpServletResponse response){
        Form7PDF form7PDF = new Form7PDF();
        try{
            form7PDF.getPDF(projectService.loadProject(request.getParameter("projectNo")), response, request);
        }catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @GetMapping(value = "/committee")
    public ModelAndView committeeForm(@RequestParam("projectNo") String projectNo){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("project", projectService.loadProject(projectNo));
        modelAndView.setViewName("committee");
        return modelAndView;
    }

    @PostMapping(value = "/addCommittee")
    public String addCommittee(HttpServletRequest request){
        Project foundProject = projectService.loadProject(request.getParameter("projectNo"));
        projectService.setCommittee(foundProject, request);
        return "redirect:/";
    }

    @GetMapping(value = "/addMeeting")
    public ModelAndView upload(@RequestParam String projectNo){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("projectNo", projectNo);
        modelAndView.setViewName("addMeeting");
        return modelAndView;
    }

    @PostMapping(value = "/upload")
    public ModelAndView uploadFile(@RequestParam("file")MultipartFile multipartFile, HttpServletRequest request) throws ParseException {
        System.out.println("inside upload controller");
        ModelAndView modelAndView = new ModelAndView();
        projectService.addMeeting(projectService.loadProject(request.getParameter("projectNo")), request.getParameter("date"), request.getParameter("type"));
        String message = projectService.uploadFile(multipartFile, request);
        System.out.println(message);
        modelAndView.addObject("message", message);
        modelAndView.setViewName("redirect:getList");
        return modelAndView;
    }

    @GetMapping(value = "/download")
    public ModelAndView download(@RequestParam("projectNo") String projectNo){
        ModelAndView modelAndView = new ModelAndView();
        Project project = projectService.loadProject(projectNo);
        modelAndView.addObject("pmrc", project.getPmrcMeetings());
        modelAndView.addObject("eb", project.getEbMeetings());
        modelAndView.setViewName("meeting_list");
        return modelAndView;
    }

    @PostMapping(value = "/getMinutes")
    public void downloadMinutes(HttpServletRequest request, HttpServletResponse response){
        projectService.downloadFile(request, response);
    }
    @GetMapping(value="/error")
    public String errorPage()
    {
        return "error";
    }

}