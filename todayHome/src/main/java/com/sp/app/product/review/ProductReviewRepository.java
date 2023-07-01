package com.sp.app.product.review;


import com.sp.app.domain.product.ProductReview;
import com.sp.app.domain.product.ReviewProduct;

import java.util.List;

public interface ProductReviewRepository {
	void createReview(ProductReview productReview) throws Exception;

	void updateReview(ProductReview productReview) throws Exception;

	void deleteReview(Long memberId, Long orderItemId) throws Exception;

	List<ProductReview> findReviewsByMemberId(Long memberId) throws Exception;

	List<ProductReview> findReviewsByProductId(Long productId) throws Exception;

	Float getAverageRatingByProductId(Long productId) throws Exception;

	List<ProductReview> getComposableProductList(Long memberId) throws Exception;
}
