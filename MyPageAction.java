package com.internousdev.gerbera.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.gerbera.dao.UserInfoDAO;
import com.internousdev.gerbera.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware{

	private String keywords;
	private Map<String, Object> session;

	public String execute(){

		if(!session.containsKey("mCategoryList")) {
			return "sessionTimeOut";
		}
		String result=ERROR;
		UserInfoDAO userInfoDAO=new UserInfoDAO();
		UserInfoDTO userInfoDTO=new UserInfoDTO();
		userInfoDTO=userInfoDAO.getUserInfo(String.valueOf(session.get("loginId")));
		if(userInfoDTO!=null){
			session.put("familyName", userInfoDTO.getFamilyName());
			session.put("firstName",userInfoDTO.getFirstName());
			session.put("familyNameKana",userInfoDTO.getFamilyNameKana());
			session.put("firstNameKana",userInfoDTO.getFirstNameKana());
			session.put("sex",userInfoDTO.getSex());
			session.put("email",userInfoDTO.getEmail());
			result=SUCCESS;
		}
		if(session.get("loginId")==null){
			result=ERROR;
		}
		return result;
	}

	public String getKeywords(){
		return keywords;
	}

	public void setKeywords(String keywords){
		this.keywords=keywords;
	}

	public Map<String,Object> getSession(){
		return session;
	}

	public void setSession(Map<String,Object> session){
		this.session=session;
	}
}
