/*==============================================================
	#23. EmployeeInsertController.java
	- 사용자 정의 컨트롤러
	- 직원 데이터 입력 액션 수행
	  → DAO 필요
	- 이후 employeelist.action 을 다시 요청할 수 있도록 안내
	  → redirect
	- DAO 객체에 대한 의존성 주입(DI)을 위한 준비
	  → 인터페이스 형태의 자료형 속성 구성
	  → setter 구성
================================================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.
public class EmployeeInsertController implements Controller
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
		
		// 자격 검증 --------------------------------------------------------------------
		//-- 정상적인 로그인 과정을 거쳤는지의 여부 확인
		// 	 → 세션에 대한 확인으로 처리
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)		//-- 로그인이 되어 있지 않은 상황
		{
			// 로그인 폼 페이지로 안내
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)		//-- 로그인은 되어 있지만 관리자가 아닌 상황(일반 직원)
		{
			// 로그인은 되어 있지만 이 때 클라이언트는
			// 관리자가 아닌 일반 직원으로 로그인 되어 있는 상황이므로
			// 기존의 로그인 내용을 없애고 로그아웃 액션 처리하여
			// 다시 관리자로 로그인 할 수 있도록 안내
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		// -------------------------------------------------------------------- 자격 검증
		
		
		
		// 이전 페이지(→ EmployeeInsertForm.jsp)로 부터 넘어온 데이터 수신
		//-- name, ssn1, ssn2, birthday, lunar, telephone
		//	 regionId, departmentId, posisionId, basicPay, extraPay
		
		// request.setCharacterEncoding("UTF-8");
		//-- front controller 에 추가한 필터로 수행
		
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String birthday = request.getParameter("birthday");
		String lunar = request.getParameter("lunar");
		String telephone = request.getParameter("telephone");
		String regionId = request.getParameter("regionId");
		String departmentId = request.getParameter("departmentId");
		String positionId = request.getParameter("positionId");
		String basicPay = request.getParameter("basicPay");
		String extraPay = request.getParameter("extraPay");
		
		try
		{
			// Employee 객체 구성 → DAO 의 add() 메소드에 넘겨주어야 하므로...
			Employee employee = new Employee();
			
			employee.setName(name);
			employee.setSsn1(ssn1);
			employee.setSsn2(ssn2);
			employee.setBirthday(birthday);
			employee.setLunar(Integer.parseInt(lunar));
			employee.setTelephone(telephone);
			employee.setRegionId(regionId);
			employee.setDepartmentId(departmentId);
			employee.setPositionId(positionId);
			employee.setBasicPay(Integer.parseInt(basicPay));
			if (extraPay!=null)
			{
				employee.setExtraPay(Integer.parseInt(extraPay));
			}
			else
				employee.setExtraPay(0);
			
			// DB insert 액션 처리
			dao.add(employee);

			// 반환값에 따른 분기 처리 생략...
			
			//check~!!!
			//mav.setViewName("employeelist.action"); 
			mav.setViewName("redirect:employeelist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		return mav;
	}
	
}












