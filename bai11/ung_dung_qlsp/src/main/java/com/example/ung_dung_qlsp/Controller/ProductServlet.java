package com.example.ung_dung_qlsp.Controller;

import com.example.ung_dung_qlsp.model.Product;
import com.example.ung_dung_qlsp.service.IProductService;
import com.example.ung_dung_qlsp.service.ProductServiceImpl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", urlPatterns = {"/product", ""})
public class ProductServlet extends HttpServlet {
    private IProductService service = new ProductServiceImpl();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreatePage(request, response);
                break;
            case "edit":
                showEditPage(request, response);
                break;
            case "remove":
                removeProduct(request, response);
//                showRemovePage(request, response);
                break;
            case "search":
                showSearchPage(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showSearchPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/product/list.jsp");
    }

    private void showRemovePage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/product/remove.jsp");
    }

    private void showEditPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id=request.getParameter("id");
        Product product = service.findById(id);
        request.setAttribute("id",id);
        request.setAttribute("name",product.getProductName());
        request.setAttribute("description",product.getProductDescription());
        request.setAttribute("frice",product.getProductPrice());
        request.setAttribute("producer",product.getProducer());
        request.getRequestDispatcher("/product/edit.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
            case "remove":
                removeProduct(req, resp);
                break;
            case "search":
                searchProduct(req, resp);
                break;
        }
    }

    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String searchById = req.getParameter("searchById");
        req.setAttribute("productById", service.findByIdOrName(searchById));
        req.getRequestDispatcher("/product/listSearch.jsp").forward(req, resp);
    }

    private void removeProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        service.remove(id);
        resp.sendRedirect("/product");
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("productList", service.findAll());
        request.getRequestDispatcher("/product/list.jsp").forward(request, response);
    }

    private void showCreatePage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/product/create.jsp");
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String id = req.getParameter("id");
        String productName = req.getParameter("name");
        String productDescription = req.getParameter("description");
        String producer = req.getParameter("producer");
        double productPrice = Double.parseDouble(req.getParameter("frice"));
        Product product = new Product(id, productName, productDescription, producer, productPrice);
        service.edit(product);
        resp.sendRedirect("/product");

    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String id = req.getParameter("id");
        String productName = req.getParameter("name");
        String productDescription = req.getParameter("description");
        String producer = req.getParameter("producer");
        double productPrice = Double.parseDouble(req.getParameter("frice"));
        Product product = new Product(id, productName, productDescription, producer, productPrice);
        service.save(product);
        resp.sendRedirect("/product");
//        req.getRequestDispatcher("product/create.jsp").forward(req, resp);
    }


}