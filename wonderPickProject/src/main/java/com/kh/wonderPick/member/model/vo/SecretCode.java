package com.kh.wonderPick.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class SecretCode {
	private String who, secret, when;
}
