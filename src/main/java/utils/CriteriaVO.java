package utils;

public class CriteriaVO {
	private int page; // 現在のページの番号
	private int perPageNum; // ページ当り見える文数
	private int pageStart;
	
	public int getPageStart() {
		return (this.page-1) * perPageNum;
	}

	public CriteriaVO(){
		this.page = 1;
		this.perPageNum = 10;
	}
	public int getPage(){
		return page;
	}
	public void setPage(int page) {
		if(page <= 0){
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	public int getPerPageNum(){
		return perPageNum;
	}
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
}
