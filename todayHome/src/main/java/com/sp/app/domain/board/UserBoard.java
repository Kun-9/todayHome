package com.sp.app.domain.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class UserBoard {
    private Long userBoardId;
    private Long memberId;
	private List<Long> categoryId;
    private String subject;
    private String createdDate;
	private String ipAddress;
	private int hitCount;
	private int boardType;
	private int replyCount;
	private int boardLikeCount;
	private int boardScrapCount;
	private String imgName;
	private String nickName;
	private String profileImgName;
	
	private Long userBoardContentId;
	private Long userBoardContentCategoryId;
	private String content;
	private int contentSequence;
	private List<MultipartFile> addFiles;
	
	private MultipartFile thumbnailFile;
	
	private Long productId;
	private float xCoordinate;
	private float yCoordinate;
	private Long discountedPrice;
	private String productName;
	private String brandName;
	private String saveName;
	private String sellerId;
	private Long price;
	
	

	public UserBoard() {
		
	}



	public Long getUserBoardId() {
		return userBoardId;
	}



	public void setUserBoardId(Long userBoardId) {
		this.userBoardId = userBoardId;
	}



	public Long getMemberId() {
		return memberId;
	}



	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}



	public List<Long> getCategoryId() {
		return categoryId;
	}



	public void setCategoryId(List<Long> categoryId) {
		this.categoryId = categoryId;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}



	public String getIpAddress() {
		return ipAddress;
	}



	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}



	public int getHitCount() {
		return hitCount;
	}



	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}



	public int getBoardType() {
		return boardType;
	}



	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}



	public int getReplyCount() {
		return replyCount;
	}



	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}



	public int getBoardLikeCount() {
		return boardLikeCount;
	}



	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}



	public int getBoardScrapCount() {
		return boardScrapCount;
	}



	public void setBoardScrapCount(int boardScrapCount) {
		this.boardScrapCount = boardScrapCount;
	}



	public String getImgName() {
		return imgName;
	}



	public void setImgName(String imgName) {
		this.imgName = imgName;
	}



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public String getProfileImgName() {
		return profileImgName;
	}



	public void setProfileImgName(String profileImgName) {
		this.profileImgName = profileImgName;
	}



	public Long getUserBoardContentId() {
		return userBoardContentId;
	}



	public void setUserBoardContentId(Long userBoardContentId) {
		this.userBoardContentId = userBoardContentId;
	}



	public Long getUserBoardContentCategoryId() {
		return userBoardContentCategoryId;
	}



	public void setUserBoardContentCategoryId(Long userBoardContentCategoryId) {
		this.userBoardContentCategoryId = userBoardContentCategoryId;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public int getContentSequence() {
		return contentSequence;
	}



	public void setContentSequence(int contentSequence) {
		this.contentSequence = contentSequence;
	}



	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}



	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}



	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}



	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}



	public Long getProductId() {
		return productId;
	}



	public void setProductId(Long productId) {
		this.productId = productId;
	}



	public float getxCoordinate() {
		return xCoordinate;
	}



	public void setxCoordinate(float xCoordinate) {
		this.xCoordinate = xCoordinate;
	}



	public float getyCoordinate() {
		return yCoordinate;
	}



	public void setyCoordinate(float yCoordinate) {
		this.yCoordinate = yCoordinate;
	}



	public Long getDiscountedPrice() {
		return discountedPrice;
	}



	public void setDiscountedPrice(Long discountedPrice) {
		this.discountedPrice = discountedPrice;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getBrandName() {
		return brandName;
	}



	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}



	public String getSaveName() {
		return saveName;
	}



	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}



	public String getSellerId() {
		return sellerId;
	}



	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}



	public Long getPrice() {
		return price;
	}



	public void setPrice(Long price) {
		this.price = price;
	}
	
	
	

	
	

}
