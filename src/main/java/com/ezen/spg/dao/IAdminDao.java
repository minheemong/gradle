package com.ezen.spg.dao;
  
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.spg.dto.AdminVO;
import com.ezen.spg.dto.BookVO;
import com.ezen.spg.dto.MemberVO;
import com.ezen.spg.dto.Paging;
import com.ezen.spg.dto.QnaVO;

@Mapper
public interface IAdminDao {

	AdminVO workerCheck(String workId);

	int getAllCount(String key, String tablename, String fieldname);

	ArrayList<QnaVO> listQna(Paging paging, String key);

	ArrayList<MemberVO> listMember(Paging paging, String key);

}
