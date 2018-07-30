package com.ft.extraday.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.smartcardio.Card;

import com.ft.extraday.dao.CartDAO;
import com.ft.extraday.dao.SKUDAO;
import com.ft.extraday.dao.SKUValueDAO;
import com.ft.extraday.dao.SPUAttrSaleDAO;
import com.ft.extraday.dao.SPUDAO;
import com.ft.extraday.dao.SPUImgDAO;
import com.ft.extraday.entity.Cart;
import com.ft.extraday.entity.SKU;
import com.ft.extraday.entity.SKUAttr;
import com.ft.extraday.entity.SPUImg;
import com.ft.extraday.entity.Spu;
import com.ft.extraday.util.PageUtil;
import com.sun.xml.internal.ws.api.ha.StickyFeature;

public class GoodService {
	
	private SPUDAO spudao=new SPUDAO();	
	private SPUImgDAO spuImgDAO=new SPUImgDAO();
	private SPUAttrSaleDAO spuAttrSaleDAO=new SPUAttrSaleDAO();
	private SKUValueDAO skuValueDAO=new SKUValueDAO();
	private CartDAO cartDAO=new CartDAO();
	private SKUDAO skudao=new SKUDAO();
	
	public Map<String, Object> showSpu(){
		Map<String, Object> map=new HashMap<String, Object>();
		List<Spu> lists=spudao.queryList();
		System.out.println(lists);
		for (int i = 0; i < lists.size(); i++) {
			
			map.put(String.valueOf(i), lists.get(i));	
		}
		return map;	
	}

	public Spu getSpuById(Integer spu_id) {
		return spudao.selectById(spu_id);
	}

	public List<SPUImg> getImgById(Integer spu_id) {
		
		return spuImgDAO.selectImgById(spu_id);
	}

	public Map<String,List> getAttrById(Integer spu_id) {
		List<Map<String, Object>> list=spuAttrSaleDAO.getAttrById(spu_id);
		Map<String, List> map=new HashMap<String, List>();
		for (int i = 0; i < list.size(); i++) {
			
			String attr=(String)list.get(i).get("f_attr_name");
			Integer attr_id=(Integer)list.get(i).get("f_attr_id");
			
			map.put(attr, spuAttrSaleDAO.getValue(spu_id, attr_id));
		}
		return map;
		
	}

	public Integer addCart(Integer uid, Integer count,Integer sku_id) {
		
		Integer result=0;		
		List<Cart> listCart=cartDAO.query(sku_id, uid);
		if (listCart==null||listCart.size()==0) {
			result=cartDAO.insertCart(sku_id, uid, count);
		}else {
			result=cartDAO.updateCart(sku_id, uid, count);
		}
		System.out.println(result);
		return result;
		
	}

	public SKU getSku(Integer spu_id, Object[] skus) {
			SKU sku=null;
		List<SKUAttr> list=skuValueDAO.selectSku(spu_id, skus);
		if (list==null||list.size()==0) {
			return null;
		}else {
			Integer sku_id=list.get(0).getF_sku_id();
			sku=skudao.selectById(sku_id);
		}
		return sku;
	
	}

	public List<Map<String, Object>> getCartByUid(Integer uid) {
		
		List<Map<String, Object>> list=cartDAO.selectByUid(uid);
		return list;
		
	}

	/*public void balance(String[] skus,Integer uid) {
		for (int i = 0; i < skus.length; i++) {
			Integer sku_id=Integer.valueOf(skus[i]);
			cartDAO.updateF_status(uid, sku_id);
		}
		return;
		
	}	*/
	
	public List<Map<String, Object>> getPayList(Integer uid,String[] sku_ids){
		List<Map<String, Object>> lists=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < sku_ids.length; i++) {
			lists.add(cartDAO.selectBy(uid, Integer.valueOf(sku_ids[i])).get(0));
		}
		return lists;
		
	}

	public Integer getSpuIdBySku(Integer sku_id) {
		
		SKU sku	=skudao.selectById(sku_id);
		Integer spu_id=sku.getF_spu_id();
		return spu_id;
	}


	public Map<String, Object> getAttrById(Integer cid, String string, List<Object> list2) {
		
		List<Map<String, Object>> list=spuAttrSaleDAO.getAttrBy(cid);
		Map<String, Object> map=new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			Integer attrId=Integer.valueOf(list.get(i).get("f_attr_id").toString());
			/*
			List<Map<String, Object>> list2=spuAttrSaleDAO.getValueByCid(cid,attrId,string);*/
			map.put(list.get(i).get("f_attr_name").toString(), spuAttrSaleDAO.getValueByCid(cid,attrId,string,list2));
		}
		
		return map;
	}

	public PageUtil getSpuByString(String string, Integer index, Integer pageSize) {
		List<Map<String, Object>> list=spudao.getSpuByString(string,index,pageSize);
		
		Integer count=spudao.getSpuByStringCount(string);
		PageUtil pageUtil=new PageUtil(index, pageSize, count);
		pageUtil.list=list;
		return pageUtil;
		
	}
	public PageUtil getSpuByCid(Integer cid, Integer index,Integer pageSize) {
		List<Map<String, Object>> list=spudao.getSpuByCid(cid,index,pageSize);
		Integer count=spudao.getSpuByCidCount(cid);
		PageUtil pageUtil=new PageUtil(index, pageSize, count);
		pageUtil.list=list;
		return pageUtil;
		
	}

	public PageUtil getSpuBase(Integer cid, String str, Object[] valueID, Integer index, Integer pageSize) {
		List<Map<String, Object>> list=spudao.getSpuBase(cid,str);
		List<Object> lists=new ArrayList<Object>();
		for (int j = 0; j < list.size(); j++) {
			lists.add(list.get(j).get("f_id"));
		}
		List<Map<String, Object>> listDo=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < valueID.length; i++) {
			System.out.println(valueID[i]);
			listDo=spudao.getBase(lists,valueID[i]);
				lists.clear();
				for (int j = 0; j < listDo.size(); j++) {
					lists.add(listDo.get(j).get("f_id"));
					System.out.println(lists.get(j));
				}
				
		}
		
		
		
		Integer count=listDo.size();
		PageUtil pageUtil=new PageUtil(index, pageSize, count);
		pageUtil.list=listDo;
		return pageUtil;
		
		
	}
	
	
	
}
