package com.sp.app.event.board;

import java.util.List;

import com.sp.app.domain.board.EventBoard;

public interface EventBoardService {
	void insertEventBoard(EventBoard eventboard, String pathname) throws Exception;
	
	void updateEventBoard(EventBoard eventboard) throws Exception;
	
	void deleteEventBoard(Long eventBoardId) throws Exception;
	
	List<EventBoard> getAllEventBoard() throws Exception;
	
	EventBoard getEventBoardById(Long eventBoardId) throws Exception;
}
