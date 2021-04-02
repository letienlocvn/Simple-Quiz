/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loclt.filter;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

/**
 * Web application lifecycle listener.
 *
 * @author WIN
 */
public class ContextListenerServlet implements ServletContextListener {
    static final Logger LOGGER = Logger.getLogger(ContextListenerServlet.class.getName());
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Map<String, String> file = new HashMap<>();
        ServletContext sc = sce.getServletContext();
        sc.getRealPath("/");
        String fileInWeb = "/WEB-INF/process.txt";
        String path = sc.getRealPath(fileInWeb);
        try {
            FileReader read = new FileReader(path);
            BufferedReader bf = new BufferedReader(read);
            String line;
            StringTokenizer stk;
            while ((line = bf.readLine()) != null) {
                stk = new StringTokenizer(line, "=");
                String key = stk.nextToken().trim();
                String value = stk.nextToken().trim();
                file.put(key, value);
            }
            sce.getServletContext().setAttribute("FILE", file);
            bf.close();
            read.close();
        } catch (IOException e) {
            BasicConfigurator.configure();
            LOGGER.error("ERROR at ContextListenerServlet: " + e.getMessage());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
