<?php 
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header', 'admin');
?>
<div class="pad-10">
<form method="post" action="?m=gupiao&c=admin_news&a=add" name="myform" id="myform">
<table class="table_form" width="100%" cellspacing="0">
<tbody>
	<tr>
		<th width="80"><strong><?php echo '新闻标题' ?></strong></th>
		<td><input name="news[title]" id="title" class="input-text" type="text" size="50" ></td>
	</tr>
	
	<tr>
		<th><strong><?php echo '新闻内容' ?></strong></th>
		<td><textarea name="news[content]" id="content"></textarea><?php echo form::editor('content');?></td>
	</tr>

	<tr>
		<th><strong><?php echo L('news_status')?></strong></th>
		<td><input name="news[status]" type="radio" value="1" checked ></input>&nbsp;<?php echo L('pass')?>&nbsp;&nbsp;<input name="news[status]" type="radio" value="0" >&nbsp;<?php echo L('unpass')?></td>
	</tr>

	<tr>
  		<th><strong><?php echo '存在的模版' ?>：</strong></th>
        <td>
		<?php echo form::select($template_list, $info['default_style'], 'name="news[style]" id="style" onchange="load_file_list(this.value)"', L('please_select'))?> 
		</td>
	</tr>
	<tr>
		<th><strong><?php echo '模版选择' ?>：</strong></th>
		<td id="show_template"><script type="text/javascript">$.getJSON('?m=admin&c=category&a=public_tpl_file_list&style=<?php echo $info['default_style']?>&module=announce&templates=show&name=announce&pc_hash='+pc_hash, function(data){$('#show_template').html(data.show_template);});</script></td>
	</tr>

	</tbody>
</table>
<input type="submit" name="dosubmit" id="dosubmit" value=" <?php echo L('ok')?> " class="dialog">&nbsp;<input type="reset" class="dialog" value=" <?php echo L('clear')?> ">
</form>
</div>
</body>
</html>
<script type="text/javascript">
function load_file_list(id) {
	if (id=='') return false;
	$.getJSON('?m=admin&c=category&a=public_tpl_file_list&style='+id+'&module=announce&templates=show&name=announce&pc_hash='+pc_hash, function(data){$('#show_template').html(data.show_template);});
}

$(document).ready(function(){
	$.formValidator.initConfig({formid:"myform",autotip:true,onerror:function(msg,obj){window.top.art.dialog({content:msg,lock:true,width:'420',height:'170'}, function(){this.close();$(obj).focus();})}});
	$('#title').formValidator({onshow:"<?php echo L('input_news_title')?>",onfocus:"<?php echo L('title_min_3_chars')?>",oncorrect:"<?php echo L('right')?>"}).inputValidator({min:1,onerror:"<?php echo L('title_cannot_empty')?>"}).ajaxValidator({type:"get",url:"",data:"m=gupiao&c=admin_news&a=public_check_title",datatype:"html",cached:false,async:'true',success : function(data) {
       
        if( data == "1" )
		{
            return true;
		}
        else
		{
            return false;
		}
	},
	error: function(){alert("<?php echo L('server_no_data')?>");},
	onerror : "<?php echo L('news_exist')?>",
	onwait : "<?php echo L('checking')?>"
	});

	$("#content").formValidator({autotip:true,onshow:"",onfocus:"<?php echo L('news_content_cannot_be_empty')?>"}).functionValidator({
	    fun:function(val,elem){
	    //获取编辑器中的内容
		var oEditor = CKEDITOR.instances.content;
		var data = oEditor.getData();
        if(data==''){
		    return "<?php echo L('news_content_cannot_be_empty')?>"
	    } else {
			return true;
		}
	}
	});
	$('#style').formValidator({onshow:"<?php echo L('select_style')?>",onfocus:"<?php echo L('select_style')?>",oncorrect:"<?php echo L('right_all')?>"}).inputValidator({min:1,onerror:"<?php echo L('select_style')?>"});
});
</script>