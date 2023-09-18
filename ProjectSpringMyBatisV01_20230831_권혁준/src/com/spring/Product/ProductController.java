package com.spring.Product;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	ProductDTO dto = new ProductDTO();
	ProductDAO dao = new ProductDAO();
	
	ReviewDTO dtor = new ReviewDTO();
	
	QnADAO daoq = new QnADAO();
	QnADTO dtoq = new QnADTO();
	
	int totalRecord = dao.totalCount();
	int recOfBeginPage = 0;
	int recPerPage = 10;
	
	String vMsg;
	
	@RequestMapping(value = "/Outer.do", method = RequestMethod.GET)
	public ModelAndView Outer(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDTO> dtoST = dao.Product_View("1");
		
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
		
		mav.setViewName("Product_Outer");
		return mav;
	}
	
	@RequestMapping(value = "/Top.do", method = RequestMethod.GET)
	public ModelAndView Top(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDTO> dtoST = dao.Product_View("2");
		
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
		
		mav.setViewName("Product_Top");
		return mav;
	}
	
	@RequestMapping(value = "/Bottom.do", method = RequestMethod.GET)
	public ModelAndView Bottom(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDTO> dtoST = dao.Product_View("3");
		
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
		
		mav.setViewName("Product_Bottom");
		return mav;
	}
	
	@RequestMapping(value = "/Shoes.do", method = RequestMethod.GET)
	public ModelAndView Shoes(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDTO> dtoST = dao.Product_View("4");
		
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
		
		mav.setViewName("Product_Shoes");
		return mav;
	}
	
	@RequestMapping(value = "/Acc.do", method = RequestMethod.GET)
	public ModelAndView Acc(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDTO> dtoST = dao.Product_View("5");
		
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
		
		mav.setViewName("Product_ACC");
		return mav;
	}
	
	@RequestMapping(value = "/NEW_item.do", method = RequestMethod.GET)
	public ModelAndView NEW_item(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDTO> dtoST = dao.New_View();
		
		mav.addObject("dtoLS", dtoST);
		
		recOfBeginPage = 0;
		recPerPage = 5;
		
		if (request.getParameter("nowPage") != null) {
			recOfBeginPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		String nowBlock = request.getParameter("nowBlock");
		String nowPage = request.getParameter("nowPage");
		
		mav.addObject("nowPage", nowPage);
		mav.addObject("nowBlock", nowBlock);
		
		mav.setViewName("New_item");
		return mav;
	}
	
	@RequestMapping(value = "/BEST_item.do", method = RequestMethod.GET)
	public ModelAndView BEST_item(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDTO> dtoST = dao.Filter_View("select * from PJT_PRODUCT where PD_NAME Like '%SUPIMA%' and rownum < 6");
		
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
		
		mav.setViewName("BEST_item");
		return mav;
	}
	
	@RequestMapping(value = "/Search_Result.do", method = RequestMethod.GET)
	public ModelAndView Search_Result(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String pd_topic = request.getParameter("pd_topic");
		ArrayList<ProductDTO> dtoST = dao.Search_Viewer(pd_topic);
		
		mav.addObject("dtoSR", dtoST);
		
		recOfBeginPage = 0;
		recPerPage = 5;
		
		if (request.getParameter("nowPage") != null) {
			recOfBeginPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		String nowBlock = request.getParameter("nowBlock");
		String nowPage = request.getParameter("nowPage");
		
		mav.addObject("nowPage", nowPage);
		mav.addObject("nowBlock", nowBlock);
		mav.addObject("pd_topic", pd_topic);
		
		mav.setViewName("Search_Result");
		return mav;
	}
	
	@RequestMapping(value = "/More_info.do", method = RequestMethod.POST)
	public ModelAndView More_info(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String vSNum = request.getParameter("pd_snum");
		ArrayList<ProductDTO> dtoS = dao.More_Single_View(vSNum);
		
		mav.addObject("dtoS", dtoS);
		
		mav.setViewName("More_info");
		return mav;
	}
	
	@RequestMapping(value = "/Review_write.do", method = RequestMethod.GET)
	public ModelAndView Review_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Review_Write");
		
		return mav;
	}
	
	@RequestMapping(value = "/QnA_write.do", method = RequestMethod.GET)
	public ModelAndView QnA_write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("QnA_write");
		
		return mav;
	}
	
	@RequestMapping(value = "/QnA_write_Proc.do", method = RequestMethod.POST)
	public ModelAndView QnA_write_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		
		String rv_pd_Img = request.getParameter("rc_pd_img");
		String rv_pd_name = request.getParameter("rv_pd_name");
		String rv_writer = request.getParameter("rv_writer");
		String rv_content = request.getParameter("rv_content");
		String rv_title = request.getParameter("rv_title");
		
		dtoq.setQna_pd_name(rv_pd_name);
		dtoq.setQna_pd_img(rv_pd_Img);
		dtoq.setQna_content(rv_content);
		dtoq.setQna_title(rv_title);
		dtoq.setQna_writer(rv_writer);
		
		int su = daoq.qnaIns(dtoq);
					
		if (su != 0) {
			vMsg = "상품문의 등록 완료";
		}
		else {
			vMsg = "상품문의 등록 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Alert_Center");
		
		return mav;
	}
	
	@RequestMapping(value = "/CS_Center.do", method = RequestMethod.GET)
	public ModelAndView CS_Center(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<QnADTO> dtoST = daoq.qnaSel();
		
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
		
		mav.setViewName("CS_Center");
		
		return mav;
	}
	
	@RequestMapping(value = "/QnA_View.do", method = RequestMethod.POST)
	public ModelAndView QnA_View(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String vNo = request.getParameter("rv_no");
		ArrayList<QnADTO> dtoS = daoq.qnaSel_View(vNo);
		
		mav.addObject("dtoS", dtoS);
		
		mav.setViewName("QnA_More_View");
		return mav;
	}
	
	@RequestMapping(value = "/QnA_Upd.do", method = RequestMethod.GET)
	public ModelAndView QnA_Upd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("QnA_Update");
		
		return mav;
	}
	
	@RequestMapping(value = "/QnA_Upd_Proc.do", method = RequestMethod.POST)
	public ModelAndView QnA_Upd_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		
		String rv_title = request.getParameter("rv_title");
		String rv_content = request.getParameter("rv_content");
		String rv_writer = request.getParameter("rv_writer");
		String rv_pd_Img = request.getParameter("rc_pd_img");
		String rv_pd_name = request.getParameter("rv_pd_name");
		String rv_no = request.getParameter("rv_no");
		
		dtoq = new QnADTO();
		
		dtoq.setQna_content(rv_content);
		dtoq.setQna_pd_img(rv_pd_Img);
		dtoq.setQna_pd_name(rv_pd_name);
		dtoq.setQna_title(rv_title);
		dtoq.setQna_writer(rv_writer);
		dtoq.setQna_no(Integer.parseInt(rv_no));
		
		int su = daoq.qnaUpd(dtoq);
		
		if (su != 0) {
			vMsg = "문의사항 수정 완료";
		}
		else {
			vMsg = "문의사항 수정 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("QnA_UpdDel_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/QnA_Del.do", method = RequestMethod.GET)
	public ModelAndView QnA_Del(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		
		String rv_no = request.getParameter("rv_no");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("vId");
		dtoq = new QnADTO();
		
		dtoq.setQna_no(Integer.parseInt(rv_no));
		dtoq.setQna_writer(id);
		
		int su = daoq.qnaDel(dtoq);
		
		if (su != 0) {
			vMsg = "상품문의 삭제 완료";
		}
		else {
			vMsg = "상품문의 삭제 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("QnA_UpdDel_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/Review.do", method = RequestMethod.GET)
	public ModelAndView Review_List(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<ReviewDTO> dtoST = dao.reviewSel();
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
		mav.setViewName("Review_List");
		
		return mav;
	}
	
	@RequestMapping(value = "/Review_View.do", method = RequestMethod.POST)
	public ModelAndView Review_View(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String vNo = request.getParameter("rv_no");
		ArrayList<ReviewDTO> dtoS = dao.reviewSel_View(vNo);
		
		mav.addObject("dtoS", dtoS);
		
		mav.setViewName("Review_Single_View");
		return mav;
	}
	
	@RequestMapping(value = "/Review_write_Proc.do", method = RequestMethod.POST)
	public ModelAndView Review_write_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		
		String rv_pd_Img = request.getParameter("rc_pd_img");
		String rv_pd_name = request.getParameter("rv_pd_name");
		String rv_writer = request.getParameter("rv_writer");
		String rv_title = request.getParameter("rv_title");
		String rv_content = request.getParameter("rv_content");
		
		dtor = new ReviewDTO(rv_pd_name, rv_pd_Img, rv_title, rv_content, rv_writer);
		int su = dao.reviewIns(dtor);
		
		if (su != 0) {
			vMsg = "리뷰 등록 완료";
		}
		else {
			vMsg = "리뷰 등록 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		
		mav.setViewName("Alert_Center");
		return mav;
	}
	
	@RequestMapping(value = "/Review_Upd.do", method = RequestMethod.GET)
	public ModelAndView Review_Upd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Review_Update");
		
		return mav;
	}
	
	@RequestMapping(value = "/Review_Upd_Proc.do", method = RequestMethod.POST)
	public ModelAndView Review_Upd_Proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView mav = new ModelAndView();
		
		String rv_title = request.getParameter("rv_title");
		String rv_content = request.getParameter("rv_content");
		String rv_writer = request.getParameter("rv_writer");
		String rv_pd_Img = request.getParameter("rc_pd_img");
		String rv_pd_name = request.getParameter("rv_pd_name");
		String rv_no = request.getParameter("rv_no");
		
		dtor = new ReviewDTO(Integer.parseInt(rv_no), rv_title, rv_content, rv_writer);
		int su = dao.reviewUpd(dtor);
		
		if (su != 0) {
			vMsg = "리뷰 수정 완료";
		}
		else {
			vMsg = "리뷰 수정 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		
		mav.setViewName("Review_UpdDel_Proc");
		return mav;
	}
	
	@RequestMapping(value = "/Review_Del.do", method = RequestMethod.GET)
	public ModelAndView Review_Del(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("vId");
		String rv_no = request.getParameter("rv_no");
		dtor = new ReviewDTO();
		
		dtor.setRv_no(Integer.parseInt(rv_no));
		dtor.setRv_writer(id);
		
		int su = dao.reviewDel(dtor);
		
		if (su != 0) {
			vMsg = "리뷰 삭제 완료";
		}
		else {
			vMsg = "리뷰 삭제 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Review_UpdDel_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/Cart.do", method = RequestMethod.GET)
	public ModelAndView Cart(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		CartDAO daoc = new CartDAO();
		ArrayList<CartDTO> dtoC = daoc.cartSel();
		
		mav.addObject("dtoST", dtoC);
		mav.setViewName("Cart");
		
		return mav;
	}
	
	@RequestMapping(value = "/Cart_Add.do", method = RequestMethod.GET)
	public ModelAndView Cart_Add(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String cr_name = request.getParameter("pd_name");
		String cr_img = request.getParameter("pd_img");
		String cr_price = request.getParameter("pd_price");
		
		CartDTO dtoc = new CartDTO();
		
		dtoc.setCr_name(cr_name);
		dtoc.setCr_img(cr_img);
		dtoc.setCr_price(cr_price);
		
		CartDAO daoc = new CartDAO();
		
		int su = daoc.cartIns(dtoc);
		
		if (su != 0) {
			vMsg = "장바구니 담기 완료";
		}
		else {
			vMsg = "장바구니 담기 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Cart_Proc");
		
		return mav;
	}
	
	@RequestMapping(value = "/Cart_Delete.do", method = RequestMethod.POST)
	public ModelAndView Cart_Delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String[] ct_name = request.getParameterValues("cart_idx_num");
		
		CartDTO dtoc = new CartDTO();
		CartDAO daoc = new CartDAO();
		
		int su = daoc.cartDel(ct_name);
		
		if (su != 0) {
			vMsg = "장바구니 삭제 완료";
		}
		else {
			vMsg = "장바구니 삭제 실패";
		}
		
		mav.addObject("vMsg", vMsg);
		mav.setViewName("Cart_Proc");
		
		return mav;
	}
}
