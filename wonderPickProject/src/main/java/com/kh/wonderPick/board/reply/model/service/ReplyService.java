package com.kh.wonderPick.board.reply.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.reply.model.vo.Reply1;

public interface ReplyService {
	
	ArrayList<Reply1> selectReplyList(int bno);

}
