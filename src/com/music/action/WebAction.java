package com.music.action;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.music.service.*;
import com.music.util.Pages;

@Controller
@Scope("prototype")
public class WebAction extends ActionSupport {

	private static final long serialVersionUID = 1L;


	@Resource
	private NewsService newsService;
	@Resource
	private NewsTypeService newstypeService;
	@Resource
	private ThingTypeService thingtypeService;
	@Resource
	private ThingService thingService;
	@Resource
	private SingerService singerService;
	@Resource
	private IntroduceService introduceService;

	//查询所有
	public String index() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Pages p = new Pages(request);

		request.getSession().setAttribute("menu", newstypeService.get(0, 100, ""));
		request.getSession().setAttribute("thingtypemenu", thingtypeService.get(0, 100, ""));

		p.setPageSize(8);
		request.setAttribute("singerlist", singerService.get(p));

		request.getSession().setAttribute("introducelist", introduceService.get());

		//右侧区域
		p.setPageSize(6);
		request.getSession().setAttribute("right1", newsService.get(p));
		//p.setOrder("newid()");
		request.getSession().setAttribute("right2", thingService.get(p));

		return "index";
	}

}
