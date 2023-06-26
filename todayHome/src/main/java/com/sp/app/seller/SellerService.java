package com.sp.app.seller;

import java.util.List; 
import java.util.Map;

import com.sp.app.domain.seller.Seller;

public interface SellerService {
    // 판매자 생성 ok
	void createSeller(Seller seller) throws Exception;
    
    // 판매자 수정 
   	void updateSeller(Seller seller) throws Exception;
    
    // 판매자 상태 조회 
   	Seller getSellerStatus(Long sellerId) throws Exception;
    
   	//판매자 상태 수정 
   	void updateSellerStatus(Seller seller) throws Exception;

    // 판매자 리스트 반환  
    List<Seller> getSellersByCondition(Map<String, Object> map) throws Exception;
    
    //판매자 상태가 0,1,2,3 인 사람 각각 카운트. 
    int getSellerCountByStatus(int status) throws Exception;
    
  //판매자 아이디로 판매자 조회
    Seller getSellerBySellerId(Long sellerId) throws Exception;
}
