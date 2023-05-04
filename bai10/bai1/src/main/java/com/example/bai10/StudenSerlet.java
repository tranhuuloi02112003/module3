package com.example.bai10;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlett",urlPatterns = "/student")
public class StudenSerlet extends HttpServlet {
    private static List<Student> studentList;
    static {
        studentList= new ArrayList<>();
        studentList.add(new Student("Tran Huu Loi","2/11/2003","Quang Nam","anh1.jpg"));
        studentList.add(new Student("Ha Nhi","2/11/2003","Quang Nam","anh2.jpg"));
        studentList.add(new Student("Hoai Nam","2/11/2003","Quang Ngai","anh3.jpg"));
        studentList.add(new Student("Anh Tuan","2/11/2003","Quang Binh","anh4.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Đặt giá trị cho 1 phần tử
        req.setAttribute("students",studentList);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
