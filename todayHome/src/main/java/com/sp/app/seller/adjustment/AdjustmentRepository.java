package com.sp.app.seller.adjustment;

import java.util.List;
import java.util.Map;

import com.sp.app.domain.seller.SellerAdjustment;

public interface AdjustmentRepository {
    // 모든 정산 목록 반환 ok 
    List<SellerAdjustment> getAllAdjustments(int offset,int size, String startDate,String endDate, String keyword,String condition) throws Exception;

    // 정산 아이디로 정산 반환(필요 없을듯) ok
    List<SellerAdjustment> getAdjustmentByAdjustmentId(Long adjustmentId) throws Exception;

    // 판매자 아이디로 정산 목록 반환 ok
    List<SellerAdjustment> getAdjustmentsBySellerId(Long sellerId) throws Exception;

    // 정산 기록 생성 ok
   void createAdjustment(SellerAdjustment adjustment) throws Exception;

    // 정산 기록 수정(필요 없을듯) ok
   void  updateAdjustment(SellerAdjustment adjustment) throws Exception;
   
   //정산 카운트
   int adjustmentCount(String startDate,String endDate, String keyword,String condition) throws Exception;

}

