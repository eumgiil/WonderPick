package com.kh.wonderPick.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wonderPick.board.contestBoard.model.vo.Search;
import com.kh.wonderPick.board.goods.model.service.GoodsService;
import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.common.template.Pagination;
import com.kh.wonderPick.search.model.service.SearchService;

@Controller
public class SearchController {
	

	@Autowired
	private SearchService searchService;
	
		
		@ResponseBody
		@RequestMapping(value="searchAutoComplet", produces="application/json; charset=UTF-8")
		public String searchAutoComplet(String searchValue) {
			
			
			System.out.println(searchValue);
			
			
			if(searchValue.equals("")) {
				int gap = 0;
				return new Gson().toJson(gap);
				
			}else {
				ArrayList<Search> list = searchService.searchAutoComplet(searchValue);
				if(list.isEmpty()){
					int empty = 0;
					return new Gson().toJson(empty);
				}else {
					return new Gson().toJson(list);
				}
			}
			
		}
		@RequestMapping("searchArtResult.ct")
		public String searchContestResult(String keyword, Model model) {
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("list", searchService.searchArtResult(keyword));
			
			return "board/contestBoard/searchArtResult";
		}
		
		@ResponseBody
		@RequestMapping(value="searchGoodsResult.ct", produces="application/json; charset=UTF-8")
		public String searchGoodsResult(String keyword) {
			
			return new Gson().toJson(searchService.searchGoodsResult(keyword));
		}
		
		@ResponseBody
		@RequestMapping(value="searchContestResult.ct", produces="application/json; charset=UTF-8")
		public String searchContestResult(String keyword) {
			
			return new Gson().toJson(searchService.searchContestResult(keyword));
		}



}
