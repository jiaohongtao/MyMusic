package com.music.action;

import com.music.entity.Singer;
import com.music.service.SingerService;
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
public class SingerAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private Singer singer;

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    @Resource
    private SingerService singerService;

    // 跳转添加，修改页面
    public String addPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (singer == null || singer.getId() == 0) {
            request.setAttribute("singer", new Singer());
        } else {
            request.setAttribute("singer", singerService
                    .getById(singer.getId()));
        }
        return "addsinger";
    }

    // 添加/修改
    public String addForm() {
        if (singer.getId() == 0) {
            this.singerService.add(singer);
        } else {
            this.singerService.edit(singer);
        }
        return get();
    }

    // 删除
    public String del() {
        this.singerService.del(singer);
        return get();
    }

    // 查询所有
    public String get() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Pages p = new Pages(request);
        request.setAttribute("list", singerService.get(p));
        // String url = request.getRequestURI();
        request.setAttribute("pages", PageList.page(request, p.getBase(),
                singerService.getCount(p).intValue(), p.getPageSize(), p
                        .getStartIndex(), request.getQueryString()));
        return "singerlist";
    }

    // 查询所有
    public String show() {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("singer", singerService.getById(singer.getId()));
        return "singershow";
    }
}
