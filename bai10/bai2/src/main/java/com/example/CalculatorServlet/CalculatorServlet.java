package com.example.CalculatorServlet;

import model.Calculator;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        float firstOperand=Integer.parseInt(request.getParameter("first_operand"));
        float secondOperand=Integer.parseInt(request.getParameter("second_operand"));
        char  calculation=request.getParameter("calculation").charAt(0);
            PrintWriter writer= response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Result:");
        try {
            float result= Calculator.calculator(firstOperand,secondOperand,calculation);
            writer.println(firstOperand+""+calculation+""+secondOperand+"="+result);
        }catch (Exception e){
            writer.println("Error");
        }
        writer.println("</html>");
    }

    public void destroy() {
    }
}