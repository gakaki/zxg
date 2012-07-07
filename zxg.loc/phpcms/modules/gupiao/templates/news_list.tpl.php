<?php 
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header', 'admin');
?>
<div class="pad-lr-10">
<form name="myform" action="?m=gupiao&c=admin_news&a=listorder" method="post"> 
<div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
            <th width="35" align="center"><input type="checkbox" value="" id="check_box" onclick="selectall('id[]');"></th>
			<th align="center"><?php echo L('title')?></th>
			<th width="68" align="center"><?php echo L('created_at')?></th>
			<th width='68' align="center"><?php echo L('inputer')?></th>
			<th width="50" align="center"><?php echo L('hits')?></th>
			<th width="120" align="center"><?php echo L('inputtime')?></th>
			<th width="69" align="center"><?php echo L('operations_manage')?></th>
            </tr>
        </thead>
    <tbody>
 <?php 
if(is_array($data)){
	foreach($data as $news){
?>   
	<tr>
	<td align="center">
	<input type="checkbox" name="id[]" value="<?php echo $news['_id']?>">
	</td>
	<td><?php echo $news['title']?></td>
	
	<td align="center"><?php echo date('Y-m-d H:i:s', $news['created_at']->sec); ?></td>
	<td align="center"><?php echo $news['username']?></td>
	<td align="center"><?php echo $news['hits']?></td>
	<td align="center"><?php echo date('Y-m-d H:i:s', $news['addtime'])?></td>
	<td align="center">

	<div class='none'>
		<?php if ($_GET['s']==1) {?><a href="?m=gupiao&c=index&a=show&id=<?php echo $news['_id']?>" title="<?php echo L('preview')?>"  target="_blank"><?php }?><?php echo L('index')?><?php if ($_GET['s']==1) {?></a><?php }?> | 
	</div>

	<a href="javascript:edit('<?php echo $news['_id']?>', '<?php echo safe_replace($news['title'])?>');void(0);"><?php echo L('edit')?></a>
	</td>
	</tr>
<?php 
	}
}
?>
</tbody>
    </table>
  
    <div class="btn"><label for="check_box"><?php echo L('selected_all')?>/<?php echo L('cancel')?></label>
        <?php if($_GET['s']==1) {?><input name='submit' type='submit' class="button" value='<?php echo L('cancel_all_selected')?>' onClick="document.myform.action='?m=gupiao&c=admin_news&a=public_approval&passed=0'"><?php } elseif($_GET['s']==2) {?><input name='submit' type='submit' class="button" value='<?php echo L('pass_all_selected')?>' onClick="document.myform.action='?m=news&c=admin_news&a=public_approval&passed=1'"><?php }?>&nbsp;&nbsp;
		<input name="submit" type="submit" class="button" value="<?php echo L('remove_all_selected')?>" onClick="document.myform.action='?m=gupiao&c=admin_news&a=delete';return confirm('<?php echo L('affirm_delete')?>')">&nbsp;&nbsp;</div>  </div>
 <div id="pages"><?php echo $this->db->pages;?></div>
</form>
</div>
</body>
</html>
<script type="text/javascript">
function edit(id, title) {
	window.top.art.dialog({id:'edit'}).close();
	window.top.art.dialog({title:'<?php echo L('edit_news')?>--'+title, id:'edit', iframe:'?m=gupiao&c=admin_news&a=edit&id='+id ,width:'700px',height:'500px'}, function(){var d = window.top.art.dialog({id:'edit'}).data.iframe;
	var form = d.document.getElementById('dosubmit');form.click();return false;}, function(){window.top.art.dialog({id:'edit'}).close()});
}
</script>