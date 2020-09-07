package com.board.command;

import java.util.ArrayList;
import com.board.model.*;
import javax.servlet.http.*;

public class BoardListCmd implements BoardCmd{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> list;
		
		int pageCnt = 0;
		String curPage = request.getParameter("curPage");
		
		if(curPage == null) curPage = "1";
		
		list = dao.boardList(curPage);
		
		request.setAttribute("boardList", list);
		 
		pageCnt = dao.boardPageCnt();
		request.setAttribute("pageCnt", pageCnt);
	}
}
