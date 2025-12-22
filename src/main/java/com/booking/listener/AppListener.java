package com.booking.listener;

import com.booking.service.BookingManager;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener   
public class AppListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        BookingManager bm = new BookingManager();
        sce.getServletContext().setAttribute("bm", bm);

        System.out.println("BookingManager initialized");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("App stopped");
    }
}
