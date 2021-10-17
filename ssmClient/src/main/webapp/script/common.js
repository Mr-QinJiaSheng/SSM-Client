/*操作提示js*/

function reload(){
	window.location.reload();
}
function help(msg){
	alert('欢迎使用'+msg);
}

function to(url){
	window.location.href=url;
}
function back(){
	history.go(-1);
}
function save(url){
	alert('保存成功！');
	to(url);
}
function add(url){
	alert('新建成功！');
	to(url);
}
function del(msg){
	if (window.confirm("确认删除"+msg+"？")){
		reload();
	}
}
function setCurTime(oid){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var day=now.getDate();
	var hours=now.getHours();
	var minutes=now.getMinutes();
	var seconds=now.getSeconds();
	var timeString = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
	var oCtl = document.getElementById(oid);
	oCtl.value = timeString;
}

function del(){ 
	if(confirm('确定删除所选数据吗?'))
	{ 
	return true;
	} 
	return false; 
	}
//财务确认
function receive(){ 
	if(confirm('确定  审核  吗??'))
	{ 
	return true;
	} 
	return false; 
	}
//财务确认
function  tuihui(){ 
	if(confirm('确定 退回 吗??'))
	{ 
	return true;
	} 
	return false; 
	}
//取消采购
function  caigou(){ 
	if(confirm('确定   取消采购   吗??'))
	{ 
	return true;
	} 
	return false; 
	}
//出库
function chuku(){ 
	if(confirm('确定   出库  吗??'))
	{ 
	return true;
	} 
	return false; 
	}
//收货
function shouhuo(){ 
	if(confirm('确定   收货  吗??'))
	{ 
	return true;
	} 
	return false; 
	}
//生成订单
function scdd(){
	if(confirm('确定  生成订单  对吗?'))
	{ 
	return true;
	} 
	return false; 
	}
//清空购物车
function dels(){
	if(confirm('确定要  清空购物  车吗?'))
	{ 
	return true;
	} 
	return false; 
	}
//提交财务
function caiwu(){
	if(confirm('确定  提交财务  吗?'))
	{ 
	return true;
	} 
	return false; 
	}

//全部生产
function qbsc(){
	if(confirm('确定   全部生产 吗?'))
	{ 
	return true;
	} 
	return false; 
	}
