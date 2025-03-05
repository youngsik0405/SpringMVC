/*====================
	IGradeDAO.java
=====================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
	// 성적 리스트 확인
	public ArrayList<GradeDTO> list();
	
	// 성적 데이터 확인
	// → sid 를 활용하여 성적 데이터를 조회
	public GradeDTO search(String sid);
	
	// 성적 데이터 입력
	public int add(GradeDTO g);
	
	// 성적 데이터 수정
	public int update(GradeDTO g);
	
	// 성적 데이터 삭제
	public int delete(String sid);
}
