package com.petcheck.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Diary {
	
	private int idx;
	private String title;
	private String start_at;
	private String end_at;

}
