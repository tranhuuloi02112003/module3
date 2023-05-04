package com.example.quan_ly_user.controller;

import com.example.quan_ly_user.model.User;
import com.example.quan_ly_user.repository.DBconnection;
import com.example.quan_ly_user.repository.IUserRepository;
import com.example.quan_ly_user.repository.UserRepositoryImpl;
import com.example.quan_ly_user.service.IUserService;
import com.example.quan_ly_user.service.UserServiceImple;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "UserSevlet", value = {"/user",""})
public class UserSevlet extends HttpServlet {
    IUserService service= new UserServiceImple();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            String action=request.getParameter("action");
            if (action==null){
                action="";
            }
            switch (action){
                case "create":
                    showNewForm(request,response);
                    break;
                case "remove":
                    removeUser(request,response);
                    break;
                case "edit":
                    ShowEditForm(request,response);
                    break;
                case "searchByCountry":
                    showSearchByCountry(request,response);
                    break;
                case "sortByName":
                    sortByName(request,response);
                    break;
                default:
                    showList(request,response);
            }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action=req.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                createUser(req,resp);
                break;
            case "edit":
                editUser(req,resp);
                break;
            case "searchByCountry":
                searchByCountry(req,resp);
                break;
            default:

        }

    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String q = request.getParameter("q");
        List<User> sortList=service.sortByName(q);
        request.setAttribute("userList",sortList);
        request.getRequestDispatcher("/user/list.jsp").forward(request,response);
    }

    private void showSearchByCountry(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/user/searchByCountry.jsp");
    }

    private void ShowEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id=Integer.parseInt(request.getParameter("id"));
        User user= service.getUserByIdProcedure(id);
        request.setAttribute("id",id);
        request.setAttribute("name",user.getName());
        request.setAttribute("email",user.getEmail());
        request.setAttribute("country",user.getCountry());
        request.getRequestDispatcher("/user/edit.jsp").forward(request,response);
    }

    private void removeUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        service.delectUserByIdProcedure(id);
        response.sendRedirect("/user");
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            request.setAttribute("userList",service.selectAllUserProcedure());
            request.getRequestDispatcher("/user/list.jsp").forward(request,response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/user/create.jsp");
    }

    private void searchByCountry(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String country=req.getParameter("country");
        List<User> userList=service.selectUserByCountry(country);
        req.setAttribute("userList",userList);
        req.setAttribute("search", country);
        req.getRequestDispatcher("/user/list.jsp").forward(req,resp);
    }

    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id= Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String country=req.getParameter("country");
        User user= new User(id,name,email,country);
        service.updateUserProcedure(user);
        resp.sendRedirect("/user");

    }

    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String country=req.getParameter("country");
        User user=new User(id,name,email,country);
        service.insertUserProcedure(user);
        resp.sendRedirect("/user");
    }
}