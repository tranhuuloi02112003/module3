package com.example.bai1;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/login")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String product_Description = request.getParameter("productname");
        Double list_Price = Double.parseDouble(request.getParameter("listprice"));
        Double discount_Percent = Double.parseDouble(request.getParameter("discountpercent"));

        PrintWriter writer = response.getWriter();
        double discount_Amount = list_Price * discount_Percent * 0.01;
        double discount_price = list_Price - discount_Amount;
        writer.println("<html>");
        writer.println("<lable>Product Description:" + product_Description + "</lable>\n");
        writer.println("<p>List Price:" + list_Price + "</p>");
        writer.println("<p>Discount Percent:" + discount_Percent + "</p>");
        writer.println("<p>Discount Amount:" + discount_Amount + "</p>");
        writer.println("<p>Discount Price:" + discount_price + "</p>");
        writer.println("</html>");
    }

    public void destroy() {
    }
}