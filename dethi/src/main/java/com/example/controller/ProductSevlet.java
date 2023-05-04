package com.example.controller;

import com.example.model.Product;
import com.example.service.IProductService;
import com.example.service.ProductServiceImpl;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductSevlet", value = {"/item", ""})
public class ProductSevlet extends HttpServlet {
    IProductService service = new ProductServiceImpl();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "remove":
                remove(request, response);
                break;
            case "edit":
                ShowEditForm(request, response);
                break;
//            case "sortByName":
//                sortByName(request,response);
//                break;
            default:
                showList(request, response);
        }
    }

    private void searchById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("search"));
        List<Product> products=new ArrayList<>();
        products.add(service.searchById(id));
        request.setAttribute("list", products);
        request.setAttribute("search", id);
        request.getRequestDispatcher("item/list.jsp").forward(request, response);
    }

    private void ShowEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = service.searchById(id);
        request.setAttribute("id", product.getIdPro());
        request.setAttribute("name", product.getNamePro());
        request.setAttribute("price", product.getPrice());
        request.setAttribute("color", product.getColor());
//        request.setAttribute("nameCategory",product.getNameCategory());
        request.getRequestDispatcher("/item/edit.jsp").forward(request, response);
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        service.remove(id);
        response.sendRedirect("/item");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("item/create.jsp");
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", service.findAll());
        request.getRequestDispatcher("item/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(req, resp);
                break;
            case "edit":
                edit(req, resp);
                break;
            case "search":
                searchById(req, resp);
                break;
            case "relativeSearch":
                relativeSearch(req,resp);
                break;
//            default:
        }
    }

    private void relativeSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String relativeSearch=req.getParameter("relativeSearch");
        req.setAttribute("list",service.relativeSearch(relativeSearch));
        req.getRequestDispatcher("item/list.jsp").forward(req,resp);
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String color = req.getParameter("color");
        String nameCategory = req.getParameter("nameCategory");
        service.edit(new Product(id, name, price, color, nameCategory));
        resp.sendRedirect("/item");
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        int id=Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String color = req.getParameter("color");
        String nameCategory = req.getParameter("nameCategory");
        service.insert(name, price, color, nameCategory);
        resp.sendRedirect("/item");
    }

}