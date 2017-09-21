$(function(){
	//文本框只能输入数字
	$("input.num").live("keyup", function(){
		$(this).val($(this).val().replace(/[^\d]/g,''));
	});
	//文本框只能输入数字和小数点
	$("input.float").live("keyup", function(){
		$(this).val($(this).val().replace(/[^\d\.]/g,''));
	});
	
	//文本框只能输入数字和英文
	$("input.numAndEn").live("keyup", function(){
		$(this).val($(this).val().replace(/[^\w\.\/]/ig,''));
	});
});