package com.music.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "t_ding")
public class Ding {

    private Integer id = 0;

    private Thing thing;
    private int thingId;
    private User user;
    private int userId;
    private int type;

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


    @ManyToOne
    @JoinColumn(name = "Thing_ID", referencedColumnName = "id", insertable = false, updatable = false)
    public Thing getThing() {
        return thing;
    }

    public void setThing(Thing thing) {
        this.thing = thing;
    }

    @Column(name = "Thing_ID", length = 11)
    public int getThingId() {
        return thingId;
    }

    public void setThingId(int thingId) {
        this.thingId = thingId;
    }

    @ManyToOne
    @JoinColumn(name = "User_ID", referencedColumnName = "id", insertable = false, updatable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "User_ID", length = 11)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    @Column(name = "type", length = 11)
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }


}
