/*===============================================
	MemberInsertController.java
	- 사용자 정의 컨트롤러
	- 회원 데이터 추가 액션 처리 클래스
	- DAO 객체에 대한 의존성 주입을 위한 준비
	  → 인터페이스 형태의 속성 구성
	  → setter 구성
================================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class MemberInsertController implements Controller
{
	// 주요 속성 구성 → 인터페이스 형태
	private IMemberDAO dao;
	
	// setter 구성
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// Controller 가 수행해야 할 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 이전 페이지로부터 넘어온 데이터 수신
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String tel = request.getParameter("telephone");
		
		try
		{
			MemberDTO member = new MemberDTO();
			
			member.setName(name);
			member.setTelephone(tel);
			
			dao.add(member);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// check~!!!
		//mav.setViewName("/WEB-INF/view/MemberList.jsp");				//--(Ⅹ)
		
		//		: 이대로 넘기면 MemberList.jsp에서 필요로 하는 count와 memberlist가 없다..
		//		-> 그러므로 그 처리를 하는 MemberListController.java로 갈 수 있도록..
		
		// 사용자에게 memberlist.do 를 다시 요청할 수 있도록 안내~!!!
		// → sendRedirect() → memberlist.do
		//		: 스프링컨테이너에게 이걸 리다이렉트한거라는 걸 알려주기 위해 "redirect:" 앞에 추가
		mav.setViewName("redirect:memberlist.do");
		
		
		
		return mav;
				
	}
	
}
