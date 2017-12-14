package com.game.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.formula.functions.T;

public class ListPage {

	private List<?> daList;

	public List<?> getDaList() {
		return daList;
	}

	public void setDaList(List<?> daList) {
		this.daList = daList;
	}

	/**
	 *
	 * @param pageNo
	 *            当前页码
	 * @param pageSize
	 *            页数
	 * @param list
	 *            所有集合
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("hiding")
	public static <T> PageUtil<T> getPage(PageUtil<T> pageModel, Integer pageIndex, Integer pageSize) {

		if (pageModel.getDateList() != null && pageModel.getDateList().size() > 0) {

			List<T> list = new ArrayList<T>();
			int intPage = (pageIndex == null || pageIndex == 0) ? 1 : pageIndex;
			int number = (pageSize == null || pageSize == 0) ? 20 : pageSize;
			int start = (intPage - 1) * number;
			int totalCount = pageModel.getDateList().size();
			int pageCount = totalCount % number == 0 ? totalCount / number : totalCount / number + 1;
			if ((pageIndex - 1) * pageSize >= totalCount) {
				pageIndex = 1 + (totalCount - 1) / pageSize;
			}
			if (intPage == pageCount) {
				list = pageModel.getDateList().subList(start, totalCount);

			} else {
				list = pageModel.getDateList().subList(start, start + number);
			}
			pageModel.setTotalCount(new Long(totalCount));
			pageModel.setDateList(list);
		}
		return pageModel;

	}
}
