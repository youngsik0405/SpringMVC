/*=====================
	IMemberDAO.java
	- 인터페이스
======================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	/* insert */
	public int add(MemberDTO m);
	
	/* select */
	public int count();
	
	/* select */
	public ArrayList<MemberDTO> list();
	
	/* delete */
	/* 삭제 기능 처리 → remove */
	public int remove(int mid);
}
