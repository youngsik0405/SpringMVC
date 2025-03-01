/*======================================
	#27. EmployeeDeleteController.java
	- 사용자 정의 컨트롤러
	- 직원 데이터 삭제 액션 처리
	  → DAO 의 remove() 메소드 호출
	     → DAO 객체에 대한 의존성 주입(DI)을 위한 준비
	        → 인터페이스 형태의 자료형 속성 구성
	        → setter 구성
	- 처리 후 employeelist.action 을 다시 요청할 수 있도록 안내
	  → redirect.employeelist.action
=======================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.
public class EmployeeDeleteController implements Controller
{
	// 주요 속성 구성
	private IEmployeeDAO dao;
	
	// setter 구성
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}
	
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// Controller 가 수행해야 할 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		// 이전 페이지(→ EmloyeeList.jsp)부터 넘어온 데이터 수신
		//-- employeeId
		String employeeId = request.getParameter("employeeId");
		
		try
		{
			dao.remove(employeeId);
			
			mav.setViewName("redirect:employeelist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

	
}












