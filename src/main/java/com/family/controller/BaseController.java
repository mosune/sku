package com.family.controller;

import com.alibaba.fastjson.JSONObject;
import com.family.exception.FamilyException;
import com.family.util.WebUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * FileName: BaseController
 *
 * @author gcg
 * @create 2018/01/04 9:28
 * Description: base controller
 * History:
 **/
@Controller
public class BaseController {

    @RequestMapping("index.do")
    public String index() {
        return "index";
    }

    /**
     * 针对无权限的操作
     * @param request
     * @param response
     * @throws IOException
     */
    @ExceptionHandler(FamilyException.class)
    public void exception(HttpServletRequest request, HttpServletResponse response, Exception e) throws IOException {
        if (WebUtil.isAjaxRequest(request)) {
            // 输出JSON
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("msg", e.getMessage());
            writeJson(map, response);
        } else {
            response.sendRedirect("/drp/404.jsp");
        }
    }

    private void writeJson(Map<String,Object> map, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            response.setStatus((Integer) map.get("status"));
            out = response.getWriter();
            out.write(new JSONObject(map).toString());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

}
