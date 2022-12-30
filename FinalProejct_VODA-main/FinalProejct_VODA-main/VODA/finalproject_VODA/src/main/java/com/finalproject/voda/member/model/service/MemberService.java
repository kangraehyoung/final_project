package com.finalproject.voda.member.model.service;

import java.util.List;

import com.finalproject.voda.member.model.vo.Member;

public interface MemberService {

	int save(Member memeber);

	Boolean isDuplicateID(String id);

	Member findMemberById(String id);

	Member login(String id, String password);

	Boolean isDuplicateEmail(String email);

	Member findMemberByEmail(String email);

	int findIdCheck(String m_email);

	List<Member> findId(String m_email);

	Member findPwd(String m_email);

	int passwordUpdate(Member member);

	int saveKakao(Member newMember);

	int saveNaver(Member newMember);
	
}
