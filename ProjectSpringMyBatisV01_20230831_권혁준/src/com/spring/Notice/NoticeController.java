package com.spring.Notice;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	String sql;
	public PreparedStatement pstmt;
	public Connection conn;
	
	NoticeDTO dton = new NoticeDTO();
	NoticeDAO daon = new NoticeDAO();
	
	EventDTO dtoe = new EventDTO();
	EventDAO daoe = new EventDAO();
	
	ArrayList<NoticeDTO> dtoL;
	ArrayList<EventDTO> dtoE;
	
	int recOfBeginPage = 0;
	int recPerPage = 10;
	
	@RequestMapping(value = "/Notice.do", method = RequestMethod.GET)
	public ModelAndView Notice(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<NoticeDTO> dtoST = daon.NoticeSel();
		
		mav.addObject("dtoL", dtoST);
		
		recOfBeginPage = 0;
		recPerPage = 5;
		
		if (request.getParameter("nowPage") != null) {
			recOfBeginPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		String nowBlock = request.getParameter("nowBlock");
		String nowPage = request.getParameter("nowPage");
		
		mav.addObject("nowPage", nowPage);
		mav.addObject("nowBlock", nowBlock);
		
		mav.setViewName("Notice");
		return mav;
	}
	
	@RequestMapping(value = "/Notice_view.do", method = RequestMethod.POST)
	public ModelAndView Notice_view(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String vNo = request.getParameter("nt_no");
		ArrayList<NoticeDTO> dtoS = daon.notice_Single_View(vNo);
		
		mav.addObject("dtoL", dtoS);
		
		mav.setViewName("Notice_View");
		return mav;
	}
	
	@RequestMapping(value = "/Notice_write.do", method = RequestMethod.GET)
	public ModelAndView Notice_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Notice_write");
		
		return mav;
	}
	
	@RequestMapping(value = "/Notice_write_Proc.do", method = RequestMethod.POST)
	public ModelAndView Notice_write_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String vMsg;
		String nt_title = request.getParameter("nt_title");
		String nt_content = request.getParameter("nt_content");
		String nt_writer = request.getParameter("nt_writer");
		
		dton = new NoticeDTO();
		
		dton.setNt_content(nt_content);
		dton.setNt_title(nt_title);
		dton.setNt_writer(nt_writer);
		
		int su = daon.NoticeIns(dton);
		
		if (su != 0) {
			vMsg = "공지사항 등록 완료";
		}
		else {
			vMsg = "공지사항 등록 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Notice_Write_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/NoticeUpd.do", method = RequestMethod.GET)
	public ModelAndView NoticeUpd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String vNo = request.getParameter("nt_no");
		ArrayList<NoticeDTO> dtoS = daon.notice_Single_View(vNo);
		
		mav.addObject("dtoL", dtoS);
		
		mav.setViewName("Notice_Upd");
		return mav;
	}
	
	@RequestMapping(value = "/Notice_Upd_Proc.do", method = RequestMethod.POST)
	public ModelAndView Notice_Upd_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String vMsg;
		String nt_title = request.getParameter("nt_title");
		String nt_content = request.getParameter("nt_content");
		String nt_writer = request.getParameter("nt_writer");
		String nt_no = request.getParameter("nt_no");
		
		dton.setNt_content(nt_content);
		dton.setNt_no(Integer.parseInt(nt_no));
		dton.setNt_title(nt_title);
		dton.setNt_writer(nt_writer);
		
		int su = daon.NoticeUpd(dton);
		
		if (su != 0) {
			vMsg = "공지사항 수정 완료";
		}
		else {
			vMsg = "공지사항 수정 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Notice_UpdDel_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/NoticeDel.do", method = RequestMethod.GET)
	public ModelAndView NoticeDel(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String vMsg;
		String vNo = request.getParameter("nt_no");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("vId");
		
		dton.setNt_no(Integer.parseInt(vNo));
		dton.setNt_writer(id);
		
		int su = daon.noticeDel(dton);
		
		if (su != 0) {
			vMsg = "공지사항 삭제 완료";
		}
		else {
			vMsg = "공지사항 삭제 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Notice_UpdDel_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/Event.do", method = RequestMethod.GET)
	public ModelAndView Event(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<EventDTO> dtoST = daoe.eventSel();
		
		mav.addObject("dtoL", dtoST);
		
		recOfBeginPage = 0;
		recPerPage = 5;
		
		if (request.getParameter("nowPage") != null) {
			recOfBeginPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		String nowBlock = request.getParameter("nowBlock");
		String nowPage = request.getParameter("nowPage");
		
		mav.addObject("nowPage", nowPage);
		mav.addObject("nowBlock", nowBlock);
		
		mav.setViewName("Event");
		return mav;
	}
	
	@RequestMapping(value = "/Event_View.do", method = RequestMethod.POST)
	public ModelAndView Event_view(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String vNo = request.getParameter("evt_no");
		ArrayList<EventDTO> dtoS = daoe.eventSel_View(vNo);
		
		mav.addObject("dtoL", dtoS);
		mav.setViewName("Event_View");
		
		return mav;
	}
	
	@RequestMapping(value = "/Event_Write.do", method = RequestMethod.GET)
	public ModelAndView Event_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Event_Write");
		
		return mav;
	}
	
	@RequestMapping(value = "/Event_write_Proc.do", method = RequestMethod.POST)
	public ModelAndView Event_write_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String vMsg;
		String evt_title = request.getParameter("evt_title");
		String evt_content = request.getParameter("evt_content");
		String evt_writer = request.getParameter("evt_writer");
		String evt_dating = request.getParameter("evt_dating");
		
		dtoe.setEvt_content(evt_content);
		dtoe.setEvt_title(evt_title);
		dtoe.setEvt_writer(evt_writer);
		dtoe.setEvt_dating(evt_dating);
		
		int su = daoe.eventIns(dtoe);
		
		if (su != 0) {
			vMsg = "이벤트 등록 완료";
		}
		else {
			vMsg = "이벤트 등록 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Event_write_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/Event_Upd.do", method = RequestMethod.GET)
	public ModelAndView Event_Upd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String vNo = request.getParameter("evt_no");
		ArrayList<NoticeDTO> dtoS = daon.notice_Single_View(vNo);
		
		mav.addObject("dtoL", dtoS);
		
		mav.setViewName("Event_Upd");
		return mav;
	}
	
	@RequestMapping(value = "/Event_Upd_Proc.do", method = RequestMethod.POST)
	public ModelAndView Event_Upd_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String vMsg;
		String evt_title = request.getParameter("evt_title");
		String evt_content = request.getParameter("evt_content");
		String evt_writer = request.getParameter("evt_writer");
		String evt_no = request.getParameter("evt_no");
		String evt_dating = request.getParameter("evt_dating");
		
		dtoe.setEvt_content(evt_content);
		dtoe.setEvt_no(Integer.parseInt(evt_no));
		dtoe.setEvt_title(evt_title);
		dtoe.setEvt_writer(evt_writer);
		dtoe.setEvt_dating(evt_dating);
		
		int su = daoe.eventUpd(dtoe);
		
		if (su != 0) {
			vMsg = "이벤트 수정 완료";
		}
		else {
			vMsg = "이벤트 수정 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Event_UpdDel_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/Event_Del.do", method = RequestMethod.GET)
	public ModelAndView Event_Del(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String vMsg;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("vId");
		String evt_no = request.getParameter("evt_no");
		
		dtoe.setEvt_no(Integer.parseInt(evt_no));
		dtoe.setEvt_writer(id);
		
		int su = daoe.eventDel(dtoe);
		
		if (su != 0) {
			vMsg = "이벤트 삭제 완료";
		}
		else {
			vMsg = "이벤트 삭제 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Event_UpdDel_Proc");
		
		return mav;
	}
}
