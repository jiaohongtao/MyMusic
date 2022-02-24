package com.music.action;

import com.music.entity.Ding;
import com.music.entity.User;
import com.music.service.DingService;
import com.music.util.PageList;
import com.music.util.Pages;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@Scope("prototype")
public class DingAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private String json = "";

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    private Ding ding;

    public Ding getDing() {
        return ding;
    }

    public void setDing(Ding ding) {
        this.ding = ding;
    }

    /*
     * @Resource private ThingService thingService;
     *
     * @Resource private UserService userService;
     */
    @Resource
    private DingService dingService;

    // 添加/修改
    public String addOrUpdate() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        if (request.getSession().getAttribute("user") == null) {
            json = Util.setMap("您尚未登录", false, response);
            return null;
        }
        User u = (User) request.getSession().getAttribute("user");
        ding.setUserId(u.getId());
        dingService.add(ding);
        json = Util.setMap("读取成功", true, response);
        return Action.SUCCESS;
    }

    // 删除
    public String del() {
        HttpServletResponse response = ServletActionContext.getResponse();
        this.dingService.del(ding);
        json = Util.setMap("删除成功", true, response);
        return Action.SUCCESS;
    }

    // 查询所有
    public String get() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Pages p = new Pages(request);
        if (request.getSession().getAttribute("user") != null) {
            User u = (User) request.getSession().getAttribute("user");
            p.setKey("userId=? and type=?");
            p.setParam(new Object[]{u.getId(), ding.getType()});
        } else {
            p.setKey("type=?");
            p.setParam(new Object[]{ding.getType()});
        }
        request.setAttribute("list", dingService.get(p));
        // String url = request.getRequestURI();
        request.setAttribute("pages", PageList.page(request, p.getBase(),
                dingService.getCount(p).intValue(), p.getPageSize(),
                p.getStartIndex(), request.getQueryString()));
        return "dinglist";
    }
}
