package io.planb.membership.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.planb.member.service.MemberService;
import io.planb.member.vo.IdentifyQuestionVO;
import io.planb.member.vo.MemberVO;
import io.planb.statics.vo.StaticsListVO;
import io.planb.statics.vo.StaticsVO;


@Controller
public class MembershipController {

	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value="/membership/agreement.do")
	public String agreement() {
		
		return "membership/agreement";
	}
	
	@RequestMapping(value="/membership/membership.do", method=RequestMethod.GET)
	public String membershipForm(@ModelAttribute("member") MemberVO member, Model model) {
		
		List<IdentifyQuestionVO> idenQuestionList = service.selectIdenQuestion();
		model.addAttribute("idenQuestionList", idenQuestionList);
		
		return "membership/membershipform";
	}
	
	@RequestMapping(value="/membership/membershipForm.do", method=RequestMethod.POST)
	public String membership(@ModelAttribute("member") MemberVO member, Model model) {
		
		service.enroll(member);
		model.addAttribute("memberVO", member);
		
		return "login/login";
	}
	
	/*아이디 중복 확인*/
	@ResponseBody
	@RequestMapping(value="/membership/idcheck.do")
	public String selectUserAccount(@RequestParam String email,HttpServletRequest request){
		
		email = service.checkEmail(email);
		//System.out.println("email : " + email);
		
		if(email == null){
		request.setAttribute("use", email);
		}
		return email;
	}
	
	@RequestMapping(value="/contents/update_type.do", method=RequestMethod.POST)
	public String updateType(HttpSession session, @RequestParam("no") int no) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		service.updateType(no);
		String type = service.selectType(no);
		
		userVO.setType(type);
		session.setAttribute("userVO", userVO);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/contents/updateName.do", method=RequestMethod.POST)
	public String updateName(@RequestBody Map<Integer, String> params, Model model) {
		
		service.updateName(params);

		return "완료";
	}
	
	
	/* 선호 키워드 추가 */
	@RequestMapping("/jsp/keyword_insert.do")
	public String insertKeywords(@RequestParam(value="checkboxValues[]") List<String> param, HttpSession session) {
		ArrayList<String> list = new ArrayList<>();
        list.addAll(param);
		
        MemberVO member = (MemberVO) session.getAttribute("userVO");
        
		service.insertKeywords(list, member.getNo());
		
		return "redirect:/";
	}
	
	/*가입 or 로그인 후 검색 이전 키워드 추천*/
	/*@ResponseBody
	@RequestMapping("/index/recommandKeywordList.do")
	public String selectRecommandList(Model model) {
		
		String recommandList = service.selectRecommandList();
		System.out.println("controller recommandList : " + recommandList);
		model.addAttribute(recommandList);
		
		return recommandList;
	}*/
	
}

