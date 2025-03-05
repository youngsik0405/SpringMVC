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

import com.test.mybatis.IStudentDAO;
import com.test.mybatis.StudentDTO;

// 컨트롤러 등록
@Controller
public class StudentController
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
   
   @RequestMapping(value = "/studentlist.action", method = RequestMethod.GET)
   public String studentList(Model model)   //스프링컨테이너가 이 메소드를 호출하는 주체. 매개변수 model을 넘겨주는 것도 스프링컨테이너.
   {
      String result = null;
      
      IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);   //IStudentDAO 타입의 클래스를 받아서 dao로 넘기겠다.
      
      //dao.add(s)
      //dao.count()
      //dao.list()
      
      model.addAttribute("list", dao.list());
      model.addAttribute("count", dao.count());
      
      result = "/WEB-INF/view/StudentList.jsp";
      
      return result;
   }
   
   @RequestMapping(value = "/studentinsertform.action", method = RequestMethod.GET)
   public String studentInsertForm()
   {
	   String result = null;
	   
	   result = "/WEB-INF/view/StudentInsertForm.jsp";
	   
	   return result;
   }
   
   
   @RequestMapping(value = "/studentinsert.action", method = RequestMethod.POST)
   public String studentInsert(StudentDTO student)
   {
	   String result = null;
	   
	   IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
	   
	   dao.add(student);
	   
	   result = "redirect:studentlist.action";
	   
	   return result;
   }
   
   @RequestMapping(value = "/studentupdateform.action", method = RequestMethod.GET)
   public String studentUpdateForm(String sid, Model model)
   {
	   String result = null;
	   
	   IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
	   
	   StudentDTO student = dao.search(sid);
	   
	   model.addAttribute("student", student);
	   
	   result = "/WEB-INF/view/StudentUpdateForm.jsp";
	   
	   return result;
   }
   
   @RequestMapping(value = "/studentupdate.action", method = RequestMethod.POST)
   public String studentUpdate(StudentDTO s)
   {
	   String result = null;
	   
	   IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
	   
	   dao.update(s);
	   
	   result = "redirect:studentlist.action";
	   
	   return result;
   }
   
   @RequestMapping(value = "/studentdelete.action", method = RequestMethod.GET)
   public String studentDelete(String sid)
   {
	   String result = null;
	   
	   IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
	   
	   dao.delete(sid);
	   
	   result = "redirect:studentlist.action";
	   
	   return result;
   }
   
   
   
}
