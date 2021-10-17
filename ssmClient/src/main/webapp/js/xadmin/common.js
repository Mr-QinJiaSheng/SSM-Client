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

//全部生产
function qbsc(){
	if(confirm('确定   全部生产 吗?'))
	{ 
	return true;
	} 
	return false; 
	}
//撤回
function cancel(){
	if(confirm('确定 要撤销 吗?'))
	{ 
	return true;
	} 
	return false; 
	}
//下载
function down(){
	if(confirm('确定 要下载 吗?'))
	{ 
	return true;
	} 
	return false; 
	}