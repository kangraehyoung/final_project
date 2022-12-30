package com.finalproject.voda.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.member.kakao.KakaoLoginBO;
import com.finalproject.voda.member.model.service.MemberService;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.member.naver.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired 
	private MemberService service;
	
	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	
	private String apiResult = null;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	

	@GetMapping("/enroll") 
	public String enroll() {
		
		return "member/enroll"; 
		
	}
	
	@GetMapping("/enrollComplete") 
	public String enrollComplete() {
		
		return "member/enrollComplete"; 
		
	}
	

	@PostMapping("/enroll")  // 회원가입
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member memeber){
		
		int result = 0;
		result = service.save(memeber);
		
		if(result > 0) {
			model.addObject("msg", "회원 가입이 완료되었습니다.");
			model.addObject("location", "/member/enrollComplete");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다. 가입 페이지로 돌아갑니다.");
			model.addObject("location", "/member/enroll");
		}		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	@PostMapping("/idCheck") // id 중복검사
	public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam String user_id) {
		log.info("{}", user_id);
		
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isDuplicateID(user_id));
		
		return new ResponseEntity<Map<String, Boolean>>(map, HttpStatus.OK);
	}
	
	
	@PostMapping("/emailCheck") // email 중복검사
	public ResponseEntity<Map<String, Boolean>> emailCheck(@RequestParam String user_email) {
		log.info("{}", user_email);
		
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isDuplicateEmail(user_email));
		
		return new ResponseEntity<Map<String, Boolean>>(map, HttpStatus.OK);
	}
	
	
	
	@PostMapping("/login") // 로그인
	public ModelAndView login(ModelAndView model,
			@RequestParam("m_id") String id, @RequestParam("m_password") String password
			) {	
	
		log.info("{}, {}", id, password);
		
		Member loginMember = service.login(id, password);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");

		
		} else {
			model.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			model.addObject("location", "/member/login");
			model.setViewName("common/msg");			
			}		
		
		return model;
	}	
	
	
	@GetMapping("/logout") // 로그아웃 처리 
	public String logout(SessionStatus status) {
		
		status.setComplete(); 
		
		return "redirect:/";
	}
	
	
	
	@GetMapping("/findId") 
	public String findId() {
		
		return "member/findId"; 
		
	}
	
		
	
	@PostMapping("/findId") // 아이디 찾기
	public String findId(Member member, Model model) {
      
		if(service.findIdCheck(member.getM_email()) == 0) {
          model.addAttribute("msg", "가입 시 입력하신 회원 정보가 맞는지 다시 한번 확인해 주세요.");
          model.addAttribute("location", "/member/findId");
          
          return "common/msg";
          
       }  else {
          model.addAttribute("member", service.findId(member.getM_email()));

          return "member/idVerify";
       }
		
		
	}
	
	
	
	@GetMapping("/idVerify") 
	public String idVerify() {
		
		return "member/idVerify"; 
		
	}
	
	
	
	@GetMapping("/findPwd") 
	public String findPwd() {
		
		return "member/findPwd"; 
		
	}
	
	@PostMapping("/findPwd") // 비밀번호 찾기
	public ModelAndView findPwd(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String m_email = (String)request.getParameter("m_email");
		String m_id = (String)request.getParameter("m_id");

		Member member = service.findPwd(m_email);
		
		if(member != null) {
			Random r = new Random();
			int num = r.nextInt(999999); // 랜덤난수설정
		
			if (member.getM_id().equals(m_id)) {
				session.setAttribute("email", member.getM_email());

				String setfrom = "VODA"; // naver 
				String tomail = m_email; //받는사람
				String title = "[VODA] 인증번호를 보내드립니다. 인증 후 비밀번호를 재설정 해주세요."; 
				String content = System.getProperty("line.separator") 
						+ "안녕하세요. VODA 입니다." 
						+ System.getProperty("line.separator")
						+ "아래 인증번호를 입력하여 비밀번호를 재설정 해주세요." 
						+ System.getProperty("line.separator")
						+ "[VODA] 비밀번호 찾기(변경) 인증번호는 " + num + " 입니다." 
						+ System.getProperty("line.separator");		
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content); 

					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/verifyCode");
				mv.addObject("m_email", m_email);
				mv.addObject("num", num);
				return mv;
			}else {
				ModelAndView mv = new ModelAndView();
				mv.addObject("msg", "가입 시 등록한 아이디와 이메일을 입력해 주세요");
				mv.addObject("location", "/member/findPwd" );
				mv.setViewName("common/msg");
				return mv;
			}
			
		} else {
			ModelAndView mv = new ModelAndView();
			mv.addObject("msg", "가입 시 등록한 아이디와 이메일 입력해 주세요");
			mv.addObject("location", "/member/findPwd" );
			mv.setViewName("common/msg");
			return mv;
		}
		
		
	}
	
	
	@PostMapping("/verifyCode")  // 이메일 인증번호 확인
	public ModelAndView verifyCode(ModelAndView model,
							 @RequestParam(value="code") String code,
							 @RequestParam(value = "num") String num,
							 @RequestParam(value = "m_email") String m_email){
		if(code.equals(num)) {
			model.addObject("m_email", m_email);
			model.setViewName("member/pwdReset");
			return model;
		}
		else {
			model.addObject("msg", "올바른 인증번호를 입력해 주세요 ");
			model.addObject("location", "/member/findPwd");
			model.setViewName("common/msg");
//			model.setViewName("member/verifyCode");
			return model;
		}
	} 
	
	
	
	@PostMapping("/pwdReset") // DB 비밀번호 업데이트
	public ModelAndView pwdReset(@RequestParam(value="m_email") String m_email, 
								 ModelAndView model, Member member, HttpSession session){
		
		int result = service.passwordUpdate(member);
		
		System.out.println(member);
		System.out.println(result);
		
		if(result > 0) {
			model.addObject("msg", "비밀번호 수정이 완료되었습니다.");
			model.addObject("location", "/member/login");
		}
		else {
			System.out.println("passwordUpdate"+ result);
			model.addObject("msg", "비밀번호 수정을 실패했습니다.");
			model.addObject("location", "/member/pwdReset");
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
	
	
		
	@GetMapping("/findPwdSendEmail") 
	public String findPwdSendEmail() {
		
		
		
		return "member/findPwdSendEmail"; 
		
	}
	
	@GetMapping("/pwdReset") 
	public String pwdReset() {
		
		return "member/pwdReset"; 
		
	}
	
	@GetMapping("/people") 
	public String people() {
		
		return "people/people"; 
		
	}
	
	
	@GetMapping("/teatApi") 
	public String teatApi() {
		
		return "member/teatApi"; 
		
	}
	
	
	
	
	// 카카오 로그인
	@GetMapping("/login") 
	public String login(Model model, HttpSession session) {
		
		/* 카카오 URL */
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		System.out.println("카카오:" + kakaoAuthUrl);	
		
		model.addAttribute("urlKakao", kakaoAuthUrl);	
		
		/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		/* 인증요청문 확인 */
		System.out.println("네이버:" + naverAuthUrl);
		/* 객체 바인딩 */
		model.addAttribute("urlNaver", naverAuthUrl);
		
		
		return "member/login"; 		
	}
	
	

	
	// 카카오 로그인 성공시 callback
	@RequestMapping(value = "/kakaologin", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callbackKakao(ModelAndView model, 
									  @RequestParam String code, 
									  @RequestParam String state, HttpSession session) 
			throws Exception {
		System.out.println("로그인 성공 callbackKako");
		
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state);	
		// 로그인 사용자 정보를 읽어온다
		apiResult = kakaoLoginBO.getUserProfile(oauthToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");	
		JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj2.get("nickname");
		System.out.println(email + name + apiResult);

		Member loginMember = null;
		
		// 아이디 여부 체크 
		if(service.isDuplicateID(email)) { // 아이디가 중복된 게 있니? 
			loginMember = service.findMemberById(email); 

			model.addObject("loginMember", loginMember);
			model.addObject("msg", "로그인에 성공하였습니다.");
			model.addObject("location", "/");
			
		} else {
			int result = 0;
			
			Member newMember = new Member();
			newMember.setM_id(email);
			newMember.setM_name(name);
			result =  service.saveKakao(newMember);
			
			if(result > 0) {
				loginMember = service.findMemberById(email); 

				model.addObject("loginMember", loginMember);
				model.addObject("msg", "로그인에 성공하였습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "로그인에 실패하였습니다. 로그인 페이지로 돌아갑니다.");
				model.addObject("location", "/member/login");
			}
			
		}
		
		// 세션에 사용자 정보 등록
		// session.setAttribute("islogin_r", "Y");
		session.setAttribute("signIn", apiResult);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		System.out.println(email + name + apiResult);

		model.setViewName("common/msg");
		return model;
	}
	

//	// 네이버 로그인
//	@GetMapping("/login") 
//	public String naverLogin(Model model, HttpSession session) {
//		
//		/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		/* 인증요청문 확인 */
//		System.out.println("네이버:" + naverAuthUrl);
//		/* 객체 바인딩 */
//		model.addAttribute("urlNaver", naverAuthUrl);
//
//		/* 생성한 인증 URL을 View로 전달 */
//
//		return "member/login"; 		
//	}
	
	
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callbackNaver(ModelAndView model, 
									  @RequestParam String code, 
									  @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("로그인 성공 callbackNaver");
		
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");			
		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		
		Member loginMember = null;
		
		// 아이디 여부 체크 
		if(service.isDuplicateID(email)) { // 아이디가 중복된 게 있니? 
			loginMember = service.findMemberById(email); 

			model.addObject("loginMember", loginMember);
			model.addObject("msg", "로그인에 성공하였습니다.");
			model.addObject("location", "/");
			
		} else {
			int result = 0;
			
			Member newMember = new Member();
			newMember.setM_id(email);
			newMember.setM_name(name);
			result =  service.saveNaver(newMember);
			
			if(result > 0) {
				loginMember = service.findMemberById(email); 

				model.addObject("loginMember", loginMember);
				model.addObject("msg", "로그인에 성공하였습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "로그인에 실패하였습니다. 로그인 페이지로 돌아갑니다.");
				model.addObject("location", "/member/login");
			}
			
		}
		
		// 세션에 사용자 정보 등록
		// session.setAttribute("islogin_r", "Y");
		session.setAttribute("signIn", apiResult);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		System.out.println(email + name + apiResult);

		
		model.setViewName("common/msg");
		return model;
	}
    
}
