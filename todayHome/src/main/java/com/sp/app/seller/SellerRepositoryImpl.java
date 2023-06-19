package com.sp.app.seller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sp.app.common.CommonDAO;
import com.sp.app.domain.seller.Seller;

@Repository
public class SellerRepositoryImpl implements SellerRepository{
	
	@Autowired
	private CommonDAO commonDAO;
	
	@Override
	public void createSeller(Seller seller) throws Exception {
		commonDAO.insertData("seller.insertSeller", seller);
		
	}

	@Override
	public void updateSeller(Seller seller) throws Exception{
		commonDAO.updateData("seller.updateSeller", seller);
		
	}

	@Override
	public void getSellerStatus(Long sellerId) throws Exception{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSeller(Long sellerId) throws Exception{
		commonDAO.deleteData("seller.deleteSeller", sellerId);
		
	}

	@Override
	public List<Seller> getSellersByRating(int rating) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setDeliveryNumber(Long orderId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSellerStatus(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Seller> getSellersByCondition(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(int status) throws Exception {
		try {
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return 0;
	}

}
