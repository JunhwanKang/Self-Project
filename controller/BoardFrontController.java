package com.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.board.command.*;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.bbs")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset = UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String cmdURI=requestURI.substring(contextPath.length());
		
		BoardCmd cmd=null;
		String viewPage=null;
		
		if(cmdURI.equals("/BoardList.bbs")) { 
			cmd =  new BoardListCmd();
			cmd.execute(request,response);
			viewPage="BoardList.jsp";
		}
		if(cmdURI.equals("/BoardWriteForm.bbs")) {
			viewPage = "BoardWrite.jsp";
		}
		if(cmdURI.equals("/BoardWrite.bbs")) {
			cmd = new BoardWriteCmd();
			cmd.execute(request, response);
			 viewPage = "BoardList.bbs";
		}
		if(cmdURI.equals("/boardRead.bbs")) {
			cmd = new BoardReadCmd();
			cmd.execute(request, response);
			viewPage = "BoardRead.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
		dis.forward(request, response);
	}

}
