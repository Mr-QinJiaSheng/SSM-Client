package com.entity;

public class YhEmployee {
    private Integer id;

    private String empname;

    private String password;

    private Integer roleid;

    private String tel;
    
    private YhRole yhrole;
    
    private YhRoot yhroot;
    
    private YhRoleroot yhroleroot;
    
    public YhRoleroot getYhroleroot() {
		return yhroleroot;
	}

	public void setYhroleroot(YhRoleroot yhroleroot) {
		this.yhroleroot = yhroleroot;
	}

	public YhRoot getYhroot() {
		return yhroot;
	}

	public void setYhroot(YhRoot yhroot) {
		this.yhroot = yhroot;
	}

	public YhRole getYhrole() {
		return yhrole;
	}

	public void setYhrole(YhRole yhrole) {
		this.yhrole = yhrole;
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}