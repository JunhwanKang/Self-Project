package com.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;

public class BoardDeleteCmd implements BoardCmd{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String inputNum = request.getParameter("num");
		
		BoardDAO dao = new BoardDAO();
		dao.boardDelete(inputNum);
	}

}
