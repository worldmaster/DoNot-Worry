package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;


import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection(); // java.sql로 임포트
		// dao에게 일처리를 할 때 필요하기 때문에 커넥션 객체 얻어옴
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
		
	}

	
	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	public Member updateMember(Member m) {
		// 하나의 메소드 안에서 두개의 쿼리문 생성하기
		Connection conn = getConnection();
		
		//1) 회원정보 변경요청 보내기(UPDATE)
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMember = null;
		
		//2) 트랜잭션 처리
		if(result > 0) {//업데이트 성공
			commit(conn);
			
			//3) 갱신된 회원정보 다시 조회해오기
			updateMember = new MemberDao().selectMember(conn, m.getUserId(), m.getUserName());
		}else {//실패
			rollback(conn);
		}
		
		//4) 자원반납
		close(conn);
		
		return updateMember;
	}
	
	
	// 회원삭제
	public int deleteMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
		
	}
	


	
	
}
