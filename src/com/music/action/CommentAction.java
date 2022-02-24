package com.music.action;

import com.music.entity.Comment;
import com.music.service.CommentService;
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
public class CommentAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private Comment comment;

    private String json = "";

    @Resource
    private CommentService commentService;

    // public List<Comment> getCommentList() {
    public String getAll() {
        return "thingshow";
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    public String add() {
        // commentService.add(comment);
		/*System.out.println("添加评论成功。");
		return GetAll();*/

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

		/*if (request.getSession().getAttribute("user") == null) {
			json = Util.SetMap("您尚未登录", false, response);
			return null;
		}*/

        // Thing thi = (Thing) request.getSession().getAttribute("thing");

        // request.getSession();

        // User u = (User) request.getSession().getAttribute("user");
        // comment.setThingId(thi.getId());

        Comment comm = comment;
        commentService.add(comm);
        json = Util.setMap("评论成功", true, response);
        return Action.SUCCESS;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }
}
