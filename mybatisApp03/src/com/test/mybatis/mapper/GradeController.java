/*=============================
   StudentController.java
==============================*/

package com.test.mybatis.mapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mybatis.GradeDTO;
import com.test.mybatis.IGradeDAO;


// 컨트롤러 등록
@Controller
public class GradeController
{
   // SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
   @Autowired
   private SqlSession sqlSession;   //마이바티스 운용의 전반적인 역할을 다 하는 sqlSession 객체. -> 엄밀하게는 아니지만, 마이바티스 객체라고 불러도 무리없을 정도..
   
   // 매개변수를 등록하는 과정에서 매개변수 목록에 구성된
   // 클래스의 객체 정보는 스프링이(스프링 컨테이너가) 제공한다.
   
   // 사용자의 요청 주소와 메소드를 매핑하는 과정 필요
   // 『@RequestMapping(value = "요청주소", method = 전송및요청방식)』
   // 이 때, 전송 및 요청 방식은 submit 액션인 경우만 POST 로 설정하고
   // 나머지 모든 전송 방식은 GET 으로 처리한다. (method방식 생략하면 get)
   
   @RequestMapping(value = "/gradelist.action", method = RequestMethod.GET)
   public String gradeList(Model model)
   {
	   String result = null;
	   
	   IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
	   
	   model.addAttribute("list", dao.list());
	   
	   result = "/WEB-INF/view/GradeList.jsp";
	   
	   return result;
   }
   
   @RequestMapping(value = "/gradeinsertform.action", method = RequestMethod.GET)
   public String gradeInserForm(String sid, Model model)
   {
	   String result = null;
	   
	   model.addAttribute("sid", sid);
	   
	   result = "/WEB-INF/view/GradeInsertForm.jsp";
	   
	   return result;
   }
   
   @RequestMapping(value = "/gradeinsert.action", method = RequestMethod.POST)
   public String gradeInsert(GradeDTO grade)
   {
	   String result = null;
	   
	   IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
	   
	   dao.add(grade);
	   
	   result = "redirect:gradelist.action";
	   
	   return result;
   }
   
   @RequestMapping(value = "/gradeupdateform.action", method = RequestMethod.GET)
   public String gradeUpdateForm(String sid, Model model)
   {
	   String result = null;
	   
	   IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
	   
	   GradeDTO grade = dao.search(sid);
	   
	   model.addAttribute("grade", grade);
	   
	   result = "/WEB-INF/view/GradeUpdateForm.jsp";
	   
	   return result;
   }
   
   @RequestMapping(value = "/gradeupdate.action", method = RequestMethod.POST)
   public String gradeUpdate(GradeDTO grade)
   {
	   String result = null;
	   
	   IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
	   
	   dao.update(grade);
	   
	   result = "redirect:gradelist.action";
	   
	   return result;
   }
   
   @RequestMapping(value = "/gradedelete.action", method = RequestMethod.GET)
   public String gradeDelete(String sid)
   {
	   String result = null;
	   
	   IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
	   
	   dao.delete(sid);
	   
	   result = "redirect:gradelist.action";
	   
	   return result;
   }
  
   
   
   
}
