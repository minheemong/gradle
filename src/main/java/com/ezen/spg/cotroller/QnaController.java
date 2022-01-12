package com.ezen.spg.cotroller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.spg.dto.HotelImgVO;
import com.ezen.spg.dto.MemberVO;
import com.ezen.spg.dto.QnaVO;
import com.ezen.spg.service.HotelImgServie;
import com.ezen.spg.service.QnaService;

    

@Controller
public class QnaController {
	
	@Autowired
	QnaService qs;
	@Autowired
	HotelImgServie hs;
	
	
	
	
	@RequestMapping("gotoimgshow")
	public ModelAndView gotoimgshow( HttpServletRequest request
			) {
		ModelAndView mav=new ModelAndView();
		
		String num=request.getParameter("num");
		
		System.out.println("num:"+num);
		String kind ="";
		
		if(num.equals("1")) {
			 kind="Deluxe";	 
		}else if(num.equals("2")) {
			kind="BusinessDeluxe";
		}else if(num.equals("3")) {
			kind="GrandCornerDeluxe";
		}else{
			kind="ExecuticeBusinessDeluxe";
		}
		
		HotelImgVO hvo= new HotelImgVO();
		System.out.println("kind :    "+kind);
		
		
			hvo.setKind(kind);
	
		ArrayList<HotelImgVO> imglist=hs.imglist(hvo);
		
		mav.addObject("imglist",imglist);

		mav.setViewName("room/gotoimgshow");
		return mav;
	}
	
	@RequestMapping("gotoroom")
	public ModelAndView Deluxe(HttpServletRequest request) {
		
		ModelAndView mav= new ModelAndView();
	String num=request.getParameter("num");
		
		System.out.println("num:"+num);
		String kind ="";
		
		if(num.equals("1")) {
			 kind="Deluxe";	 
			 mav.setViewName("room/Deluxe");
		}else if(num.equals("2")) {
			kind="BusinessDeluxe";
			mav.setViewName("room/BusinessDeluxe");
		}else if(num.equals("3")) {
			kind="GrandCornerDeluxe";
			mav.setViewName("room/GrandCornerDeluxe");
		}else{
			kind="ExecuticeBusinessDeluxe";
			mav.setViewName("room/ExecuticeBusinessDeluxe");
		}
		
		HotelImgVO hvo= new HotelImgVO();
		System.out.println("kind :    "+kind);
		
		
			hvo.setKind(kind);
	
		ArrayList<HotelImgVO> imglist=hs.imglist(hvo);
		
		mav.addObject("imglist",imglist);
		
		return mav;		
	}
	
	
	
	@RequestMapping("room")
	public String room() {
		return "room/room";
	}
	@RequestMapping("g")
	public String gallery() {
		return "gallery/gallery";
	}
	@RequestMapping("v")
	public String video() {
		return "gallery/video";
	}
	@RequestMapping("sitemap")
	public String sitemap() {
		return "Info/sitemap";
	}
	
	@RequestMapping("map")
	public String map() {
		return"Info/map";
	}
	
	@RequestMapping("qnaList") 
	public ModelAndView qna_list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    ModelAndView mav = new ModelAndView();
	    
	    if (mvo == null) mav.setViewName("member/login");
	    else {
	    	mav.addObject("qnaList", qs.listQna(mvo.getId()) );
	    	mav.setViewName("qna/qnaList");
	    }
		return mav;
	}
	
	
	@RequestMapping("qnaWriteForm")
	public String qna_writre_form(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo= (MemberVO) session.getAttribute("loginUser");    	    
	    if (mvo == null) return "member/login";
	    return "qna/qnaWrite";
	}
	
	
	
	
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	public ModelAndView qna_write( @ModelAttribute("dto") @Valid QnaVO qnavo,
			BindingResult result,  HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(result.getFieldError("title") != null ) {
			mav.addObject("message", "제목을 입력하세요");
			mav.setViewName("qna/qnaWrite");
			return mav;
		}else if(result.getFieldError("content") != null ) {
			mav.addObject("message", "내용을 입력하세요");
			mav.setViewName("qna/qnaWrite");
			return mav;
		}
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    if (mvo == null) mav.setViewName("member/login");
	    else {
	    	qnavo.setId(mvo.getId());
	    	qs.insertQna(qnavo);
	    }
		mav.setViewName("redirect:/qnaList");
		return mav;
	}
	
	
	
	
	
	@RequestMapping("qnaView")
	public ModelAndView qna_view(Model model, HttpServletRequest request,
			@RequestParam("qnaseq") int qnaseq) {
		HttpSession session = request.getSession();
	    MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
	    ModelAndView mav = new ModelAndView();
		if (mvo == null) mav.setViewName("member/login");
		else {
			mav.addObject("qnaVO", qs.getQna(qnaseq));
			mav.setViewName("qna/qnaView");
		}
		return mav;
	}
	
	
	
	@RequestMapping("contact")
	public String qna_contact(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo= (MemberVO) session.getAttribute("loginUser");    	    
	    if (mvo == null) return "member/login";
	    
	 
	    return "qna/contact";
	
	
}
	
	@RequestMapping("qnaUpdateForm")
	public ModelAndView qna_update_form( HttpServletRequest request,
			@RequestParam("qnaseq") int qnaseq) {
		ModelAndView mav= new ModelAndView();
		HttpSession session = request.getSession();
	    MemberVO mvo= (MemberVO) session.getAttribute("loginUser");    	    
	    if (mvo == null) mav.setViewName( "member/login");
	    QnaVO qvo=qs.getQna(qnaseq);

	    mav.addObject("qnaVO",qvo);
	    mav.setViewName("qna/qnaUpdateForm");
	    return mav;
	
	
}

	@RequestMapping(value="qnaUpdate", method=RequestMethod.POST)
	public ModelAndView qna_update(@ModelAttribute("dto") @Valid QnaVO qnavo,
			BindingResult result, Model model, HttpServletRequest request,
			@RequestParam("qnaseq") String qnaseq){
			ModelAndView mav= new ModelAndView();
		
			
			  if( result.getFieldError("title")!=null) {
				  mav.addObject("message", "제목을 입력하셔야합니다"); 
				  mav.setViewName("qna/qnaUpdateForm"); return mav; }
			  else  if(result.getFieldError("content") != null ) {
				  mav.addObject("message", "내용을 입력하세요"); 
			  mav.setViewName("qna/qnaUpdateForm"); return mav; }
			 
		
			HttpSession session= request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		    if (mvo == null) mav.setViewName("member/login");
		    else {
		    
	
		    	qnavo.setQnaseq(Integer.parseInt(qnaseq));
	
		    	qs.updateQna(qnavo);
		
		    	
		    }
			mav.setViewName("redirect:/qnaList");
			return mav;	
	
	}
	

	@RequestMapping("qnaDelete")
	public String qna_delete(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    MemberVO mvo= (MemberVO) session.getAttribute("loginUser");    	    
	    if (mvo == null) return "loginForm";
	    int qnaseq = Integer.parseInt(request.getParameter("qnaseq"));
	    qs.deleteQna(qnaseq);
	    
	    return "redirect:/qnaList";
	
	
}
}
