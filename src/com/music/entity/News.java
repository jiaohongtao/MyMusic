package com.music.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_news")
public class News {

    private Integer id = 0;
    private String title;
    private String content;
    private Date inTime;
    private NewsType newstype;
    private int newstypeId;

    @Id
    @GenericGenerator(name = "generator", strategy = "native")
    @GeneratedValue(generator = "generator")

    @Column(name = "id", length = 11)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "title", length = 50)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "content", columnDefinition = "text")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    @Column(name = "in_time")
    public Date getIntime() {
        return inTime;
    }

    public void setIntime(Date inTime) {
        this.inTime = inTime;
    }

    @ManyToOne
    @JoinColumn(name = "newstype_ID", referencedColumnName = "id", insertable = false, updatable = false)
    public NewsType getNewstype() {
        return newstype;
    }

    public void setNewstype(NewsType newstype) {
        this.newstype = newstype;
    }

    @Column(name = "newstype_ID", length = 11)
    public int getNewstypeId() {
        return newstypeId;
    }

    public void setNewstypeId(int newstypeId) {
        this.newstypeId = newstypeId;
    }


}
