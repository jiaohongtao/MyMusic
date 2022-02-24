package com.music.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_thing")
public class Thing {

	private Integer id = 0;
	private String title;
	private String content;
	private Singer singer;
	private Integer singerId;
	private String img;
	private ThingType thingtype;
	private int thingtypeId;

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

	@ManyToOne
	@JoinColumn(name = "Singer_ID", referencedColumnName = "id", insertable = false, updatable = false)
	public Singer getSinger() {
		return singer;
	}

	public void setSinger(Singer singer) {
		this.singer = singer;
	}

	@Column(name = "Singer_ID")
	public Integer getSingerId() {
		return singerId;
	}

	public void setSingerId(Integer singerId) {
		this.singerId = singerId;
	}


	@Column(name = "img", length = 500)
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@ManyToOne
	@JoinColumn(name = "thingtype_ID", referencedColumnName = "id", insertable = false, updatable = false)
	public ThingType getThingtype() {
		return thingtype;
	}

	public void setThingtype(ThingType thingtype) {
		this.thingtype = thingtype;
	}

	@Column(name = "thingtype_ID", length = 11)
	public int getThingtypeId() {
		return thingtypeId;
	}

	public void setThingtypeId(int thingtypeId) {
		this.thingtypeId = thingtypeId;
	}


}
