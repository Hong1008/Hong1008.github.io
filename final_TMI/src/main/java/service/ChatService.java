package service;

import java.util.List;

import dto.ChattingDTO;

public interface ChatService {
	public void insertchat(ChattingDTO dto);
	public void afterinsertChat(ChattingDTO dto);
	public List<ChattingDTO> chatList(String pro_id);
	public List<ChattingDTO> dateList(String pro_id);
	public String today();
	public void chatUpLoadFile(ChattingDTO dto);
}

