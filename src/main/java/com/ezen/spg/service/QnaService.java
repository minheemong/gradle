package com.ezen.spg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.spg.dao.IQnaDao;

@Service
public class QnaService {
	
	@Autowired
	IQnaDao qdao;

}
