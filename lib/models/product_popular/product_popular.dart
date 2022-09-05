import 'package:collection/collection.dart';

import 'product_list.dart';

class ProductPopular {
	List<ProductList>? productList;

	ProductPopular({this.productList});

	@override
	String toString() => 'ProductPopular(productList: $productList)';

	factory ProductPopular.fromJson(Map<String, dynamic> json) {
		return ProductPopular(
			productList: (json['product_list'] as List<dynamic>?)
						?.map((e) => ProductList.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'product_list': productList?.map((e) => e.toJson()).toList(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! ProductPopular) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => productList.hashCode;
}
