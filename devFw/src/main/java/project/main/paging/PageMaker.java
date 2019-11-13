package project.main.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private PagingVO pagingVO;
	private int totalCount;		//총 게시글 수
	private int startPage;		//화면에 보여질 첫번째 페이지 번호, 시작 페이지 번호(1, 11, 21..)
	private int endPage;		//화면에 보여질 마지막 페이지 번호, 끝 페이지 번호(10, 20, 30..)
	private boolean prev;		//이전 페이지로 이동하는 링크 버튼의 존재 여부
	private boolean next;		//다음 페이지로 이동하는 링크 버튼의 존재 여부
	private int displayPageNum = 10;	//화면 하단에 보여지는 페이지 버튼의 수(1~10..)
	
	
	 public void setpagingVO(PagingVO pagingVO) {
		this.pagingVO = pagingVO;
	 }

	 public void setTotalCount(int totalCount) {
		 this.totalCount = totalCount;
		 calcData();
	 }

	 public int getTotalCount() {
		 return totalCount;
	 }

	 public int getStartPage() {
		 return startPage;
	 }

	 public int getEndPage() {
		 return endPage;
	 }

	 public boolean isPrev() {
		 return prev;
	 }

	 public boolean isNext() {
		 return next;
	 }

	 public int getDisplayPageNum() {
		 return displayPageNum;
	 }

	 public PagingVO getpagingVO() {
		 return pagingVO;
	 }
	 
	 private void calcData() {
		  endPage = (int) (Math.ceil(pagingVO.getPage() / (double)displayPageNum) * displayPageNum);
		  startPage = (endPage - displayPageNum) + 1;
	  
		  int tempEndPage = (int) (Math.ceil(totalCount / (double)pagingVO.getPerPageNum()));
	  
		  if (endPage > tempEndPage) {
			  	endPage = tempEndPage;
		  }
		  prev = startPage == 1 ? false : true;
		  next = endPage * pagingVO.getPerPageNum() >= totalCount ? false : true;
	 }

	 public String makeQuery(int page) {
		  UriComponents uriComponents = UriComponentsBuilder.newInstance()
		    .queryParam("page", page)
		    .queryParam("perPageNum", pagingVO.getPerPageNum())
		    .build();
		    
		  return uriComponents.toUriString();
	 }
}