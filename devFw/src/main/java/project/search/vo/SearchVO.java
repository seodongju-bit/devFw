package project.search.vo;

import project.search.paging.SearchPagingVO;

public class SearchVO extends SearchPagingVO{
	
	private String searchType="";
	private String searchWord = "";
	private String count_prod;
	
	
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
	
	public String getCount_prod() {
		return count_prod;
	}

	public void setCount_prod(String count_prod) {
		this.count_prod = count_prod;
	}

	@Override
	public String toString() {
		return super.toString() + " SearchVO [ searchType=" + searchType + ", searchWord=" + searchWord + "]";
	}
	

}
