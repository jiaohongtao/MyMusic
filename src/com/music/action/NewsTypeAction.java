package com.music.action;

import com.music.entity.NewsType;
import com.music.service.NewsTypeService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Scope("prototype")
public class NewsTypeAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private NewsType newstype;

    public NewsType getNewstype() {
        return newstype;
    }

    public void setNewstype(NewsType newstype) {
        this.newstype = newstype;
    }

    @Resource
    private NewsTypeService newstypeService;

    //跳转添加，修改页面
    public String addPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (newstype == null || newstype.getId() == 0) {
            request.setAttribute("newstype", new NewsType());
        } else {
            request.setAttribute("newstype", newstypeService.getById(newstype.getId()));
        }
        return "addnewstype";
    }

    //添加/修改
    public String addForm() {
        if (newstype.getId() == 0) {
            this.newstypeService.add(newstype);
        } else {
            this.newstypeService.edit(newstype);
        }
        //ActionContext.getContext().put("addUserMess", "添加用户成功！");
        return get();
    }

    //删除
    public String del() {
        this.newstypeService.del(newstype);
        return get();
    }

    //查询所有
    public String get() {
        HttpServletRequest request = ServletActionContext.getRequest();
        List<NewsType> tts = this.newstypeService.get(0, 20, "");
        request.setAttribute("list", tts);
        return "newstypelist";
    }
}
