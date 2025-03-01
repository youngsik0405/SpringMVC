/*============================
	#41. DepartmentUpdateController.java
	- 사용자 정의 컨트롤러
==============================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.
public class DepartmentUpdateController implements Controller
{
	// 주요 속성 구성
	private IDepartmentDAO dao;
	
	// setter 구성
	public void setDao(IDepartmentDAO dao)
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
		
		// 이전 페이지(→ DepartmentUpdateForm.jsp)로부터 넘어온 데이터
		//-- departmentId, departmentName
		String departmentId = request.getParameter("departmentId");
		String departmentName = request.getParameter("departmentName");
		
		ArrayList<Department> departmentList = new ArrayList<Department>();
		
		String error = "이미 존재하는 부서명입니다.";
		
		try
		{
			departmentList = dao.list();
			
			// 부서명 중복 시 안내
			for (Department dep : departmentList)
			{
				if (dep.getDepartmentName().equals(departmentName))
				{
					mav.addObject("departmentId", departmentId);
					mav.addObject("error", error);
					mav.setViewName("redirect:departmentupdateform.action");
					return mav;
				}
			}
			
			Department department = new Department();
			
			department.setDepartmentId(departmentId);
			department.setDepartmentName(departmentName);
			
			dao.modify(department);
			
			mav.setViewName("redirect:departmentlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}












