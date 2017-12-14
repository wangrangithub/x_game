/**
 * 
 * @param newPageIndex
 * @param formid
 */
function pageIndexChanging(newPageIndex, formid){
	$("#pageIndex").val(newPageIndex);
	$("#"+formid).submit();
}