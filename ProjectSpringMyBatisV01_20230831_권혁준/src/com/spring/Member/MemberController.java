package com.spring.Member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	MemberDTO dto = new MemberDTO();
	//MemberDAO dao = new MemberDAO();
	
	@RequestMapping(value = "/Index.do", method = RequestMethod.GET)
	public ModelAndView Index() {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "/Login.do", method = RequestMethod.GET)
	public ModelAndView Login() {
		return new ModelAndView("Login");
	}
	
	@RequestMapping(value = "/LoginProc.do", method = RequestMethod.POST)
	public ModelAndView LoginProc(HttpServletRequest req, @RequestParam Map<String, Object> map) throws IOException {
		String vId = map.get("id").toString();
		String vPwd = map.get("pwd").toString();
		
		dto.setId(vId);
		dto.setPwd(vPwd);
		
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
		
		int su = ssi.selectList("memLog", dto).size();
		
		String result;
		
		if (su != 0) {
			result = "OK";
		}
		else {
			result = "NO";
		}
		
		ModelAndView mav = new ModelAndView();
		
		req.setAttribute("vId", vId);
		req.setAttribute("result", result);
		
		mav.addObject("result", result);
		mav.addObject("su", su);
		mav.addObject("vId", vId);
		mav.setViewName("LoginProc");
		
		return mav;
	}

	@RequestMapping(value = "/Logout.do", method = RequestMethod.GET)
	public ModelAndView Logout() {
		return new ModelAndView("Logout");
	}
	
	@RequestMapping(value = "/Join.do", method = RequestMethod.GET)
	public ModelAndView Join() {
		return new ModelAndView("Join");
	}
	
	@RequestMapping(value = "/MemJoinProc.do", method = RequestMethod.POST)
	public void JoinProc(HttpServletRequest request) throws IOException {
		String vId = request.getParameter("id");
		String vPwd = request.getParameter("pwd");
		String vName = request.getParameter("name");
		String vDate = request.getParameter("date");
		String vHp = request.getParameter("hp");
		String vEmail = request.getParameter("email");
		String vAddr01 = request.getParameter("addr01");
		String vAddr02 = request.getParameter("addr02");
		dto = new MemberDTO(vId, vPwd, vName, vDate, vHp, vEmail, vAddr01, vAddr02);
		
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
	    
	    int su = ssi.insert("memIns", dto);
	    ssi.commit();
	}
	
	@RequestMapping(value = "/idChking.do", method = RequestMethod.GET)
	public void idChking(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String vId = request.getParameter("name");
		dto.setId(vId);
		
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
	    
		int flag = ssi.selectList("IdChking", dto).size();
		
		if (flag != 0) {
			out.print("FALSE");
		}
		else {
			out.print("TRUE");
		}
	}
	
	@RequestMapping(value = "/MyPage.do", method = RequestMethod.GET)
	public ModelAndView MyPage(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<MemberDTO> dtoL = new ArrayList<MemberDTO>();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("vId");
		
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
		
	    dto.setId(id);
		dtoL = (ArrayList)ssi.selectList("memSel", dto.getId());
		
		mav.addObject("dtoL", dtoL);
		mav.setViewName("MyPage");
		
		return mav;
	}
	
	@RequestMapping(value = "/MemUpd.do", method = RequestMethod.POST)
	public ModelAndView MemUpd(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		dto = new MemberDTO();
		ModelAndView mav = new ModelAndView();
		
		String vId = request.getParameter("id");
		String vPwd = request.getParameter("pwd");
		String vName = request.getParameter("name");
		String vDate = request.getParameter("date");
		String vHp = request.getParameter("hp");
		String vEmail = request.getParameter("email");
		String vAddr01 = request.getParameter("addr01");
		String vAddr02 = request.getParameter("addr02");
		
		dto = new MemberDTO(vId, vPwd, vName, vDate, vHp, vEmail, vAddr01, vAddr02);
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
		
		int su = ssi.update("memUpd", dto);
		String vMsg;
		
		if (su != 0) {
			vMsg = vName + "님. 회원정보 수정 완료";
			ssi.commit();
		}
		else {
			vMsg = vName + "님. 회원정보 수정 실패";
		}
		
		request.setAttribute("vMsg", vMsg);
		mav.addObject(vMsg);
		mav.setViewName("Alert_Center");
		
		return mav;
	}
	
	@RequestMapping(value = "/MemDel.do", method = RequestMethod.GET)
	public ModelAndView MemDel() {
		return new ModelAndView("Member_Delete");
	}
	
	@RequestMapping(value = "/MemDelProc.do", method = RequestMethod.POST)
	public ModelAndView MemDelProc(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = new ModelAndView();
		String vId = request.getParameter("id");
		String vPwd = request.getParameter("pwd");
		
		dto = new MemberDTO(vId, vPwd);
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
		
		int su = ssi.delete("memDel", dto);
		String vMsg;
		
		request.setAttribute("su", su);
		
		if (su != 0) {
			vMsg = "회원탈퇴 완료";
			ssi.commit();
			HttpSession session = request.getSession();
			session.invalidate();
		}
		else {
			vMsg = "회원탈퇴 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Alert_Center");
		
		return mav;
	}
	
	@RequestMapping(value = "/Find_IDPW.do", method = RequestMethod.GET)
	public ModelAndView Find_IDPW() {
		return new ModelAndView("Find_IDPW");
	}
	
	@RequestMapping(value = "/Find_PW.do", method = RequestMethod.GET)
	public ModelAndView Find_PW() {
		return new ModelAndView("Find_PW");
	}
	
	@RequestMapping(value = "/FindIDProc.do", method = RequestMethod.POST)
	public ModelAndView FindIDProc(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		String vName = request.getParameter("name");
		String vEmail = request.getParameter("email");
		
		dto = new MemberDTO();
		
		dto.setName(vName);
		dto.setEmail(vEmail);
		
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
		
		ArrayList<MemberDTO> dtoL = (ArrayList)ssi.selectList("FindID", dto);
		
		mav.addObject("dtoL", dtoL);
		mav.setViewName("FIndID_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/Find_PW_Proc.do", method = RequestMethod.POST)
	public ModelAndView Find_PW_Proc(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		String vId = request.getParameter("id");
		String vName = request.getParameter("name");
		String vEmail = request.getParameter("email");
		
		dto = new MemberDTO();
		
		dto.setId(vId);
		dto.setName(vName);
		dto.setEmail(vEmail);
		
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
		
		ArrayList<MemberDTO> dtoL = (ArrayList)ssi.selectList("FindPW", dto);
		
		mav.addObject("dtoL", dtoL);
		mav.setViewName("Find_PW_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/New_Setting_PWD.do", method = RequestMethod.GET)
	public ModelAndView New_Setting_PWD() {
		return new ModelAndView("New_Setting_PWD");
	}
	
	@RequestMapping(value = "/ChangePWD.do", method = RequestMethod.POST)
	public ModelAndView ChangePWD(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		String vId = request.getParameter("id");
		String vPwd = request.getParameter("pwd");
		
		dto = new MemberDTO();
		
		dto.setId(vId);
		dto.setPwd(vPwd);
		
		Reader rd = Resources.getResourceAsReader("mybatis-config.xml");
	    
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(rd);
	    SqlSession ssi = ssf.openSession();
		
		String vMsg;
		int su = ssi.update("memChange_PWD", dto);
		
		if (su != 0) {
			vMsg = "비밀번호 변경 완료";
			ssi.commit();
		}
		else {
			vMsg = "비밀번호 변경 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Alert_Center");
		
		return mav;
	}
}
