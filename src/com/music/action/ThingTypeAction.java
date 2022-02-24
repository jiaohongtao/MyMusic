package com.music.action;

import com.music.entity.ThingType;
import com.music.service.ThingTypeService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Scope("prototype")
public class ThingTypeAction extends ActionSupport {

    private static final long serialVersionUID = 1L;


    private ThingType thingtype;

    public ThingType getThingtype() {
        return thingtype;
    }

    public void setThingtype(ThingType thingtype) {
        this.thingtype = thingtype;
    }

    @Resource
    private ThingTypeService thingtypeService;

    //跳转添加，修改页面
    public String addPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (thingtype == null || thingtype.getId() == 0) {
            request.setAttribute("thingtype", new ThingType());
        } else {
            request.setAttribute("thingtype", thingtypeService.getById(thingtype.getId()));
        }
        return "addthingtype";
    }

    //添加/修改
    public String addForm() {
        if (thingtype.getId() == 0) {
            this.thingtypeService.add(thingtype);
        } else {
            this.thingtypeService.edit(thingtype);
        }
        //ActionContext.getContext().put("addUserMess", "添加用户成功！");
        return get();
    }


    //删除
    public String del() {
        this.thingtypeService.del(thingtype);
        return get();
    }

    //查询所有
    public String get() {
        HttpServletRequest request = ServletActionContext.getRequest();
        List<ThingType> tts = this.thingtypeService.get(0, 20, "");
        request.setAttribute("list", tts);
        return "thingtypelist";
    }
}
