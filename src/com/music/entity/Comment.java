package com.music.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "t_comment")
public class Comment {

    private Integer id = 0;
    private String content;
    private int thingId;

    private Thing thing;

    @ManyToOne
    @JoinColumn(name = "thing_id", referencedColumnName = "id", insertable = false, updatable = false)
    public Thing getThing() {
        return thing;
    }

    public void setThing(Thing thing) {
        this.thing = thing;
    }

    @Id
    @GenericGenerator(name = "generator", strategy = "native")
    @GeneratedValue(generator = "generator")
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", length = 11)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "content", columnDefinition = "text")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "thing_id")
    public int getThingId() {
        return thingId;
    }

    public void setThingId(int thingId) {
        this.thingId = thingId;
    }

}
