package com.finalproject.voda.member.model.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.voda.member.email.MailUtils;
import com.finalproject.voda.member.model.mapper.MemberMapper;
import com.finalproject.voda.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired 
	private MemberMapper mapper;
	
	@Override
	@Transactional 
	public int save(Member member) {
		int result = 0;
		
		if(member.getM_no() != 0) {
			// update
//			result = mapper.updateMember(member);
		} else {
			// insert
			member.setM_password(passwordEncoder.encode(member.getM_password()));
			
			result = mapper.insertMember(member);
		}
		
		return result;
	}
	
	@Override
	public Member findMemberById(String id) {
		
		return mapper.selectMemberById(id);
	}
	
	@Override
	public Member findMemberByEmail(String email) {
		
		return mapper.selectMemberByEmail(email);
	}

	@Override
	public Boolean isDuplicateID(String id) {
		
		return this.findMemberById(id) != null;

	}
	
	
	@Override
	public Boolean isDuplicateEmail(String email) {


		return this.findMemberByEmail(email) != null;
	}

	
	@Override
	public Member login(String id, String password) {
		Member member = null;
				
		member = this.findMemberById(id);
		
		System.out.println("encode() : " + passwordEncoder.encode(password));
		
		if(member != null && passwordEncoder.matches(password, member.getM_password())) {
			return member;
		} else {
			return null;
		}
	}

	@Override
	public int findIdCheck(String m_email) {

		return mapper.findIdCheck(m_email);
	}

	@Override
	public List<Member> findId(String m_id) {

		return mapper.findId(m_id);
	}

	@Override
	public Member findPwd(String m_email) {

		return mapper.findPwd(m_email);
	}

	@Override
	public int passwordUpdate(Member member) {
		int result = 0;		
		
		 member.setM_password(passwordEncoder.encode(member.getM_password()));
	     result = mapper.passwordUpdate(member);
	    
	     System.out.println("result : " + result);
	     System.out.println("member : " + member);
		
		return result;
	}

	@Override
	@Transactional
	public int saveKakao(Member newMember) {
		int result = 0;
		
		if(newMember.getM_no() != 0) {
			// update
		} else {
			// insert
			result = mapper.insertMemberKakao(newMember);
		}
		
		return result;
	}

	@Override
	@Transactional
	public int saveNaver(Member newMember) {
		int result = 0;
		
		if(newMember.getM_no() != 0) {
			// update
		} else {
			// insert
			result = mapper.insertMemberNaver(newMember);
		}
		
		return result;
	}

}
