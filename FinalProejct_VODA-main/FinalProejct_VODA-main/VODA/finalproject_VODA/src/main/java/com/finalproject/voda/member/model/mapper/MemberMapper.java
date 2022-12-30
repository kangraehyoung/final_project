package com.finalproject.voda.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.finalproject.voda.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMemberById(@Param("m_id") String id);

	int insertMember(Member member);

	int updateMember(Member member);

	int deleteMember(int no);

	Member selectMemberByEmail(String email);

	int findIdCheck(String m_email);

	List<Member> findId(String m_email);

	Member findPwd(String m_email);

	int passwordUpdate(Member member);

	int insertMemberKakao(Member newMember);

	int insertMemberNaver(Member newMember);
	

}