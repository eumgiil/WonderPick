package com.kh.wonderPick.chatting.controller;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.chatting.model.service.ChatingService;
import com.kh.wonderPick.chatting.model.vo.BeforeReadChatings;
import com.kh.wonderPick.chatting.model.vo.Chating;
import com.kh.wonderPick.chatting.template.CreateRoomId;
import com.kh.wonderPick.member.model.vo.Member;

@Controller
public class ChatingController {

	@Autowired
	private ChatingService chatingService;

	@Autowired
	private CreateRoomId cri;
	
	@RequestMapping("chating.co")
	public ModelAndView chatingView(int chooseMemNo, Chating c,ModelAndView mv, HttpSession session) throws IOException {
		//존재하는 대화내용 보여주기
		File file = new File("C:/springReview-workspace/finalProject/src/main/webapp/resources/chatingFiles/"+c.getMembertNickName()+c.getArtistNickName()+".txt");
		if(!file.exists()){ // 파일이 존재하지 않으면
			file.createNewFile(); // 신규생성
		}
		BufferedReader reader = new BufferedReader(new FileReader(file));
		//채팅방 사람 초대를 위한 방 주소
		if(chatingService.checkRoomExisted(c).isEmpty()) {
			System.out.println("방없어~");

			String roomName = cri.createRoomId(c.getMembertNickName(),c.getArtistNickName());

			c.setRoomName(roomName);

			chatingService.createRoom(c);
		}

		Chating roomName = chatingService.selectRoomName(c);

		String readYetMSG = "";

		if(chatingService.countReadYetChatings(roomName)>0) {
			ArrayList<BeforeReadChatings> brc = chatingService.selectreadYetChatings(roomName);

			if(!brc.isEmpty()) {
				for(BeforeReadChatings msg : brc) {
					readYetMSG+=msg.getContent()+"<small class=\"ReadCheck\">"+msg.getReadCheck()+"</small>";
				}
			}
		}



		String str = reader.readLine();
		reader.close();

		session.getAttribute("loginUser");

		mv.addObject("c",c).addObject("readYetMSG",readYetMSG).addObject("roomName",roomName).addObject("savedChating",str).setViewName("chating");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="insertUnreadChat.co",produces="application/json; charset=UTF-8")
	public int insertreadYetChatings(BeforeReadChatings brc) throws IOException {
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
		brc.setEnrollDate(simpleDateFormat.format(nowDate));
		return chatingService.insertreadYetChatings(brc);
	}

	@ResponseBody
	@RequestMapping(value="chatingSave.co",produces="application/json; charset=UTF-8")
	public void saveChating(String myName, String yourName,String text) throws IOException  {
		File file = new File("C:/springReview-workspace/finalProject/src/main/webapp/resources/chatingFiles/"+myName+yourName+".txt");

		// BufferedWriter 생성
		BufferedWriter writer = new BufferedWriter(new FileWriter(file, true));

		// 파일에 쓰기
		writer.write(text);
		//writer.newLine();
		// 버퍼 및 스트림 뒷정리
		writer.flush(); // 버퍼의 남은 데이터를 모두 쓰기
		writer.close(); // 스트림 종료
	}
	@ResponseBody
	@RequestMapping(value="readedChat.co",produces="application/json; charset=UTF-8")
	public void readedChating(Chating c) throws IOException {
		//상대가 채팅방에 없을 때는 보낸 내용을 db에 저장해서 채팅방에 입장 시 파일에 저장해 두고 db에 내용은 삭제한다
		File file = new File("C:/springReview-workspace/finalProject/src/main/webapp/resources/chatingFiles/"+c.getMembertNickName()+c.getArtistNickName()+".txt");

		ArrayList<BeforeReadChatings> brcList = chatingService.selectreadYetChatings(c);

		System.out.println("save c : "+c);
		System.out.println("brcList? : "+brcList);

		if(!brcList.isEmpty()) {

			for(BeforeReadChatings msg : brcList) {

				BufferedWriter writer = new BufferedWriter(new FileWriter(file, true));
				// 파일에 쓰기
				System.out.println(msg.getContent());
				writer.write(msg.getContent());
				//writer.newLine();
				// 버퍼 및 스트림 뒷정리
				writer.flush(); // 버퍼의 남은 데이터를 모두 쓰기
				writer.close(); // 스트림 종료
			}
			ArrayList<BeforeReadChatings> afterList = chatingService.selectreadYetChatings(c);
			System.out.println(afterList.get(0).getReadCheck());
			if(afterList.get(0).getReadCheck()<=0) {
				System.out.println("여기는 오냐 ㅋ");
				chatingService.removeReadChat(c);
				ArrayList<BeforeReadChatings> bfterList = chatingService.selectreadYetChatings(c);
				System.out.println(bfterList);
			}else {
				chatingService.countReadYetChatings(c);
			}
		}
	}

}
