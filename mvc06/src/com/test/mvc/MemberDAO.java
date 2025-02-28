/*=====================
   MemberDAO.java
======================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO
{
   // 주요 속성 구성 → Connection
   private Connection conn;
   
   // 데이터베이스 연결
   public void connection() throws ClassNotFoundException, SQLException
   {
      conn = DBconn.getConnection();
   }
   
   // 데이터베이스 연결 해제
   public void close() throws SQLException
   {
      DBconn.close();
   }
   
   // 멤버 리스트 조회
   public ArrayList<MemberDTO> list() throws SQLException
   {
      ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
      
      Statement stmt = conn.createStatement();
      String sql = "SELECT ID, PW, NAME, TEL, EMAIL"
            + " FROM TBL_MEMBERLIST";
      
      ResultSet rs = stmt.executeQuery(sql);
      
      while(rs.next())
      {
         MemberDTO dto = new MemberDTO();
         
         dto.setId(rs.getString("ID"));
         dto.setPw(rs.getString("PW"));
         dto.setName(rs.getString("NAME"));
         dto.setTel(rs.getString("TEL"));
         dto.setEmail(rs.getString("EMAIL"));
         
         result.add(dto);
      }
      
      rs.close();
      stmt.close();
      conn.close();
      
      return result;
   }
   
   // 멤버 데이터 입력(멤버 등록)
   public int insertQuery(MemberDTO dto) throws SQLException
   {
      int result = 0;
      
      String sql = "INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)"
            + " VALUES(?, CRYPTPACK.ENCRYPT(?, ?), ?, ?, ?)";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, dto.getId());
      pstmt.setString(2, dto.getPw());
      pstmt.setString(3, dto.getPw());
      pstmt.setString(4, dto.getName());
      pstmt.setString(5, dto.getTel());
      pstmt.setString(6, dto.getEmail());
      
      result = pstmt.executeUpdate();
      
      pstmt.close();
      conn.close();
      
      return result;
      
   }
   
}
