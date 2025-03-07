/*=====================
	FileManager.java
======================*/

package com.test.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;


public class FileManager
{
	// 파일 다운로드 기능 수행
	// - saveFileName : 서버에 저장된 파일 이름
	// - orginalFileName : 클라이언트가 업로드한 파일 이름
	// - path :  서버에 저장된 경로
	// - response : HttpServletResponse
	public static boolean doFileDownload(String saveFileName, String orginalFileName, String path
								, HttpServletResponse response)
	{
		boolean result = false;
		
		String loadDir = path + File.separator + saveFileName;
		
		// 확인
		System.out.println(loadDir);
		
		try
		{
			// 
			if (orginalFileName == null || orginalFileName.equals(""))
			{
				orginalFileName = saveFileName;
			}
			
			orginalFileName = new String(orginalFileName.getBytes("EUC-KR"), "8859-1");
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		try
		{
			File file = new File(loadDir);
			
			if (file.exists())
			{
				byte[] readByte = new byte[4*1024];		// 4096b == 4kb
				
				response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition", "attachment;filename=" + orginalFileName);
				
				// BufferedInputStream 으로 감싼 FileInputStream 객체
				BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file));
				
				OutputStream os = response.getOutputStream();
				
				int read;
				while ((read=fis.read(readByte, 0, 4096)) != -1)
				{
					os.write(readByte, 0, read);
				}
				
				// 리소스 반납
				os.flush();
				os.close();
				fis.close();
				
				// 파일이 존재할 경우 true 반환
				//return true;
				result = true;
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 파일이 존재하지 않아 정상적인 처리가 이루어지지 않을 경우 false 반환
		//return false;
		//result = false;
		
		return result;
		
	}
	
	// 실제 물리적 파일 삭제 기능 수행
	// - fileName : 파일 이름
	// - path : 경로
	public static void doFileDelete(String fileName, String path)
	{
		try
		{
			File file = null;
			
			String fullFileName = path + File.separator + fileName;
			file = new File(fullFileName);
			
			if (file.exists())
				file.delete();
			{
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
}
