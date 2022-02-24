package com.music.action;

import com.music.entity.Introduce;
import com.music.service.IntroduceService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Scope("prototype")
public class IntroduceAction extends ActionSupport {

    private static final long serialVersionUID = 1L;


    private Introduce introduce;


    public Introduce getIntroduce() {
        return introduce;
    }

    public void setIntroduce(Introduce introduce) {
        this.introduce = introduce;
    }

    @Resource
    private IntroduceService introduceService;

    //跳转添加，修改页面
    public String addPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (introduce == null || introduce.getId() == 0) {
            request.setAttribute("introduce", new Introduce());
        } else {
            request.setAttribute("introduce", introduceService.getById(introduce.getId()));
        }
        return "addintroduce";
    }

    //添加/修改
    public String addForm() {
        if (introduce.getId() == 0) {
            this.introduceService.add(introduce);
        } else {
            this.introduceService.edit(introduce);
        }
        //ActionContext.getContext().put("addUserMess", "添加用户成功！");
        return get();
    }


    //删除
    public String del() {
        this.introduceService.del(introduce);
        return get();
    }

    //查询所有
    public String get() {
        HttpServletRequest request = ServletActionContext.getRequest();
        List<Introduce> tts = this.introduceService.get();
        request.setAttribute("list", tts);
        return "introducelist";
    }

    //查询所有
    public String show() {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("introduce", introduceService.getById(introduce.getId()));
        return "introduceshow";
    }
}
