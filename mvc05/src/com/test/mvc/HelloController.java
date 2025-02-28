/*==========================================
	HelloController.java
	- 사용자 정의 컨트롤러
	- 『@Controller』 어노테이션 등록
	- 『@RequestMapping』 어노테이션 등록
===========================================*/

package com.test.mvc;

import org.springframework.stereotype.Controller;					//-- check~!!!
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;		//-- check~!!!

/*
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
*/

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.

//			↓

// ※ Annotation 표기법으로 만든 컨트롤러 객체 지정

@Controller
public class HelloController //implements Controller
{
	/*
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// Controller 가 수행해야 할 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	*/
	
	// ※ 액션 처리를 위한 메소드는 사용자 지정.
	//public 반환자료형 메소드명(매개변수 구성)
	/*
	@RequestMapping("URL매핑주소 구성")
	public String 메소드형(매개변수 구성)
	{
		// ※ 비스니스 로직 처리(모델 활용)
		// ...
		
		return "뷰 이름.jsp";
	}
	*/
	// 메소드를 정의하는 과정에서 매개변수에 필요로 하는 객체를 지정하면
	// 이를 스프링에 전달해 주게 된다.
	@RequestMapping("/hello.action")
	public String hello(Model model)
	{
		// ※ 비스니스 로직 처리(모델 활용)
		// ...
		
		// 데이터 전달
		model.addAttribute("hello", "Hello, SpringMVCAnnotation World~!");
		
		return "/WEB-INF/view/Hello.jsp";
	}
}

