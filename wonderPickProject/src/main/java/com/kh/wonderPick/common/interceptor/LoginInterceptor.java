package com.kh.wonderPick.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginMember") != null) {
			return true;
		} else {
			session.setAttribute("alertMsg", "올바르지 않은 접근입니다!");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
}
