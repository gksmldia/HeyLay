package io.planb.contents.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;
import io.planb.keywords.vo.KeywordsVO;

@Repository
public class ContentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ContentsVO getContents(ContentsVO vo) {
		ContentsVO contents = sqlSessionTemplate.selectOne("io.planb.dao.ContentDAO.selectContents", vo);
		return contents;
	}
	
	public List<ContentsVO> getCardsList(ContentsVO vo) {
		List<ContentsVO> cards = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectContents", vo);
		return cards;
	}
	
	public List<ContentsVO> getSavedCards(ContentsVO vo) {
		List<ContentsVO> savedCards = this.getCardsList(vo);
		return savedCards;
	}
	
	public List<Integer> getSavedContentsNo(int memberNo) {
		List<Integer> savedList = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectSavedContentsNo", memberNo);
		return savedList;
	}
	
	public List<Integer> getLikedContentsNo(int memberNo) {
		List<Integer> likedList = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectLikedContentsNo", memberNo);
		return likedList;
	}

	public List<ContentsVO> getViewedContentsNo(int memberNo) {
		List<ContentsVO> viewedList = sqlSessionTemplate.selectList("io.planb.dao.ContentDAO.selectViewedContentsNo", memberNo);
		return viewedList;
	}
	
	public int getSavedCnt(int contentsNo) {
		int savedCount = 0;
		try{
			savedCount = sqlSessionTemplate.selectOne("io.planb.dao.ContentDAO.selectSavedCnt", contentsNo);
		} catch(NullPointerException np) {
			savedCount = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return savedCount;
	}
	
	public int getLikedCnt(int contentsNo) {
		int likedCount = 0;
		try{
			likedCount = sqlSessionTemplate.selectOne("io.planb.dao.ContentDAO.selectLikedCnt", contentsNo);
		} catch(NullPointerException np) {
			likedCount = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return likedCount;
	}
	
	public int getPrevContentsNo(int contentsNo) {
		int prevContentsNo = 0;
		try {
			prevContentsNo = sqlSessionTemplate.selectOne("io.planb.dao.ContentDAO.selectPrevContents", contentsNo);
		} catch(NullPointerException np) {
			prevContentsNo = -1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return prevContentsNo;
	}
	
	public int getNextContentsNo(int contentsNo) {
		int nextContentsNo = 0;
		try {
			nextContentsNo = sqlSessionTemplate.selectOne("io.planb.dao.ContentDAO.selectNextContents", contentsNo);
		} catch(NullPointerException np) {
			nextContentsNo = -1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return nextContentsNo;
	}
	
	public List<KeywordsVO> selectKeywordList(int memberNo) {
		List<KeywordsVO> keywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectKeywordList", memberNo);
		
		return keywordList;
	}
	
	public void updateStatus(KeywordsVO keyword) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.updateStatus", keyword);
	}
	
	public List<ContentsVO> drawerCards(int memberNo) {
		List<ContentsVO> drawerCards = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.drawerCards", memberNo);
		return drawerCards;
	}
	
	public void saveCard(ContentsVO card) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.insertCardToSave", card);
	}
	
	public int getMostSavedSource(int no) {
		
		int mostSavedSourceNo = -1;
		
		try {
			mostSavedSourceNo = sqlSessionTemplate.selectOne("io.planb.contents.dao.ContentDAO.selectMostSavedSource", no);
		} catch(NullPointerException np) {
			mostSavedSourceNo = -1;
		} catch(Exception e) {
			mostSavedSourceNo = -1;
		}
		
		return mostSavedSourceNo;
	}
	
	public List<ContentsVO> selectCustomSourceList(int no) {
		List<ContentsVO> customSourceList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectCustomSourceList", no);
		
		return customSourceList;
	}

	public List<KeywordsVO> selectUserKeywordList(int no) {
		List<KeywordsVO> keywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectUserKeywordList", no);
		
		return keywordList;
	}

	public List<ContentsVO> selectCustomCuration(String keywords) {
		List<ContentsVO> customKeywordList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectCustomCuration", keywords);
		
		return customKeywordList;
	}
	
	public void likeCntUp(ContentsVO like) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.likeCntUp", like);
	}
	
	public void likeCancel(ContentsVO like) {
		sqlSessionTemplate.delete("io.planb.contents.dao.ContentDAO.likeCancel", like);
	}
	
	public int likeOrNot(ContentsVO like) {
		int cnt = sqlSessionTemplate.selectOne("io.planb.contents.dao.ContentDAO.likeOrNot", like);
		return cnt;
	}
	
	public int selectView(ContentsVO contents) {
		int cnt = sqlSessionTemplate.selectOne("io.planb.contents.dao.ContentDAO.selectView", contents);
		return cnt;
	}
	
	public List<ContentsVO> selectViewList(int memberNo) {
		
		List<ContentsVO> cntList = sqlSessionTemplate.selectList("io.planb.contents.dao.ContentDAO.selectViewList", memberNo);
		
		return cntList;
	}
	
	public void insertView(ContentsVO view) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.insertView", view);
	}
	
	public void updateView(ContentsVO view) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.updateView", view);
	}
	
	public void leavedKeyword(int memberNo) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.leavedKeyword", memberNo);
	}
	
	public void leavedLike(int memberNo) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.leavedLike", memberNo);
	}
	
	public void leavedView(int memberNo) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.leavedView", memberNo);
	}
	
	public void leavedSave(int memberNo) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.leavedSave", memberNo);
	}
	
	public void leavedDir(int memberNo) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.leavedDir", memberNo);
	}
	
	public int selectLikeCnt(int contentsNo) {
		int cnt = sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.selectLikeCnt", contentsNo);
		return cnt;
	}
	
	public int selectSavedCnt(int contentsNo) {
		int cnt = sqlSessionTemplate.selectOne("io.planb.contents.dao.ContentDAO.selectSavedCnt", contentsNo);
		
		return cnt;
	}
	
	public int getViewCnt(ContentsVO vo) {
		int viewCnt = 0;
		
		try{
			viewCnt = sqlSessionTemplate.selectOne("io.planb.contents.dao.ContentDAO.selectViewCnt", vo);
		} catch(NullPointerException np) {
			viewCnt = -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return viewCnt;
	}
	
	public void newViewCnt(ContentsVO vo) {
		sqlSessionTemplate.insert("io.planb.contents.dao.ContentDAO.insertViewCnt", vo);
	}
	
	public void addViewCnt(ContentsVO vo) {
		sqlSessionTemplate.update("io.planb.contents.dao.ContentDAO.updateViewCnt", vo);
	}

	
}
