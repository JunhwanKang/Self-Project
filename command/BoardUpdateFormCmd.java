package com.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardUpdateFormCmd implements BoardCmd{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String inputNum = request.getParameter("num");
		BoardDAO dao = new BoardDAO();
		BoardDTO writing = dao.boardUpdateForm(inputNum);
		
		request.setAttribute("boardUpdateForm", writing);
	}

}
