package com.music.action;

import com.music.entity.News;
import com.music.service.NewsService;
import com.music.service.NewsTypeService;
import com.music.util.DateUtils;
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
public class NewsAction extends ActionSupport {

    private static final long serialVersionUID = 1L;


    private News news;

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    @Resource
    private NewsService newsService;
    @Resource
    private NewsTypeService newstypeService;

    //跳转添加，修改页面
    public String addPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (news == null || news.getId() == 0) {
            request.setAttribute("news", new News());
        } else {
            request.setAttribute("news", newsService.getById(news.getId()));
        }
        request.setAttribute("newstype", newstypeService.get(0, 20, ""));
        return "addnews";
    }

    //添加/修改
    public String addForm() {
        news.setIntime(DateUtils.getNow());
        if (news.getId() == 0) {
            this.newsService.add(news);
        } else {
            this.newsService.edit(news);
        }
        return get();
    }


    //删除
    public String del() {
        this.newsService.del(news);
        return get();
    }

    //查询所有
    public String get() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Pages p = new Pages(request);
        if (news != null && news.getNewstypeId() > 0) {
            p.setKey("newstypeId=?");
            p.setParam(new Object[]{news.getNewstypeId()});
        }
        request.setAttribute("list", newsService.get(p));
        // String url = request.getRequestURI();
        request.setAttribute("pages", PageList.page(request, p.getBase(), newsService.getCount(p).intValue(),
                p.getPageSize(), p.getStartIndex(), request.getQueryString()));
        return "newslist";
    }

    //查询所有
    public String show() {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("news", newsService.getById(news.getId()));
        return "newsshow";
    }
}
