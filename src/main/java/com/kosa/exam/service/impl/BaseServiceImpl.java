package com.kosa.exam.service.impl;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.exam.service.GlobalProperty;
import com.kosa.exam.service.dao.GeneralDAOImpl;


/**
 * 부모 serviceImpl 클래스
 * @author kky
 *
 */
@Service
public abstract class BaseServiceImpl {
	
	@Resource
	private GeneralDAOImpl _gDao;
	
	@Autowired
	private GlobalProperty _globalProperty;
	
	
	protected GeneralDAOImpl getDAO() {
		return this._gDao;
	}
	
	protected GlobalProperty getConfig() {
		return this._globalProperty;
	}
}
