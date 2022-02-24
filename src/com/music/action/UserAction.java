package com.music.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.PageList;
import com.music.util.Pages;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private User user;

    private String json;

    @Resource
    private UserService userService;


    //跳转添加，修改页面
    public String addPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (user == null || user.getId() == 0) {
            request.setAttribute("user", new User());
        } else {
            request.setAttribute("user", userService.getById(user.getId()));
        }
        return "adduser";
    }

    //添加/修改
    public String addForm() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        if (user.getId() == 0) {
            Pages p = new Pages(request);
            p.setKey("login=?");
            p.setParam(new Object[]{user.getLogin()});
            if (userService.get(p).size() > 0) {
                json = Util.setMap("该登录名已存在", false, response);
            } else {
                this.userService.add(user);
                json = Util.setMap("注册成功", true, response);
            }
        } else {
            User u = (User) request.getSession().getAttribute("user");
            user.setLogin(u.getLogin());
            user.setPwd(u.getPwd());
            this.userService.edit(user);
            json = Util.setMap("更新信息成功", true, response);
            request.getSession().removeAttribute("user");
            request.setAttribute("user", userService.getById(user.getId()));
        }
        return Action.SUCCESS;
    }

    //添加/修改
    public String pwd() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        //User u = (User)request.getSession().getAttribute("user");
        if (userService.editPwd(user.getId(), user.getPwd()) > 0) {
            json = Util.setMap("密码修改成功，下次请使用新密码登录", true, response);
            request.getSession().removeAttribute("user");
            request.setAttribute("user", userService.getById(user.getId()));
        } else {
            json = Util.setMap("密码修改失败", true, response);
        }
        return Action.SUCCESS;
    }


    //删除
    public String del() {
        this.userService.del(user);
        return get();
    }

    //查询所有
    public String get() {
        HttpServletRequest request = ServletActionContext.getRequest();

        Pages p = new Pages(request);
        request.setAttribute("list", userService.get(p));
        request.setAttribute("pages", PageList.page(request, p.getBase(), userService.getCount(p).intValue(),
                p.getPageSize(), p.getStartIndex(), request.getQueryString()));
        return "userlist";
    }

    //查询所有
    public String login() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        Pages p = new Pages(request);
        p.setKey("login=?");
        p.setParam(new Object[]{user.getLogin()});
        List<User> us = userService.get(p);
        if (us.size() == 0) {
            json = Util.setMap("该用户不存在", false, response);
        }
        if (!us.get(0).getPwd().equals(user.getPwd())) {
            json = Util.setMap("密码错误", false, response);
        } else {
            json = Util.setMap("验证成功", true, response);
            request.getSession().setAttribute("user", us.get(0));
        }
        return Action.SUCCESS;
    }

    //删除
    public String exit() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.getSession().removeAttribute("user");
        json = Util.setMap("已安全退出", true, response);
        return Action.SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
}
