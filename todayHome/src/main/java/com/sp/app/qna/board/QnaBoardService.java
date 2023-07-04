package com.sp.app.qna.board;

import java.util.List;

import com.sp.app.domain.board.QnaBoard;
import com.sp.app.domain.board.QnaCategory;

public interface QnaBoardService {
	
	void insertQnaBoard(QnaBoard qnaboard) throws Exception;
	
	void updateQnaBoard(QnaBoard qnaboard) throws Exception;
	
	void deleteQnaBoard(Long qnaBoardId) throws Exception;
	
	List<QnaBoard> getAllQnaBoard(long qnaCategoryId) throws Exception;
	
	void insertQnaCategory(QnaCategory qnaCategory) throws Exception;
	
	void updateQnaCategory(QnaCategory qnaCategory) throws Exception;
	
	void deleteQnaCategory(Long qnaCategoryId) throws Exception;
	
	List<QnaCategory> getAllQnaCategory() throws Exception;
}
