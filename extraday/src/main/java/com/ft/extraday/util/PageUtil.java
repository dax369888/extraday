package com.ft.extraday.util;

import java.util.List;
import java.util.Map;


public class PageUtil {
	public Integer index;
	public Integer pageSize;
	public Integer totalCount;
	public Integer totalPage;
	public Integer start;
	public Integer end;
	public List<Map<String, Object>> list;
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	public List<Map<String, Object>> getList() {
		return list;
	}
	public void setList(List<Map<String, Object>> list) {
		this.list = list;
	}
	public PageUtil(Integer index, Integer pageSize, Integer totalCount, Integer totalPage, Integer start, Integer end,
			List<Map<String, Object>> list) {
		super();
		this.index = index;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.start = start;
		this.end = end;
		this.list = list;
	}
	public PageUtil() {
		super();
	}
	
	
	
	
	
	public PageUtil(Integer index, Integer pageSize, Integer totalCount) {
		super();
		this.index = index;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = (totalCount-1)/pageSize+1;
					this.start=1;
					this.end=5;
			         if(totalPage <=5){
			           //总页数都小于5，那么end就为总页数的值了。
			              this.end = this.totalPage;
			         }else{
			               //总页数大于5，那么就要根据当前是第几页，来判断start和end为多少了，
			              this.start = index - 2;
			              this.end = index + 2;
			              
			              if(start < 0){
			                //比如当前页是第1页，或者第2页，那么就不如和这个规则，
			                 this.start = 1;
			                 this.end = 5;
			            }
			             if(end > this.totalPage){
			                   //比如当前页是倒数第2页或者最后一页，也同样不符合上面这个规则
			                 this.end = totalPage;
			                 this.start = end - 5;
			             }
			         }
		
		
		
		
		
	}
	@Override
	public String toString() {
		return "PageUtil [index=" + index + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", start=" + start + ", end=" + end + ", list=" + list + "]";
	}
	
	
	
	
	
	
}
