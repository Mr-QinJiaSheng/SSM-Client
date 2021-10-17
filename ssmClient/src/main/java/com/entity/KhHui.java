package com.entity;

public class KhHui {
    private Integer id;

    private Integer inid;

    private String scday;

    private String wenti;

    private String jieguo;

    private String jieday;

    private String jiename;

    private String yuday;
    
    private KhClientinfo khClientinfo;
    
    public KhClientinfo getKhClientinfo() {
		return khClientinfo;
	}

	public void setKhClientinfo(KhClientinfo khClientinfo) {
		this.khClientinfo = khClientinfo;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInid() {
        return inid;
    }

    public void setInid(Integer inid) {
        this.inid = inid;
    }

    public String getScday() {
        return scday;
    }

    public void setScday(String scday) {
        this.scday = scday;
    }

    public String getWenti() {
        return wenti;
    }

    public void setWenti(String wenti) {
        this.wenti = wenti;
    }

    public String getJieguo() {
        return jieguo;
    }

    public void setJieguo(String jieguo) {
        this.jieguo = jieguo;
    }

    public String getJieday() {
        return jieday;
    }

    public void setJieday(String jieday) {
        this.jieday = jieday;
    }

    public String getJiename() {
        return jiename;
    }

    public void setJiename(String jiename) {
        this.jiename = jiename;
    }

    public String getYuday() {
        return yuday;
    }

    public void setYuday(String yuday) {
        this.yuday = yuday;
    }
}