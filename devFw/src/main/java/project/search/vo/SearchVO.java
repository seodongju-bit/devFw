package project.search.vo;

import project.search.paging.SearchPagingVO;

public class SearchVO extends SearchPagingVO{
	
	private String searchType="";
	private String searchWord = "";
	
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	@Override
	public String toString() {
		return super.toString() + " SearchVO [ searchType=" + searchType + ", searchWord=" + searchWord + "]";
	}
	

}
