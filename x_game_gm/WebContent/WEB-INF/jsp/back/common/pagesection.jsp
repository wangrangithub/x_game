<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="page">
            <div class="page_info fl">
                                          当前为第${pageModel.pageIndex }页，共${pageModel.pageCount }页(共${pageModel.totalCount }条记录)
            </div>
            <div class="pagenum fr">
                <span class="l_btn"> 
                    <input type="button" ${pageModel.pageIndex==1 ? 'disabled':'' } class="l_btn01${pageModel.pageIndex==1 ? ' disabled':'' }" onclick="pageIndexChanging(1, '${param.formid}');" />
                    <input type="button" ${pageModel.pageIndex==1 ? 'disabled':'' } class="l_btn02${pageModel.pageIndex==1 ? ' disabled':'' }" onclick="pageIndexChanging(${pageModel.pageIndex-1<1?1:(pageModel.pageIndex-1)}, '${param.formid}');" />
                </span>
                <span class="page_num">
                	当前第<input type="text"  id="pageIndex" name="pageIndex" value="${pageModel.pageIndex }" class="page_txt" />页&nbsp;&nbsp;共&nbsp;${pageModel.pageCount }&nbsp;页
                </span>
                <span class="r_btn">
                    <input type="button" class="r_btn01" onclick="pageIndexChanging(${(pageModel.pageIndex+1)>pageModel.pageCount ? (pageModel.pageCount):(pageModel.pageIndex+1)}, '${param.formid}');" />
                    <input type="button" class="r_btn02" ${pageModel.pageIndex==pageModel.pageCount ? 'disabled':'' } onclick="pageIndexChanging(${pageModel.pageCount}, '${param.formid}');" />
                </span>
            </div>
        </div>
        <!--page-->