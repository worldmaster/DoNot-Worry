package com.kh.common.model.vo;

public class pageBar {

	int listCount; // 현재 총 게시글 개수
	int currentPage; // 현재 페이지(즉 사용자가 요청한 페이지)
	int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 개수(10개씩 보일 예정)
	int contactLimit; // 한 페이지에 보여질 게시글의 최대 개수(10개씩 보일 예정)
	
	int maxPage; // 가장 마지막 페이지가 몇 번째 페이지인지(총 페이지 개수)
	int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
	int endPage; // 페이지 하단에 보여징 페이징바의 끝 수
	
	public pageBar() {
		
	}

	public pageBar(int listCount, int currentPage, int pageLimit, int contactLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.contactLimit = contactLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getContactLimit() {
		return contactLimit;
	}

	public void setContactLimit(int contactLimit) {
		this.contactLimit = contactLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "pageBar [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", contactLimit=" + contactLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
}
