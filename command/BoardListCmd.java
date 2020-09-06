package board.command;

import java.util.ArrayList;
import com.board.model.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardListCmd {
	
	public void excute (HttpServletRequest request, HttpServletResponse response) {
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
