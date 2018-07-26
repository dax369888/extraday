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
			           //��ҳ����С��5����ôend��Ϊ��ҳ����ֵ�ˡ�
			              this.end = this.totalPage;
			         }else{
			               //��ҳ������5����ô��Ҫ���ݵ�ǰ�ǵڼ�ҳ�����ж�start��endΪ�����ˣ�
			              this.start = index - 2;
			              this.end = index + 2;
			              
			              if(start < 0){
			                //���統ǰҳ�ǵ�1ҳ�����ߵ�2ҳ����ô�Ͳ�����������
			                 this.start = 1;
			                 this.end = 5;
			            }
			             if(end > this.totalPage){
			                   //���統ǰҳ�ǵ�����2ҳ�������һҳ��Ҳͬ�������������������
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
