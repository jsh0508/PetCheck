package com.petcheck.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InviteVO {
	private String sender;
	private String receiver;
	private String diary_key;
	private String name;
}
