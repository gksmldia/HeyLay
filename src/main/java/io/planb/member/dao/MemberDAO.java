package io.planb.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.planb.drawer.vo.DirectoryVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.leaved.vo.LeavedVO;
import io.planb.member.vo.IdentifyQuestionVO;
import io.planb.member.vo.MemberVO;
import io.planb.member.vo.SelectKeywordsVO;

public interface MemberDAO {

	/*회원 관련 부분*/
	public MemberVO login(MemberVO member); 				//로그인

	public void enroll(MemberVO member); 	    			//회원가입

	public List<MemberVO> selectByNo(MemberVO member); 		//회원정보 호출

	public void withdraw(MemberVO member);							//회원 탈퇴
	
	public void updateType(int no);							// 멤버 타입 F->P로 업데이트
	
	public void firstFolder(int memberNo);					// 회원 가입시 디폴트 폴더 생성
	
	public List<DirectoryVO> selectFolder(int memberNo);	// 폴더 변경시 폴더 리스트 호출
	
	public void deleteDirectory(int memberNo);				// 폴더 삭제
	
	public void updateName(Map<Integer, String> params);	// 폴더 이름 변경
	
	public void withdrawReason(LeavedVO leaved);			//회원 탈퇴 사유 입력

	public void changePw(MemberVO member);					//비밀번호 변경 

	public void mypageUpdate(MemberVO member);				//회원 정보 수정

	public List<KeywordsVO> selectInterestList();			//관심 키워드 선택지 호출
	
	public int getNextMemberNo();							// 멤버 넥스트 넘버

	public List<IdentifyQuestionVO> selectIdenQuestion();

	public void insertKeywords(SelectKeywordsVO keywords);  //관심 키워드 체크박스
	
	public int selectWithdrawContentCnt(int memberNo);		//회원 탈퇴 시 보유 컨텐츠 호출

	public String selectMemberAccount(MemberVO member);  	//계정 찾기

	public String selectMemberPassword(MemberVO member);    //비밀번호 찾기

	public String checkEmail(String email);		            //계정 중복 확인
	
	public String selectType(int no);

	public void updateDate(MemberVO member);                //로그인시 최근 접속기록 업데이트

	


}
