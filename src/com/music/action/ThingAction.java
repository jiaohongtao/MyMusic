package com.music.action;


import com.music.entity.Thing;
import com.music.service.SingerService;
import com.music.service.ThingService;
import com.music.service.ThingTypeService;
import com.music.util.PageList;
import com.music.util.Pages;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@Scope("prototype")
public class ThingAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private Thing thing;

    public Thing getThing() {
        return thing;
    }

    public void setThing(Thing thing) {
        this.thing = thing;
    }

    @Resource
    private ThingService thingService;
    @Resource
    private SingerService singerService;
    @Resource
    private ThingTypeService thingtypeService;
    HttpServletRequest request = ServletActionContext.getRequest();

    //跳转添加，修改页面
    public String addPage() {
        if (thing == null || thing.getId() == 0) {
            request.setAttribute("thing", new Thing());
        } else {
            request.setAttribute("thing", thingService.getById(thing.getId()));
        }
        request.setAttribute("thingtype", thingtypeService.get(0, 20, ""));
        request.setAttribute("singer", singerService.get(new Pages(request)));
        return "addthing";
    }

    //添加/修改
    public String addForm() {
        if (thing.getId() == 0) {
            this.thingService.add(thing);
        } else {
            this.thingService.edit(thing);
        }
        return get();
    }


    //删除
    public String del() {
        this.thingService.del(thing);
        return get();
    }

    //查询所有
    public String get() {
        Pages p = new Pages(request);
        request.setAttribute("thinglist", thingService.get(p));
        request.setAttribute("pages", PageList.page(request, p.getBase(), thingService.getCount(p).intValue(),
                p.getPageSize(), p.getStartIndex(), request.getQueryString()));
        return "thinglist";
    }

    public String getByTitle() {
        if (thing != null) {
            request.setAttribute("thing", thingService.getByTitle(thing.getTitle()));
            return show();
        }
        return null;
    }

    //查询所有
    public String show() {
        request.setAttribute("thing", thingService.getById(thing.getId()));
        return "thingshow";
    }
}
