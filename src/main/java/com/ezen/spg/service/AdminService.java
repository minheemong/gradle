package com.ezen.spg.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.spg.dao.IAdminDao;
import com.ezen.spg.dto.AdminVO;
import com.ezen.spg.dto.BookVO;
import com.ezen.spg.dto.MemberVO;
import com.ezen.spg.dto.Paging;
import com.ezen.spg.dto.QnaVO;
  
@Service
public class AdminService {

	@Autowired
	IAdminDao adao;

	public AdminVO workerCheck(String workId) {
	
		return adao.workerCheck(workId);
	}

	public int getAllCount(String key, String tablename, String fieldname) {
		
		return adao.getAllCount(key,tablename,fieldname);
	}



	public ArrayList<MemberVO> listMember(Paging paging, String key) {
		return adao.listMember(paging,key);
	}

	public ArrayList<QnaVO>  listQna(Paging paging, String key, String order) {
	;
		return adao.listQna(paging,order,key);
	}


}
