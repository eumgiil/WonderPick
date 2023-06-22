package com.kh.wonderPick.search.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.contestBoard.model.vo.Contest;
import com.kh.wonderPick.board.contestBoard.model.vo.Search;
import com.kh.wonderPick.board.goods.model.vo.Goods;

public interface SearchService {
	ArrayList<Search> searchAutoComplet(String searchValue);

	ArrayList<ArtBoardDTO> searchArtResult(String keyword);

	ArrayList<Goods> searchGoodsResult(String keyword);

	ArrayList<Contest> searchContestResult(String keyword);

}
