package com.kh.wonderPick.kakao.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.chatting.model.vo.Chating;

@Controller
public class KakaoController {

   private static String adminKey="dd6db63f7631e5beb16f354129463995";
   private String tid;
   @ResponseBody
   @RequestMapping(value="kakaoPay.ko", produces="application/json; charset=UTF-8")
   public String kakaoPay(Chating c, String item_name, String quantity, String total_amount, Model model) throws IOException {
	
	  System.out.println(c);
	  URL kakaoAddress = new URL("https://kapi.kakao.com/v1/payment/ready");
      HttpURLConnection connectServer = (HttpURLConnection)kakaoAddress.openConnection();
      connectServer.setRequestMethod("POST");
      connectServer.setRequestProperty("Authorization","KakaoAK "+adminKey);
      connectServer.setRequestProperty("Content-type","application/x-www-form-urlencoded; charset=UTF-8");

      connectServer.setDoOutput(true);

      String param = "cid=TC0ONETIME";
      param +="&partner_order_id=partner_order_id";
      param +="&partner_user_id=partner_user_id";
      param +="&item_name="+item_name;
      param +="&quantity="+quantity;
      param +="&total_amount="+total_amount;
      param +="&tax_free_amount=0";
      param +="&approval_url=http://localhost:8010/wonderPick/success?roomName="+c.getRoomName()+"&membertNickName="+c.getMembertNickName()+"&artistNickName"+c.getArtistNickName();
      param +="&fail_url=http://localhost:8010/wonderPick";
      param +="&cancel_url=http://localhost:8010/wonderPick";
      System.out.println(param);

      OutputStream output  = connectServer.getOutputStream();
      DataOutputStream dos = new DataOutputStream(output);
      dos.writeBytes(param);
      dos.flush();
      dos.close();

      int result = connectServer.getResponseCode();

      InputStream input;
      if(result==200) {
         input = connectServer.getInputStream();
      }else {
         input = connectServer.getErrorStream();
      }
      InputStreamReader reader = new InputStreamReader(input);
      BufferedReader bufferedReader = new BufferedReader(reader);

      String responseText = bufferedReader.readLine();
      System.out.println(responseText);
      String [] tidArr = responseText.substring(responseText.indexOf("tid")).split(",");
      
      for(int i = 0; i < tidArr.length; i++) {
         if(i==0) {
            for(String j : tidArr[i].split(":")) {
               if(!"id".equals(j.substring(1, j.length()-1))) {
                  tid=j.substring(1, j.length()-1);
               }
            }
            
         }
      }
      return responseText;
   }

   @RequestMapping("success")
   public ModelAndView kakaoPayApprove(String pg_token, ModelAndView mv,Chating c) throws IOException {
	   
	  System.out.println("hihi");
	  System.out.println(c);
      URL url = new URL("https://kapi.kakao.com/v1/payment/approve");

      HttpURLConnection connectServer = (HttpURLConnection) url.openConnection(); 

      connectServer.setRequestMethod("POST");
      connectServer.setRequestProperty("Authorization","KakaoAK "+adminKey);
      connectServer.setRequestProperty("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
      connectServer.setDoOutput(true);
      
      String param = "cid=TC0ONETIME";
      param +="&tid="+tid;
      param +="&partner_order_id=partner_order_id";
      param +="&partner_user_id=partner_user_id";
      param +="&pg_token="+pg_token;
      System.out.println(param);

      OutputStream output = connectServer.getOutputStream();
      DataOutputStream dos = new DataOutputStream(output);
      
      
      dos.writeBytes(param);
      dos.flush();
      dos.close();

      int result = connectServer.getResponseCode();

      InputStream input;
      if(result==200) {
         input = connectServer.getInputStream();
      }else {
         input = connectServer.getErrorStream();
      }
      
      InputStreamReader reader = new InputStreamReader(input);
      BufferedReader bufferedReader = new BufferedReader(reader);

      String responseText = bufferedReader.readLine();

      mv.addObject("responseText",responseText)
      .addObject("c",c)
      .setViewName("chating/successPay");
      return mv;

   }
}