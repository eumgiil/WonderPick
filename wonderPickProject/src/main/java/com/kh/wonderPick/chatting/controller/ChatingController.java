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

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.chatting.model.service.ChatingService;
import com.kh.wonderPick.chatting.model.vo.AcceptCondition;
import com.kh.wonderPick.chatting.model.vo.AddPriceAndReason;
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

	@Autowired
	private WebSocketBasicServer wsb;

	@RequestMapping("chating.co")
	public ModelAndView chatingView(Chating c, 
			@RequestParam(value="boardNo", defaultValue = "0")int boardNo, 
			HttpSession session, 
			ModelAndView mv,
			@RequestParam(value="alreadyReject", defaultValue = "0")int alreadyReject,
			@RequestParam(value="totalPrice", defaultValue = "0")int totalPrice
			) throws IOException {

		System.out.println(boardNo);

		Member loginMember = (Member) session.getAttribute("loginMember");

		c.setMembertNickName(loginMember.getNickName());
		c.setMemberNo(loginMember.getMemberNo());
		c.setBoardNo(boardNo);

		if(boardNo==0) {

			Chating roomListSearch = new Chating();

			roomListSearch.setMembertNickName("%"+c.getMembertNickName()+"%");

			ArrayList<Chating> roomList = chatingService.selectAllRoom(roomListSearch);

			for(Chating c1 : roomList) {
				if(c1.getMemberNo()==loginMember.getMemberNo()) {
					c1.setMembertNickName(chatingService.selectMemberNick(c1.getMemberNo()));
					c1.setArtistNickName(chatingService.selectMemberNick(c1.getArtistNo())) ;
				}
				if(c1.getArtistNo()==loginMember.getMemberNo()) {
					c1.setMembertNickName(chatingService.selectMemberNick(c1.getArtistNo()));
					c1.setArtistNickName(chatingService.selectMemberNick(c1.getMemberNo()));
				}
			}
			System.out.println(roomList);
			mv.addObject("roomList",roomList)
			.addObject("c",c)
			.addObject("alreadyReject",alreadyReject)
			.setViewName("/chating/chating");

		}else {

			Member nickAndNo = chatingService.selectartistNick(boardNo);

			System.out.println(nickAndNo);

			c.setArtistNickName(nickAndNo.getNickName());
			c.setArtistNo(nickAndNo.getMemberNo());

			System.out.println(c);

			//존재하는 대화내용 보여주기
			File file = new File("C:/wonderPick-workspace/WonderPick/wonderPickProject/src/main/webapp/resources/chatingFiles/"
					+c.getMembertNickName()+c.getArtistNickName()+".txt");
			if(!file.exists()){ // 파일이 존재하지 않으면
				file.createNewFile(); // 신규생성
				// C:/wonderPick-workspace/WonderPick/wonderPickProject/src/main/webapp/resources/chatingFiles/이걸로 바꿔요
				// /Users/gi_ill/Project/WonderPick_workspace/wonderPickProject/bin/src/main/webapp/resources 이건내꺼
			}

			//채팅 리스트 조회
			Chating roomListSearch = new Chating();

			roomListSearch.setMembertNickName("%"+c.getMembertNickName()+"%");

			ArrayList<Chating> roomList = chatingService.selectAllRoom(roomListSearch);

			for(Chating c1 : roomList) {
				if(c1.getMemberNo()==loginMember.getMemberNo()) {
					c1.setMembertNickName(((Member)chatingService.selectartistNick(c1.getMemberNo())).getNickName());
					c1.setArtistNickName(((Member)chatingService.selectartistNick(c1.getArtistNo())).getNickName());
				}
				if(c1.getArtistNo()==loginMember.getMemberNo()) {
					c1.setMembertNickName(((Member)chatingService.selectartistNick(c1.getArtistNo())).getNickName());
					c1.setArtistNickName(((Member)chatingService.selectartistNick(c1.getMemberNo())).getNickName());
				}
			}

			BufferedReader reader = new BufferedReader(new FileReader(file));

			//채팅방 사람 초대를 위한 방 주소
			if(chatingService.checkRoomExisted(c).isEmpty()) {
				System.out.println("방없어~");

				String roomName = cri.createRoomId(c.getMembertNickName(),c.getArtistNickName());

				c.setRoomName(roomName);

				chatingService.createRoom(c);
			}

			Chating rn = new Chating();

			rn.setArtistNickName("%"+c.getArtistNickName()+"%");
			rn.setMembertNickName("%"+c.getMembertNickName()+"%");

			c.setRoomName(chatingService.selectRoomName(rn).getRoomName());

			String readYetMSG = "";

			ArrayList<BeforeReadChatings> brc = chatingService.selectreadYetChatings(c);

			String str = reader.readLine();

			reader.close();

			if(null==str) {
				str="";
			}

			if(!brc.isEmpty()) {
				int read = 0;
				for(BeforeReadChatings msg : brc) {
					if(msg.getFromMember().equals(c.getMembertNickName()) && !(msg.getReadCheck().equals(msg.getToMember()))) {
						readYetMSG+=msg.getContent()+"<small class=\"ReadCheck\">1</small>";
						System.out.println("1");
					} 
					if(msg.getFromMember().equals(c.getMembertNickName()) && msg.getReadCheck().equals(msg.getToMember())){
						readYetMSG+=msg.getContent()+"<small class=\"ReadCheck\"></small>";
						read=1;
						System.out.println("2");
					}
					if(msg.getToMember().equals(c.getMembertNickName()) && !(msg.getReadCheck().equals(msg.getToMember()))){
						readYetMSG+=msg.getContent()+"<small class=\"ReadCheck\"></small>";
						chatingService.countReadYetChatings(c);
						readedChating(c);
						System.out.println("3");
					}
				}
				if(read==1) {
					readedChating(c);
					chatingService.removeReadChat(c);
					System.out.println("4");
				}
			}
			ArrayList<AddPriceAndReason> apan = chatingService.selectCondition(c);
			
			//세션에 맴버 받아와야함
			mv.addObject("c",c)
			.addObject("orderList",apan)
			.addObject("alreadyReject",alreadyReject)
			.addObject("readYetMSG",readYetMSG)
			.addObject("roomList",roomList)
			.addObject("savedChating",str)
			.addObject("boardNo",boardNo)
			.setViewName("/chating/chating");
		}
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
		File file = new File("C:/wonderPick-workspace/WonderPick/wonderPickProject/src/main/webapp/resources/chatingFiles/"+myName+yourName+".txt");

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
		File file = new File("C:/wonderPick-workspace/WonderPick/wonderPickProject/src/main/webapp/resources/chatingFiles/"+c.getMembertNickName()+c.getArtistNickName()+".txt");
		System.out.println(file.getName());
		ArrayList<BeforeReadChatings> brcList = chatingService.selectreadYetChatings(c);

		if(!brcList.isEmpty()) {
			ArrayList<BeforeReadChatings> afterList = chatingService.selectreadYetChatings(c);
			if(afterList.get(0).getReadCheck().equals(afterList.get(0).getToMember())) {
				BufferedWriter writer = null;
				writer = new BufferedWriter(new FileWriter(file, true));
				for(BeforeReadChatings msg : afterList) {
					System.out.println(msg);
					// 파일에 쓰기
					writer.write(msg.getContent());
					//writer.newLine();
					// 버퍼 및 스트림 뒷정리
					writer.flush(); // 버퍼의 남은 데이터를 모두 쓰기
				}
				writer.close();
				chatingService.removeReadChat(c);
			}
			if(!afterList.get(0).getReadCheck().equals(afterList.get(0).getToMember())) {
				BufferedWriter writer = null;
				writer = new BufferedWriter(new FileWriter(file, true));
				for(BeforeReadChatings msg : afterList) {
					System.out.println(msg);
					// 파일에 쓰기
					writer.write(msg.getContent());
					//writer.newLine();
					// 버퍼 및 스트림 뒷정리
					writer.flush(); // 버퍼의 남은 데이터를 모두 쓰기
					writer.close();
				}
			}
		}
	}

	@ResponseBody
	@RequestMapping(value="loadChatings.co", produces="application/json; charset=UTF-8")
	public JSONObject loadChatings(Chating c) throws IOException {

		System.out.println("?"+c);

		Chating rn = new Chating();

		rn.setArtistNickName("%"+c.getArtistNickName()+"%");
		rn.setMembertNickName("%"+c.getMembertNickName()+"%");

		System.out.println(rn);

		Chating roomAdd = chatingService.selectRoomName(rn);

		System.out.println(roomAdd);

		wsb.changeRoom(c.getRoomName(), c.getMembertNickName());

		File file = new File("C:/wonderPick-workspace/WonderPick/wonderPickProject/src/main/webapp/resources/chatingFiles/"+c.getMembertNickName()+c.getArtistNickName()+".txt");
		if(!file.exists()){ // 파일이 존재하지 않으면
			file.createNewFile(); // 신규생성
		}
		BufferedReader reader = new BufferedReader(new FileReader(file));

		String str = "";

		str = reader.readLine();

		reader.close();

		if(null==str) {
			str="";
		}

		ArrayList<BeforeReadChatings> brc = chatingService.selectreadYetChatings(roomAdd);

		System.out.println(brc);

		int read = 0;
		for(BeforeReadChatings msg : brc) {
			if(msg.getFromMember().equals(c.getMembertNickName()) && !(msg.getReadCheck().equals(msg.getToMember()))) {
				str+=msg.getContent()+"<small class=\"ReadCheck\">1</small>";
				System.out.println("11");
			} 
			if(msg.getFromMember().equals(c.getMembertNickName()) && msg.getReadCheck().equals(msg.getToMember())){
				read=1;
				str+=msg.getContent()+"<small class=\"ReadCheck\"></small>";
				System.out.println("12");
			}
			if(msg.getToMember().equals(c.getMembertNickName()) && !(msg.getReadCheck().equals(msg.getToMember()))){
				str+=msg.getContent()+"<small class=\"ReadCheck\"></small>";
				readedChating(c);
				chatingService.countReadYetChatings(c);
				System.out.println("13");
			}
		}
		if(read==1) {
			readedChating(c);
			chatingService.removeReadChat(c);
			System.out.println("14");
		}
		AcceptCondition ac = chatingService.selectAcceptStatus(c);

		ArrayList<AddPriceAndReason> suggestList = chatingService.selectCondition(c);
		JSONObject jObj = new JSONObject();
		
		if(!suggestList.isEmpty()) {
			System.out.println("***********");
			System.out.println(suggestList);
			jObj.put("priceAndTtile",suggestList);
		}
		jObj.put("ac",ac);
		jObj.put("str",str);

		return jObj;
	}

	@ResponseBody
	@RequestMapping(value="insertReasonPrice.co",produces="application/json; charset=UTF-8")
	public int insertReasonPrice(AddPriceAndReason apar){

		System.out.println(apar);

		String [] priceArr = apar.getAddPrices().split(",");
		String [] requestArr = apar.getRequest().split(",");

		ArrayList<AddPriceAndReason> list = new ArrayList<AddPriceAndReason>();

		for(int i = 0; i < priceArr.length; i++) {
			AddPriceAndReason a = new AddPriceAndReason();
			a.setRoomName(apar.getRoomName());
			a.setBoardNo(apar.getBoardNo());
			a.setAddPrices(priceArr[i]);
			a.setRequest(requestArr[i]);
			list.add(a);
		}

		System.out.println(list);

		Chating c = new Chating();
		c.setBoardNo(apar.getBoardNo());
		c.setRoomName(apar.getRoomName());
		if(chatingService.selectAcceptStatus(c)==null) {
			chatingService.insertAcceptCondition(apar);
		}

		return chatingService.insertReasonPrice(list);

	}

	@RequestMapping("checkCondition.co")
	public ModelAndView selectCondition(HttpSession session, 
										String roomName, 
										int artistNo, 
										AddPriceAndReason apn, 
										ModelAndView mv, 
										String noMoreCon,
										String artistNickName){

		System.out.println(noMoreCon);/**/
		
		Chating c = new Chating();
		
		c.setRoomName(roomName);
		c.setBoardNo(apn.getBoardNo());
		
		ArrayList<AddPriceAndReason> apan = chatingService.selectCondition(c);


		AcceptCondition ac = chatingService.selectAcceptStatus(c);

		if(ac==null) {
			session.setAttribute("loginMember", (Member)session.getAttribute("loginMember"));

			mv.addObject("session",session.getAttribute("loginMember"))
			.setViewName("redirect:chating.co?alreadyReject=1");
			return mv;
		}
		System.out.println(ac);
		System.out.println(apan);
		System.out.println("artistNo"+artistNo);

		mv.addObject("suggestList",apan)
		.addObject("artistNickName",artistNickName)
		.addObject("boardNo",apn.getBoardNo())
		.addObject("artistNo",artistNo)
		.addObject("roomName",roomName)
		.addObject("ac",ac)
		.setViewName("chating/getSuggest");

		return mv;
	}

	@RequestMapping("removeCondition")
	public String removeCondition(Model m, int[] rejectList, Chating c) {
		chatingService.deletePriceAndReason(rejectList);
		chatingService.deleteAcceptCondition(c);
		return "redirect:chating.co";
	}

	@ResponseBody
	@RequestMapping(value="updatetAcceptCondition.co", produces="application/text; charset=UTF-8")
	public String updatetAcceptCondition(Chating c) {

		String result="";

		if(chatingService.updatetAcceptCondition(c)==1) {
			System.out.println("*"+c);
			AcceptCondition ac = chatingService.selectAcceptStatus(c);
			System.out.println("*"+ac);
			if("Y".equals(ac.getMemberCheck()) && "Y".equals(ac.getArtistCheck())) {
				result="Y";
			}
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="suggest.co", produces="application/text; charset=UTF-8")
	public String selectAcceptCondition(Chating c) {
		
		AcceptCondition ac = chatingService.selectAcceptStatus(c);
		
		if(ac!=null) {
			if(ac.getArtistCheck().equals("Y") && ac.getMemberCheck().equals("Y")) {
				return "Y";
			}else {
				return "N";
			}
		}
		return "N";
	}
}
