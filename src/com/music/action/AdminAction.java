package com.music.action;

import com.music.entity.Admin;
import com.music.service.AdminService;
import com.music.util.Pages;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@Scope("prototype")
public class AdminAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private Admin admin;

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    private String json;

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    @Resource
    private AdminService adminService;

    //查询所有
    public String login() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        Pages pages = new Pages(request);
        pages.setKey("login=?");
        pages.setParam(new Object[]{admin.getLogin()});
        List<Admin> us = adminService.get(pages);
        if (us.size() == 0) {
            json = Util.setMap("该用户不存在", false, response);
        }
        if (!us.get(0).getPwd().equals(admin.getPwd())) {
            json = Util.setMap("密码错误", false, response);
        } else {
            json = Util.setMap("验证成功", true, response);
            request.getSession().setAttribute("admin", us.get(0));
        }
        return Action.SUCCESS;
    }

    //删除
    public String exit() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.getSession().removeAttribute("admin");
        json = Util.setMap("已安全退出", true, response);
        return Action.SUCCESS;
    }
}
