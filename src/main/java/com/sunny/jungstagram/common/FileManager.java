package com.sunny.jungstagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	public final static String FILE_UPLOAD_PATH = "C:\\Study\\6_spring_project_info\\upload\\sns";
	// 파일 저장하기
	public static String saveFile(int userId, MultipartFile imageFile) {
		
		if (imageFile == null) {
			return null;
		}
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis();
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		
		if (!directory.mkdir()) {
			return null;
		}
		
		String filePath = directoryPath + "/" + imageFile.getOriginalFilename();
		
		try {
			byte[] bytes = imageFile.getBytes();
			
			// 경로를 관리하는 객체로 만들어서 담아준다
			Path path = Paths.get(filePath);
			Files.write(path , bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			return null;
		}
		
		return "/images" + directoryName + "/" + imageFile.getOriginalFilename(); 
	}
	
	// 이미지 파일 삭제하기
	public static boolean removeFiles(String filePath){
		
		// 이미지 파일 경로에서 /images 제거 후 upload 경로를 이어 붙여 준다.
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", ""); 
		
		// 사용법 익히기
		Path path = Paths.get(fullFilePath);
		
		// 삭제할 파일이 있는지 확인하고 삭제
		if (Files.exists(path)) {
			
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		// 저장된 이미지 파일 디렉토리도 삭제
		Path directoryPath = path.getParent();
		
		// 디렉토리가 존재하는지 확인하고 삭제
		if (Files.exists(directoryPath)) {
			
			try {
				Files.delete(directoryPath);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		return true;
	}
}
